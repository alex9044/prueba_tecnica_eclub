import 'package:eclub/app/constants/app_colors.dart';
import 'package:eclub/app/providers/expense_provider.dart';
import 'package:eclub/app/providers/general_expense_provider.dart';
import 'package:eclub/app/screens/expense/components/chart_expenses.dart';
import 'package:eclub/app/utils/format_number.dart';
import 'package:eclub/app/widgets/custom_app_bar.dart';
import 'package:eclub/app/widgets/custom_elevated_button.dart';
import 'package:eclub/app/widgets/custom_tab_bar.dart';
import 'package:eclub/app/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneralExpenseScreen extends StatelessWidget {
  const GeneralExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el proveedor de gastos generales y el proveedor de gastos
    final provider = Provider.of<GeneralExpenseProvider>(context);
    final providerExpense = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.background, // Color de fondo de la pantalla
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .045),
        child: Column(
          children: [
            // Barra de aplicación personalizada con el título "Gastos"
            const CustomAppBar(title: "Gastos", showBackButton: true),

            // Selector de pestañas personalizado con los meses disponibles
            DefaultTabController(
              initialIndex: provider.tabIndexGeneralExpense,
              length: provider.meses.length,
              child: CustomTabBar(
                tabs: provider.meses,
                // Al seleccionar una pestaña, actualiza los índices y los gastos por mes
                onTabTap: (tabIndex) {
                  provider.selectedGeneralExpenseTabIndex = tabIndex;
                  providerExpense.selectedExpenseTabIndex = tabIndex;
                  provider.getExpensesByMonth();
                },
              ),
            ),

            const Expanded(child: SizedBox()), // Espacio expandido

            // Gráfico de gastos personalizado
            CustomChartExpense(
              title: provider.selectedMonth,
              amount:
                  "Gs.${FormatNumber.formatDouble(provider.expensesInMonth.fold(0, (previousValue, element) => previousValue + element.monto))}",
              onSectionPressed: (value) {
                // Al presionar una sección del gráfico, actualiza los gastos por categoría y abre la pantalla de detalles
                providerExpense.selectedCategoryIndex = value;
                providerExpense.selectedExpenseTabIndex =
                    provider.tabIndexGeneralExpense;
                providerExpense.getExpensesByMonthAndCategory();
                Navigator.pushNamed(context, 'expense');
              },
              centerColor: AppColors.background,
              sections: provider.expensesInMonth.isNotEmpty
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

            // Lista de gastos del mes
            Container(
              height: MediaQuery.of(context).size.height * .20,
              color: AppColors.background,
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * .08,
                left: MediaQuery.of(context).size.width * .08,
                top: 25.0,
                bottom: 25.0,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 35.0, top: 8.0),
                itemBuilder: (context, index) => CustomListTile(
                  // Elemento de la lista representando un gasto
                  category: provider.expensesInMonth[index].categoria,
                  title: provider.expensesInMonth[index].categoria,
                  trailing:
                      "Gs. ${FormatNumber.formatDouble(provider.expensesInMonth[index].monto)}",
                  padding: EdgeInsets.zero,
                ),
                itemCount: provider.expensesInMonth.length,
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
