import 'package:eclub/app/constants/app_text_style.dart';
import 'package:eclub/app/providers/movement_provider.dart';
import 'package:eclub/app/utils/format_number.dart';
import 'package:eclub/app/widgets/custom_list_tile.dart';
import 'package:eclub/app/widgets/custom_navigation_bar.dart';
import 'package:eclub/app/screens/movement/components/balance_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovementScreen extends StatefulWidget {
  const MovementScreen({super.key});

  @override
  State<MovementScreen> createState() => _MovementScreenState();
}

class _MovementScreenState extends State<MovementScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovementProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tarjeta de saldo
          BalanceCard(
            balance: provider.showBalance
                ? "Gs.${FormatNumber.formatDouble(provider.movements.fold(0, (previousValue, element) => previousValue + element.monto))}"
                : "", // Balance actual o mensaje de falta de saldo
            onShowPressed: () => provider.showBalance = !provider.showBalance,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height *
                      .055, // Margen superior basado en el tamaño de la pantalla
                  left: MediaQuery.of(context).size.width *
                      .05, // Margen izquierdo basado en el tamaño de la pantalla
                  right: MediaQuery.of(context).size.width *
                      .05), // Margen derecho basado en el tamaño de la pantalla
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título de la sección de movimientos
                  const Text('Movimientos', style: AppTextStyle.titleSmall),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height *
                                .045), // Padding inferior basado en el tamaño de la pantalla
                        itemBuilder: (context, index) => CustomListTile(
                          // Categoría del movimiento
                          category: provider.movements[index].categoria,
                          // Descripción del movimiento
                          title: provider.movements[index].descripcion,
                          // Subtítulo del movimiento
                          subitle: provider.movements[index].categoria,
                          // Importe del movimiento
                          trailing:
                              "${FormatNumber.formatDouble(provider.movements[index].monto)}Gs",
                          // Fecha del movimiento
                          subtrailing: provider.movements[index].fecha,
                          // Padding del ListTile
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 0.00),
                        ),
                        itemCount: provider.movements.length,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar:
          const CustomNavigationBar(selectedIndex: 0), // Barra de navegación
    );
  }
}
