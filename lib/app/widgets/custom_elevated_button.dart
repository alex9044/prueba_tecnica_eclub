import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  // Función que se ejecutará cuando se presione el botón
  final Function onPressed;
  final String title; // Título del botón
  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Llama a la función onPressed cuando se presiona el botón
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, // Color de fondo del botón
        // Tamaño fijo del botón basado en el ancho de la pantalla
        fixedSize: Size(MediaQuery.of(context).size.width * .85, 55),
        // Forma del botón (borde redondeado)
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(
        title, // Texto del botón
        // Estilo del texto (color y tamaño)
        style: AppTextStyle.labelMedium.copyWith(color: AppColors.white),
      ),
    );
  }
}
