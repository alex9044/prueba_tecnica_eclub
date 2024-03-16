import 'package:eclub/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EllipseTile extends StatelessWidget {
  final String category;
  const EllipseTile({super.key, required this.category});

  // Función para obtener el icono basado en la categoría
  String? getIconCategory(String category) {
    switch (category) {
      case 'Entretenimiento':
        return 'entertainment_icon.png';
      case 'Salud':
        return 'health_icon.png';
      case 'Transporte':
        return 'transport_icon.png';
      case 'Compras':
        return 'shopping_blue_icon.png';
      case 'Retiros':
        return 'withdraw_icon.png';
      case 'Restaurantes y bares':
        return 'food_tile_icon.png';
      default:
        null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.8,
      height: 35.8,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.alabaster, // Color del fondo del contenedor
        boxShadow: [
          BoxShadow(
            color: AppColors.coconutMilk, // Color de la sombra externa
            blurRadius: 40.0,
            spreadRadius: 0,
            offset: const Offset(0, 5),
          ),
          BoxShadow(color: AppColors.alabaster) // Color de la sombra interna
        ],
      ),
      child: Image.asset(
        'assets/icons/${getIconCategory(category)}', // Ruta del icono basada en la categoría
        fit: BoxFit.contain,
      ),
    );
  }
}
