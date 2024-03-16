import 'package:eclub/app/screens/analysis/analysis_screen.dart';
import 'package:eclub/app/screens/expense/expense_datails_screen.dart';
import 'package:eclub/app/screens/expense/expense_screen.dart';
import 'package:eclub/app/screens/expense/general_expenses_screen.dart';
import 'package:eclub/app/screens/movement/movement_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return _getPageRoute(settings, const MovementScreen());
      case 'analysis':
        return _getPageRoute(settings, const AnalysisScreen());
      case 'general_expenses':
        return _getPageRoute(settings, const GeneralExpenseScreen());
      case 'expense':
        return _getPageRoute(settings, const ExpenseScreen());
      case 'expense_details':
        return _getPageRoute(settings, ExpenseDetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const MovementScreen());
    }
  }

  static PageRoute _getPageRoute(RouteSettings settings, Widget child) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => child,
    );
  }
}
