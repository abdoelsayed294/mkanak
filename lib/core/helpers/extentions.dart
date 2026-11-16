import 'package:flutter/material.dart';


extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    RoutePredicate? predicate,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      predicate ?? (route) => false,
      arguments: arguments,
    );
  }

  void pop([Object? result]) => Navigator.pop(this, result);
}


