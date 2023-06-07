import 'dart:async';

Stream<List<int>> streamProcessing(List<int> data) async* {
  final chunkSize = 2;
  final chunks = <List<int>>[];

  for (int i = 0; i < data.length; i += chunkSize) {
    final end = (i + chunkSize < data.length) ? i + chunkSize : data.length;
    final sublist = data.sublist(i, end);
    chunks.add(sublist);
  }

  for (final chunk in chunks) {
    await Future.delayed(Duration(seconds: 1));
    chunk.add(100);
    yield chunk;
  }
}

Future<int> processElement(int value) async {
  await Future.delayed(Duration(seconds: 1));
  value = value * 2;
  return value;
}

void main() async {
  final data = [10, 20, 30, 40];
  final stream = streamProcessing(data);
  final processedData = await stream.asyncExpand((chunk) async* {
    final results = <int>[];
    for (int element in chunk) {
      element++;
      final value = await processElement(element);
      results.add(value * 3);
    }
    yield results;
  }).toList();
  print(processedData);

  final flattenedData = processedData.expand((list) => list).toList();

  print('Processed data: $flattenedData');
}
