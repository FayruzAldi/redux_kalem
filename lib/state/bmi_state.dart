class BMIState {
  final double height;
  final double weight;
  final double bmi;

  BMIState({required this.height, required this.weight, required this.bmi});

  factory BMIState.initial() {
    return BMIState(height: 0, weight: 0, bmi: 0);
  }
}