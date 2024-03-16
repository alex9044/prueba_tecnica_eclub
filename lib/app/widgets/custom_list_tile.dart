import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/constants/app_text_style.dart';
import 'package:eclub/app/widgets/custom_ellipse_tile.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title; // Título del list tile
  final String? subitle; // Subtítulo del list tile (opcional)
  final String trailing; // Texto de la parte derecha del list tile
  final String? subtrailing; // Texto adicional en la parte derecha (opcional)
  final String category; // Categoría del list tile
  final EdgeInsets padding; // Espaciado interno del list tile
  final Function?
      onTap; // Función a ejecutar al hacer tap en el list tile (opcional)

  const CustomListTile({
    super.key,
    required this.title,
    this.subitle,
    required this.trailing,
    this.subtrailing,
    required this.category,
    required this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: padding, // Espaciado interno del list tile
      leading: EllipseTile(
          category: category), // Widget de icono circular a la izquierda
      visualDensity: VisualDensity.compact,
      tileColor:
          Colors.transparent, // Color de fondo transparente del list tile
      dense: true,
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Texto en la parte derecha del list tile
          Text(
            trailing,
            style: AppTextStyle.labelSmall.copyWith(
                fontWeight:
                    subtrailing == null ? FontWeight.w400 : FontWeight.w600),
          ),
          // Texto adicional en la parte derecha (opcional)
          if (subtrailing != null)
            Text(
              subtrailing!,
              style:
                  AppTextStyle.labelSmall.copyWith(color: AppColors.mediumGray),
            ),
        ],
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título del list tile
          Text(
            title,
            style: AppTextStyle.labelSmall.copyWith(
                fontWeight:
                    subitle == null ? FontWeight.w400 : FontWeight.w600),
          ),
          // Subtítulo del list tile (opcional)
          if (subitle != null)
            Text(
              subitle!,
              style:
                  AppTextStyle.labelSmall.copyWith(color: AppColors.mediumGray),
            ),
        ],
      ),
      onTap: (onTap != null)
          ? () => onTap!()
          : null, // Función de onTap (opcional)
    );
  }
}
