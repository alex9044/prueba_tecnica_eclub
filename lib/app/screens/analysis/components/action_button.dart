import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String iconPath; // Ruta del icono
  final String title; // Título
  final Function onPressed; // Función a ejecutar al presionar el botón

  const ActionButton({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(), // Función a ejecutar al presionar el botón
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(130, 130), // Tamaño fijo del botón
        elevation: 0, // Sin elevación
        backgroundColor: AppColors.white, // Color de fondo del botón
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)), // Forma del botón
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icono de la acción
          SizedBox(
            height: 40.0,
            child: Image.asset(iconPath, fit: BoxFit.contain),
          ),
          const SizedBox(height: 12), // Espaciado entre el icono y el título
          // Título de la acción
          Text(
            title,
            style: AppTextStyle.labelMedium.copyWith(color: AppColors.deepPink),
          )
        ],
      ),
    );
  }
}
