class AppState {
  final double bmiResult;
  final double arithmeticResult;
  final double shapeAreaResult;

  AppState({this.bmiResult = 0.0, this.arithmeticResult = 0.0, this.shapeAreaResult = 0.0});

  AppState copyWith({double? bmiResult, double? arithmeticResult, double? shapeAreaResult}) {
    return AppState(
      bmiResult: bmiResult ?? this.bmiResult,
      arithmeticResult: arithmeticResult ?? this.arithmeticResult,
      shapeAreaResult: shapeAreaResult ?? this.shapeAreaResult,
    );
  }
}
