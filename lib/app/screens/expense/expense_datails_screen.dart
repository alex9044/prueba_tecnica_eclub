import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/constants/app_text_style.dart';
import 'package:eclub/app/providers/expense_provider.dart';
import 'package:eclub/app/screens/expense/components/movement_card.dart';
import 'package:eclub/app/utils/format_number.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseDetailsScreen extends StatelessWidget {
  const ExpenseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el proveedor de gastos
    final provider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          // Tarjeta de movimiento mostrando los detalles del gasto
          MovementCard(
            amount:
                "Gs. ${FormatNumber.formatDouble(provider.selectedExpense.monto)}",
            description: provider.selectedExpense.descripcion,
            location: provider.selectedExpense.ubicacion,
          ),

          Expanded(
            child: Container(
              // Contenedor para mostrar más detalles del gasto
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .03,
                  left: MediaQuery.of(context).size.width * .05,
                  right: MediaQuery.of(context).size.width * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Detalles del gasto: Operación (Categoría)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Operación:',
                            style: AppTextStyle.titleSmall),
                        Text(provider.selectedExpense.categoria,
                            style: AppTextStyle.titleSmall),
                      ],
                    ),
                  ),

                  // Detalles del gasto: Fecha
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fecha:',
                          style: AppTextStyle.labelSmall
                              .copyWith(color: AppColors.mediumGray),
                        ),
                        Text(provider.selectedExpense.fecha,
                            style: AppTextStyle.labelSmall),
                      ],
                    ),
                  ),

                  // Detalles del gasto: Hora
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hora:',
                            style: AppTextStyle.labelSmall.copyWith(
                              color: AppColors.mediumGray,
                            )),
                        Text(provider.selectedExpense.hora,
                            style: AppTextStyle.labelSmall),
                      ],
                    ),
                  ),

                  // Detalles del gasto: Código de referencia
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cod. de referencia:',
                            style: AppTextStyle.labelSmall.copyWith(
                              color: AppColors.mediumGray,
                            )),
                        Text(provider.selectedExpense.codReferencia.toString(),
                            style: AppTextStyle.labelSmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
