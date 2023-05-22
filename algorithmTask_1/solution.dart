class Solution {
  int coinChange(List<int> coins, int amount) {
    if (amount == 0) return 0;

    coins.sort();
    List<int> resCounts = List.filled(amount + 1, -1);
    resCounts[0] = 0;

    for (int i = 1; i <= amount; i++) {
      // print ('iteration/sum= $i');
      for (int coin in coins) {
        // print ('coin $coin');
        // print ('start array $resCounts');
        if (coin > i) break;
        if (resCounts[i - coin] != -1) {
          if (resCounts[i] == -1 || resCounts[i - coin] + 1 < resCounts[i]) {
            resCounts[i] = resCounts[i - coin] + 1;
            // print ('finish array $resCounts');
          }
        }
      }
    }

    return resCounts[amount];
  }
}
