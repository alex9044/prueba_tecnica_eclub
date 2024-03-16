import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/constants/app_text_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomChartExpense extends StatelessWidget {
  // Función para manejar la acción cuando se presiona una sección del gráfico
  final Function(int)? onSectionPressed;
  final String amount; // Cantidad total mostrada en el gráfico
  final String title; // Título mostrado en el gráfico
  // Lista de datos de las secciones del gráfico
  final List<PieChartSectionData> sections;
  final Color centerColor; // Color del centro del gráfico
  const CustomChartExpense({
    super.key,
    this.onSectionPressed,
    required this.amount,
    required this.title,
    required this.sections,
    required this.centerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Altura del contenedor del gráfico
      height: MediaQuery.of(context).size.height * .38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: AppColors.lightPink, blurRadius: 20.0)
        ], // Sombra del contenedor
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            // Gráfico de torta
            PieChartData(
              startDegreeOffset: 270,
              sectionsSpace: 0.00,
              centerSpaceRadius: sections.isEmpty ? 0.00 : null,
              centerSpaceColor: centerColor,
              pieTouchData: onSectionPressed != null
                  ? PieTouchData(
                      touchCallback: (flTouchEvent, pietouchResponse) {
                      if (pietouchResponse != null) {
                        final sectionIndex = pietouchResponse
                            .touchedSection!.touchedSectionIndex;
                        // Llama a la función cuando se toca una sección del gráfico
                        onSectionPressed!(sectionIndex);
                      }
                    })
                  : null,
              sections: sections,
            ),
          ),
          Positioned(
            bottom: 0.00,
            top: 0.00,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title, // Título mostrado en el gráfico
                  style: AppTextStyle.labelMedium,
                ),
                Text(
                  amount, // Cantidad total mostrada en el gráfico
                  style: AppTextStyle.labelLarge.copyWith(
                    color: AppColors.primary,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomChartSection extends PieChartSectionData {
  CustomChartSection({
    required BuildContext context,
    required Color color,
    required double value,
    Function? onSectionTap,
    String? iconPath,
  }) : super(
          // Valor de la sección (grados)
          value: value == 0.00 ? 0.01 : value * 360,
          color: color, // Color de la sección
          showTitle: false,
          // Radio de la sección
          radius: MediaQuery.of(context).size.width * .13,
          // Widget de insignia (icono)
          badgeWidget: (iconPath != null && value != 0.00)
              ? Image.asset(
                  iconPath,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * .08,
                )
              : null,
        );
}
