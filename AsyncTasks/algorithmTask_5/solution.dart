import 'dart:isolate';

Future<int> processElement(int value) async {
  await Future.delayed(Duration(seconds: 1));
  return value * 2;
}

Future<List<int>> parallelProcessing(List<int> data) async {
  final isolateCount = 2;
  final chunkSize = (data.length ~/ isolateCount);

  List<Isolate> isolates = [];
  List<ReceivePort> receivePorts = [];

  for (var i = 0; i < isolateCount; i++) {
    final start = i * chunkSize;
    final end = (i == isolateCount - 1) ? data.length : (i + 1) * chunkSize;
    final sublist = data.sublist(start, end);

    final receivePort = ReceivePort();
    receivePorts.add(receivePort);

    final isolate = await Isolate.spawn(
      isolateEntryPoint,
      IsolateData(sublist, receivePort.sendPort),
    );
    isolates.add(isolate);
  }

  List<int> results = [];

  for (var receivePort in receivePorts) {
    final result = await receivePort.first;
    results.addAll(result);
    receivePort.close();
  }

  for (var isolate in isolates) {
    isolate.kill();
  }

  return results;
}

class IsolateData {
  final List<int> sublist;
  final SendPort sendPort;

  IsolateData(this.sublist, this.sendPort);
}

void isolateEntryPoint(IsolateData isolateData) async {
  final sublist = isolateData.sublist;
  final sendPort = isolateData.sendPort;

  List<int> results = [];

  for (var value in sublist) {
    final result = await processElement(value);
    results.add(result);
  }

  sendPort.send(results);
}

void main() async {
  List<int> data = [2, 3, 4, 5, 25, 35];
  List<int> results = await parallelProcessing(data);
  print(results); // Ожидаемый результат: [4, 6, 8, 10, 50, 70]
}
