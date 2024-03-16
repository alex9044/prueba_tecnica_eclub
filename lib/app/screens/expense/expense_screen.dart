import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/providers/expense_provider.dart';
import 'package:eclub/app/screens/expense/components/chart_expenses.dart';
import 'package:eclub/app/utils/format_number.dart';
import 'package:eclub/app/widgets/custom_app_bar.dart';
import 'package:eclub/app/widgets/custom_elevated_button.dart';
import 'package:eclub/app/widgets/custom_tab_bar.dart';
import 'package:eclub/app/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el proveedor de gastos
    final provider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .045),
        child: Column(
          children: [
            // Barra de aplicación personalizada con el título "Gastos" y botón de retroceso
            const CustomAppBar(
              title: "Gastos",
              showBackButton: true,
            ),

            // Selector de pestañas personalizado con los meses disponibles
            DefaultTabController(
              initialIndex: provider.tabIndexExpense,
              length: provider.meses.length,
              child: CustomTabBar(
                tabs: provider.meses,
                // Al seleccionar una pestaña, actualiza el índice y los gastos por mes y categoría
                onTabTap: (tabIndex) {
                  provider.selectedExpenseTabIndex = tabIndex;
                  provider.getExpensesByMonthAndCategory();
                },
              ),
            ),

            const Expanded(child: SizedBox()), // Espacio expandido

            // Gráfico de gastos personalizado
            CustomChartExpense(
              title: provider.selectedCategory,
              amount:
                  "Gs.${FormatNumber.formatDouble(provider.expenseInMonthByCategory.fold(0, (previousValue, element) => previousValue + element.monto))}",
              centerColor: AppColors.white,
              sections: provider.expenseInMonthByCategory.isNotEmpty
                  ? [
                      // Secciones del gráfico representando diferentes categorías de gastos
                      CustomChartSection(
                        context: context,
                        value: provider.restaurantesYBaresPercentage,
                        color: AppColors.lavender,
                        iconPath: 'assets/icons/food_icon.png',
                      ),
                      CustomChartSection(
                        context: context,
                        value: provider.otrosPercentage,
                        color: AppColors.warmYellow,
                      ),
                      CustomChartSection(
                        context: context,
                        value: provider.entretenimientoPercentage,
                        color: AppColors.lightGreen,
                      ),
                      CustomChartSection(
                        context: context,
                        value: provider.retirosPercentage,
                        color: AppColors.brightBlue,
                      ),
                      CustomChartSection(
                        context: context,
                        value: provider.transportePercentage,
                        color: AppColors.vividOrange,
                      ),
                      CustomChartSection(
                        context: context,
                        value: provider.comprasPercentage,
                        color: AppColors.lightBlue,
                        iconPath: 'assets/icons/shopping_white_icon.png',
                      ),
                      CustomChartSection(
                        context: context,
                        value: provider.saludPercentage,
                        color: AppColors.vividYellow,
                      ),
                    ]
                  : [],
            ),

            // Lista de gastos del mes por categoría
            Container(
              height: MediaQuery.of(context).size.height * .20,
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * .08,
                left: MediaQuery.of(context).size.width * .08,
                top: 25.0,
                bottom: 25.0,
              ),
              child: ListView.builder(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .045),
                itemBuilder: (context, index) {
                  final data = provider.expenseInMonthByCategory[index];
                  return CustomListTile(
                    // Elemento de la lista representando un gasto
                    category: data.categoria,
                    title: data.descripcion,
                    subitle: data.categoria,
                    trailing: "${FormatNumber.formatDouble(data.monto)} Gs.",
                    subtrailing: data.fecha,
                    padding: EdgeInsets.zero,
                    onTap: () {
                      // Al hacer clic en un elemento, guarda el gasto seleccionado y abre la pantalla de detalles
                      provider.selectedExpense = data;
                      Navigator.pushNamed(context, 'expense_details');
                    },
                  );
                },
                itemCount: provider.expenseInMonthByCategory.length,
              ),
            ),

            // Botón elevado para ver el extracto de los gastos
            CustomElevatedButton(
              onPressed: () {},
              title: "Ver extracto",
            ),
          ],
        ),
      ),
    );
  }
}
