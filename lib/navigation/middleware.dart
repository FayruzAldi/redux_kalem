import 'package:calculatorapp_redux/navigation/navigation_action.dart';
import 'package:calculatorapp_redux/redux/appState.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';


class NavigationMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is NavigateToBMI) {
      NavigationService().navigateTo('/bmi_calculator');
    } else if (action is NavigateToArithmetic) {
      NavigationService().navigateTo('/arithmetic_calculator');
    } else if (action is NavigateToGeometry) {
      NavigationService().navigateTo('/geometry_calculator');
    }
    next(action);
  }
}

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void navigateTo(String routeName) {
    navigatorKey.currentState?.pushNamed(routeName);
  }

  void navigateBack() {
    navigatorKey.currentState?.pop();
  }
}

