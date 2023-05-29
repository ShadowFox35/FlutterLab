class Solution {
  int lengthOfLIS(List<int> nums) {
  List<int> incrSeq = List.filled(nums.length, 1);
  for (int i = 1; i < nums.length; i++) {
    for (int j = 0; j < i; j++) {
      if (nums[i] > nums[j] && incrSeq[j] + 1 > incrSeq[i]) {
          incrSeq[i] = incrSeq[j] + 1;
      }
    }
  }
  incrSeq.sort();
  return incrSeq[nums.length-1];
  }
}