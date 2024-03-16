import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String? title; // Título del AppBar
  // Booleano para mostrar o no el botón de retroceso
  final bool? showBackButton;
  final bool? iconsLigth; // Booleano para definir el tema de los iconos
  const CustomAppBar({
    super.key,
    this.title,
    this.showBackButton,
    this.iconsLigth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * .05,
        left: MediaQuery.of(context).size.width * .05,
        top: MediaQuery.of(context).padding.top +
            MediaQuery.of(context).size.height * .03,
        bottom: MediaQuery.of(context).size.height * .03,
      ),
      height: MediaQuery.of(context).size.height * .05,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Botón de retroceso si se establece la propiedad showBackButton como true
          if (showBackButton == true)
            Positioned(
              left: 0.00,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                visualDensity: VisualDensity.compact,
                highlightColor: AppColors.background,
                icon: SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .065,
                  child: Image.asset(
                    (iconsLigth != null && iconsLigth == true)
                        ? 'assets/icons/arrow_back_white.png'
                        : 'assets/icons/arrow_back_grey.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          // Título del AppBar o del logo si no se proporciona un título
          Align(
            alignment:
                title != null ? Alignment.center : Alignment.bottomCenter,
            child: title != null
                ? Text(
                    title!,
                    style: AppTextStyle.titleMedium.copyWith(
                        color: iconsLigth != null
                            ? AppColors.white
                            : AppColors.dimGrey),
                  )
                : SizedBox(
                    width: 62,
                    height: 17,
                    child: Image.asset('assets/icons/logo_ECLUB.png'),
                  ),
          ),
          // Botón de menú en el lado derecho del AppBar
          Positioned(
            right: MediaQuery.of(context).size.width * .0,
            child: IconButton(
              onPressed: () {},
              visualDensity: VisualDensity.compact,
              icon: SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                child: Image.asset(
                  (iconsLigth != null && iconsLigth == true)
                      ? 'assets/icons/menu_white.png'
                      : 'assets/icons/menu_grey.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
