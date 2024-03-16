import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs; // Lista de títulos de las pestañas
  final Function(int)
      onTabTap; // Función llamada cuando se selecciona una pestaña
  const CustomTabBar({super.key, required this.tabs, required this.onTabTap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      // Permite desplazar las pestañas horizontalmente si es necesario
      isScrollable: true,
      dividerHeight: 0.00, // Altura del divisor entre las pestañas
      padding: EdgeInsets.zero, // Pading de las pestañas
      tabAlignment:
          TabAlignment.start, // Alineación de los textos de las pestañas
      // Pading del texto de la pestaña seleccionada
      labelPadding:
          const EdgeInsetsDirectional.symmetric(vertical: 2.5, horizontal: 8.0),
      // Pading del indicador de selección de la pestaña
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      // Tamaño del indicador de selección de la pestaña
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 2.0, // Grosor del indicador de selección de la pestaña
      // Color de superposición al tocar una pestaña
      overlayColor: MaterialStateProperty.all(AppColors.background),
      // Estilo del texto de las pestañas no seleccionadas
      unselectedLabelStyle: AppTextStyle.labelMedium,
      // Estilo del texto de la pestaña seleccionada
      labelStyle: AppTextStyle.labelMedium,
      tabs: [for (var tab in tabs) Text(tab)], // Lista de pestañas
      onTap: (tabIndex) {
        // Callback cuando se toca una pestaña
        onTabTap(tabIndex);
      },
    );
  }
}
