class LotteryResult {
  final int userNumber;
  final int winningNumber;
  final bool isWinner;

  const LotteryResult({
    required this.userNumber,
    required this.winningNumber,
    required this.isWinner,
  });
}