import 'dart:async';

void main() async {
  print('1');

  Future(
    () {
      print('2');
    },
  );

  scheduleMicrotask(() => (print("3")));

  Future.delayed(
    Duration(milliseconds: 100),
    () {
      print('4');
    },
  );

  await Future(() {
    print('5');
  });

  Future.microtask(
    () {
      print('6');
    },
  );

  Future.delayed(
    Duration(milliseconds: 100),
    () {
      print('7');
    },
  );

  print('8'); //1, 3, 2, 5, 8, 6, 4, 7
}
