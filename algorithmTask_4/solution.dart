int maxSubArray(List<int> nums) {
  int cur = nums[0];
  int max = nums[0];

  for (int i = 1; i < nums.length; i++) {
    cur = nums[i] > nums[i] + cur ? nums[i] : nums[i] + cur;
    max = cur > max ? cur : max;
  }

  return max;
}

void main() {
  List<int> nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
  int result = maxSubArray(nums);
  print(result); // Output: 6
}
