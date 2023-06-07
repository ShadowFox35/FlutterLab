import 'dart:async';
import 'dart:math';

Stream<int> randomNumberGenerator(int min, int max) async* {
  final random = Random();
  while (true) {
    yield min + random.nextInt(max - min + 1);
    await Future.delayed(Duration(seconds: 1));
  }
}

void main() {
  final stream = randomNumberGenerator(1, 100);

  late StreamSubscription<int> subscription;
  subscription = stream.listen((number) {
    print('Generated number: $number');

    if (number >= 90) {
      subscription.cancel();
      print('Generation stopped.');
    }
  });
}
