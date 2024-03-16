import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/constants/app_text_style.dart';
import 'package:eclub/app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MovementCard extends StatelessWidget {
  final String amount; // Monto de la transacción
  final String description; // Descripción de la transacción
  final String location; // Ubicación de la transacción

  const MovementCard({
    super.key,
    required this.amount,
    required this.description,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .35, // Altura del contenedor
      decoration: BoxDecoration(
        // Decoración del contenedor con gradiente de colores
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [AppColors.top, AppColors.middle, AppColors.bottom],
        ),
        // Bordes redondeados en la parte inferior
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
          // Barra de navegación personalizada
          const CustomAppBar(
            title: "Movimientos",
            showBackButton: true,
            iconsLigth: true,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Contenedor para la descripción y ubicación de la transacción
                Container(
                  height: MediaQuery.of(context).size.height * .06,
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .16,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Texto de la descripción de la transacción
                      Text(
                        description,
                        style: AppTextStyle.labelLarge.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      // Texto de la ubicación de la transacción
                      Text(
                        location,
                        style: AppTextStyle.labelLarge.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                // Texto del monto de la transacción
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                  child: Text(
                    amount,
                    style: AppTextStyle.labelLarge.copyWith(
                      color: AppColors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
