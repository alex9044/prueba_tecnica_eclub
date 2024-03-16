import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/constants/app_text_style.dart';
import 'package:eclub/app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final String balance; // El saldo a mostrar en la tarjeta.
  final Function
      onShowPressed; // Función cuando se presiona el botón para mostrar el saldo.
  const BalanceCard(
      {super.key, required this.balance, required this.onShowPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *
          .37, // Altura de la tarjeta basada en el tamaño de la pantalla.
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                AppColors.top,
                AppColors.middle,
                AppColors.bottom
              ] // Gradiente de colores para el fondo de la tarjeta.
              ),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(
                  25.0) // Bordes redondeados parte inferior de la tarjeta.
              )),
      child: Column(
        children: [
          const CustomAppBar(
              iconsLigth: true,
              showBackButton:
                  false), // Appbar con íconos blancos y sin botón de retroceso.
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                child: Text('Disponible',
                    style: AppTextStyle.cardTextMedium), // Texto "Disponible".
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Gs. $balance",
                        style: AppTextStyle.cardTextLarge), // Texto del saldo.
                    IconButton(
                      onPressed: () =>
                          onShowPressed(), // Llama a la función mostrar/ocultar cuando se presiona el botón.
                      visualDensity: VisualDensity.compact,
                      icon: SizedBox(
                        width: 21.57,
                        height: 13.72,
                        child: Image.asset('assets/icons/eye_amount_view.png'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
