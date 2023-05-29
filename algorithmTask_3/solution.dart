class Solution {
  bool canFinish(int numCourses, List<List<int>> prerequisites) {
    List<List<int>> adjacencyList = List.generate(numCourses, (index) => []);
    List<int> incomingEdges = List.filled(numCourses, 0);

    for (List<int> elem in prerequisites) {
      int course = elem[0];
      int neededCourse = elem[1];
      adjacencyList[neededCourse].add(course);
      incomingEdges[course]++;
    }

    List<int> queue = [];
    for (int i = 0; i < numCourses; i++) {
      if (incomingEdges[i] == 0) {
        queue.add(i);
      }
    }

    int finishedCourses = 0;

    while (queue.isNotEmpty) {
      int currentCourse = queue.removeAt(0);
      finishedCourses++;

      for (int nextCourse in adjacencyList[currentCourse]) {
        incomingEdges[nextCourse]--;
        if (incomingEdges[nextCourse] == 0) {
          queue.add(nextCourse);
        }
      }
    }

    return finishedCourses == numCourses;
  }
}

// void main() {
//   int numCourses = 2;
//   List<List<int>> prerequisites = [[1, 0]];

//   bool result = canFinish(numCourses, prerequisites);
//   print(result); // Output: true

//   numCourses = 2;
//   prerequisites = [[1, 0], [0, 1]];

//   result = canFinish(numCourses, prerequisites);
//   print(result); // Output: false
// }
