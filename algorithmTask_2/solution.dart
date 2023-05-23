class Solution {
  int lengthOfLIS(List<int> nums) {
  List<int> dp = List.filled(nums.length, 1);
  for (int i = 1; i < nums.length; i++) {
    for (int j = 0; j < i; j++) {
      if (nums[i] > nums[j] && dp[j] + 1 > dp[i]) {
          dp[i] = dp[j] + 1;
      }
    }
  }
  dp.sort();
  return dp[nums.length-1];
  }
}