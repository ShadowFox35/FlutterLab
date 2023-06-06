// Parallel data processing

// Есть большой массив чисел, который требуется обработать. 
// Обработка каждого элемента включает выполнение длительной асинхронной операции (допустим, что умножение на 2 - длительная операция).

// Задача - реализовать механизм параллельной обработки элементов массива с использованием асинхронности, 
// чтобы ускорить выполнение операции. Кроме того, необходимо обеспечить правильный порядок обработки элементов 
// и получить результаты обработки для каждого элемента массива.

// Формат входных данных:
// Массив данных data, содержащий целые числа. 
// Длина массива любая.

// Формат выходных данных:
// Массив results, содержащий результаты обработки каждого элемента массива data. 
// Результаты должны быть в том же порядке, что и соответствующие элементы в исходном массиве data.

// Пример:

// Future<int> processElement(int value) async {
//   // Длительная асинхронная операция
//   await Future.delayed(Duration(seconds: 2));
//   return value * 2;
// }

// Future<List<int>> parallelProcessing(List<int> data) async {
//   // Реализовать механизм параллельной обработки элементов массива `data`
//   // и вернуть результаты обработки.
//   // Код здесь
// }

// Пример результата
//   data = [1, 2, 3, 4, 5];
//   print(results); // Ожидаемый вывод: [2, 4, 6, 8, 10]
// }