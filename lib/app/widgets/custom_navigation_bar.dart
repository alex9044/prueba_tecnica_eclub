import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex; // Índice de la pestaña seleccionada
  const CustomNavigationBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .1, // Altura del widget
      decoration: BoxDecoration(
        boxShadow: [
          // Sombra arriba del navbar
          BoxShadow(
              color: AppColors.coconutMilk,
              spreadRadius: 0,
              blurRadius: 20,
              offset: const Offset(0, -10)),
          BoxShadow(color: AppColors.alabaster),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Alineación cruzada
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Alineación principal
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, 'home'); // Navegar a la pantalla de inicio
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 20,
                    height: 21,
                    child: Image.asset(
                      selectedIndex != 0
                          ? 'assets/icons/home_vector.png'
                          : 'assets/icons/home_selected_vector.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("Inicio", // Etiqueta de la pestaña de inicio
                      style: AppTextStyle.labelSmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: selectedIndex != 0
                            ? AppColors.lightGrey
                            : AppColors.mediumGray,
                      ))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 21,
                    height: 21,
                    child: Image.asset(
                      'assets/icons/transfer_vector.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("Transferencias",
                      style: AppTextStyle.labelSmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGrey,
                      ))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, 'analysis'); // Navegar a la pantalla de análisis
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 20,
                    height: 21,
                    child: Image.asset(
                      selectedIndex != 2
                          ? 'assets/icons/analysis_vector.png'
                          : 'assets/icons/analysis_selected_vector.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("Análisis", // Etiqueta de la pestaña de análisis
                      style: AppTextStyle.labelSmall.copyWith(
                          fontWeight: FontWeight.w500,
                          color: selectedIndex != 2
                              ? AppColors.lightGrey
                              : AppColors.mediumGray))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 20,
                    height: 21,
                    child: Image.asset(
                      'assets/icons/account_vector.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("Cuenta",
                      style: AppTextStyle.labelSmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGrey,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
