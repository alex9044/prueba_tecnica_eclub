import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/constants/app_text_style.dart';
import 'package:eclub/app/screens/analysis/components/action_button.dart';
import 'package:eclub/app/widgets/custom_app_bar.dart';
import 'package:eclub/app/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Appbar con título "Análisis"
          const CustomAppBar(
            title: 'Análisis',
            showBackButton: false,
          ),
          // Contenedor para el ícono grande de análisis
          Container(
            height: MediaQuery.of(context).size.height * .15,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .06,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.alabaster,
              boxShadow: [
                BoxShadow(
                  color: AppColors.coconutMilk,
                  blurRadius: 40.0,
                  spreadRadius: 0,
                  offset: const Offset(0, 5),
                ),
                BoxShadow(color: AppColors.alabaster),
              ],
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .08,
              child: Image.asset('assets/icons/analysis_large_icon.png'),
            ),
          ),
          // Texto "¿Qué deseas revisar?".
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .05),
            child: Text(
              "¿Qué deseas revisar?",
              style: AppTextStyle.titleLarge,
            ),
          ),
          // Fila de botones de acción: "Ingresos" y "Gastos"
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botón de acción para "Ingresos"
              ActionButton(
                iconPath: 'assets/icons/icome_icon.png',
                title: "Ingresos",
                onPressed: () {},
              ),
              // Espaciador entre los botones de acción
              SizedBox(
                width: MediaQuery.of(context).size.width * .06,
              ),
              // Botón de acción para "Gastos" que navega a la pantalla de gastos generales
              ActionButton(
                iconPath: 'assets/icons/expense_icon.png',
                title: "Gastos",
                onPressed: () =>
                    Navigator.pushNamed(context, 'general_expenses'),
              ),
            ],
          ),
        ],
      ),
      // Barra de navegación en la parte inferior de la pantalla
      bottomNavigationBar: const CustomNavigationBar(selectedIndex: 2),
    );
  }
}
