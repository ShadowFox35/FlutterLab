class Solution {
  bool canFinish(int numCourses, List<List<int>> prerequisites) {
    List<List<int>> adjList = List.generate(numCourses, (index) => []);
    List<int> incEdges = List.filled(numCourses, 0);

    for (List<int> elem in prerequisites) {
      adjList[elem[1]].add(elem[0]);
      incEdges[elem[0]]++;
    }

    List<int> queue = [];
    for (int i = 0; i < numCourses; i++) {
      if (incEdges[i] == 0) {
        queue.add(i);
      }
    }

    int finishedCourses = 0;

    while (queue.isNotEmpty) {
      int curCourse = queue.removeAt(0);
      finishedCourses++;

      for (int nextCourse in adjList[curCourse]) {
        incEdges[nextCourse]--;
        if (incEdges[nextCourse] == 0) {
          queue.add(nextCourse);
        }
      }
    }

    return finishedCourses == numCourses;
  }
}

// tests:
// 
//void main() {
//   int numCourses = 2;
//   List<List<int>> prerequisites = [
//     [1, 0]
//   ];

//   bool result = canFinish(numCourses, prerequisites);
//   print(result); // Output: true

//   numCourses = 2;
//   prerequisites = [[1, 0], [0, 1]];

//   result = canFinish(numCourses, prerequisites);
//   print(result); // Output: false

//   int numCourses = 4;
//   List<List<int>> prerequisites = [
//     [1, 0],
//     [1, 2],
//     [3, 2],
//     [1, 3],
//     [2, 0]
//   ];

//   bool result = canFinish(numCourses, prerequisites);
//   print(result); // Output: true
// }
