class CalculatorState {
  final double bmi;
  final double arithmeticResult;
  final double squareArea;
  final double triangleArea;
  final double circleArea;

  CalculatorState({
    this.bmi = 0.0,
    this.arithmeticResult = 0.0,
    this.squareArea = 0.0,
    this.triangleArea = 0.0,
    this.circleArea = 0.0,
  });

  CalculatorState copyWith({
    double? bmi,
    double? arithmeticResult,
    double? squareArea,
    double? triangleArea,
    double? circleArea,
  }) {
    return CalculatorState(
      bmi: bmi ?? this.bmi,
      arithmeticResult: arithmeticResult ?? this.arithmeticResult,
      squareArea: squareArea ?? this.squareArea,
      triangleArea: triangleArea ?? this.triangleArea,
      circleArea: circleArea ?? this.circleArea,
    );
  }
}
