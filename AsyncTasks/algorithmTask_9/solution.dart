import 'dart:async';
import 'dart:math';

Stream<int> randomNumberGenerator(int min, int max) async* {
  final random = Random();
  while (true) {
    yield min + random.nextInt(max - min);
    await Future.delayed(Duration(seconds: 1));
  }
}

void main() {
  final stream = randomNumberGenerator(50, 100);

  late StreamSubscription<int> subscription;
  subscription = stream.listen((number) {
    print('Generated number: $number');

    if (number >= 90) {
      subscription.cancel();
      print('Generation stopped.');
    }
  });
}
