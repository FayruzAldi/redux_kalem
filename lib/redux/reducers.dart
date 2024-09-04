import 'actions.dart';
import 'appState.dart';

double calculateBMI(double height, double weight) {
  return weight / (height * height);
}

double calculateArithmetic(double num1, double num2, String operation) {
  switch (operation) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      return num1 / num2;
    default:
      return 0.0;
  }
}

double calculateShapeArea(double dimension1, double dimension2, String shape) {
  switch (shape) {
    case 'square':
      return dimension1 * dimension1;
    case 'triangle':
      return 0.5 * dimension1 * dimension2;
    case 'circle':
      return 3.14 * dimension1 * dimension1;
    default:
      return 0.0;
  }
}

AppState appReducer(AppState state, dynamic action) {
  if (action is CalculateBMI) {
    return state.copyWith(bmiResult: calculateBMI(action.height, action.weight));
  } else if (action is CalculateArithmetic) {
    return state.copyWith(arithmeticResult: calculateArithmetic(action.number1, action.number2, action.operation));
  } else if (action is CalculateShapeArea) {
    return state.copyWith(shapeAreaResult: calculateShapeArea(action.dimension1, action.dimension2, action.shape));
  }
  return state;
}
