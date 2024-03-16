import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/providers/expense_provider.dart';
import 'package:eclub/app/providers/general_expense_provider.dart';
import 'package:eclub/app/providers/movement_provider.dart';
import 'package:eclub/app/services/expense_service.dart';
import 'package:eclub/app/services/movement_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'app/routes/app_routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovementProvider>(
          create: (_) => MovementProvider(MovementService()),
        ),
        ChangeNotifierProvider<ExpenseProvider>(
          create: (_) => ExpenseProvider(ExpenseService()),
        ),
        ChangeNotifierProvider<GeneralExpenseProvider>(
          create: (_) => GeneralExpenseProvider(ExpenseService()),
        )
      ],
      child: MaterialApp(
        title: 'eCLUB',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            background: AppColors.background,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
        initialRoute: 'home',
      ),
    );
  }
}
