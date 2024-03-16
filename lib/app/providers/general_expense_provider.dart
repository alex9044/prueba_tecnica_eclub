import 'package:eclub/app/models/expense.dart';
import 'package:eclub/app/services/expense_service.dart';
import 'package:flutter/material.dart';

class GeneralExpenseProvider extends ChangeNotifier {
  final ExpenseService _expenseService; // Servicio de gastos.

  GeneralExpenseProvider(this._expenseService) {
    _expenses =
        _expenseService.getAllExpenses(); // Obteniendo todos los gastos.
    getExpensesByMonth(); // Obteniendo los gastos por mes.
  }

  final List<String> _meses = [
    // Lista de meses.
    'Enero 2022',
    'Febrero 2022',
    'Marzo 2022',
    'Abril 2022',
    'Mayo 2022',
    'Junio 2022',
    'Julio 2022',
    'Agosto 2022',
    'Septiembre 2022',
    'Octubre 2022',
    'Noviembre 2022',
    'Diciembre 2022'
  ];

  String _selectedMonth = 'Enero 2022'; // Mes seleccionado.
  List<Expense> _expenses = []; // Lista de gastos.
  int _tabIndexGeneralExpense = 0; // Índice de la pestaña seleccionada.
  late double
      _entretenimientoPercentage; // Porcentaje de gastos de entretenimiento.
  late double _retirosPercentage; // Porcentaje de gastos de retiros.
  late double _saludPercentage; // Porcentaje de gastos de salud.
  late double _transportePercentage; // Porcentaje de gastos de transporte.
  late double _comprasPercentage; // Porcentaje de gastos de compras.
  late double
      _restaurantesYBaresPercentage; // Porcentaje de gastos de restaurantes y bares.
  late double _otrosPercentage; // Porcentaje de gastos de otras categorías.
  final List<Expense> _expensesInMonth = []; // Lista de gastos por mes.

  // Getters
  int get tabIndexGeneralExpense => _tabIndexGeneralExpense;
  double get entretenimientoPercentage => _entretenimientoPercentage;
  double get retirosPercentage => _retirosPercentage;
  double get saludPercentage => _saludPercentage;
  double get transportePercentage => _transportePercentage;
  double get comprasPercentage => _comprasPercentage;
  double get restaurantesYBaresPercentage => _restaurantesYBaresPercentage;
  double get otrosPercentage => _otrosPercentage;
  String get selectedMonth => _selectedMonth;
  List<String> get meses => _meses;
  List<Expense> get expenses => _expenses;
  List<Expense> get expensesInMonth => _expensesInMonth;

  // Setter
  set selectedGeneralExpenseTabIndex(int value) {
    _tabIndexGeneralExpense = value;
    notifyListeners(); // Notificar a los oyentes sobre el cambio en la pestaña seleccionada.
  }

  // Método para obtener gastos por mes.
  void getExpensesByMonth() {
    final month = _tabIndexGeneralExpense;
    // Limpiando la lista de gastos del mes.
    _expensesInMonth.clear();

    // Actualizando el mes seleccionado.
    _selectedMonth = meses[month].substring(0, meses[month].indexOf(' '));

    for (Expense expense in _expenses) {
      final List<String> dateParts = expense.fecha.split('/');
      final int expenseMonth = int.parse(dateParts[1]);
      if (expenseMonth == month + 1) {
        _expensesInMonth.add(expense);
      }
    }
    updatePercentages(_expensesInMonth); // Actualizar los porcentajes.
    notifyListeners(); // Notificar a los oyentes sobre el cambio en los gastos por mes.
  }

  // Método para actualizar los porcentajes de las categorías de gastos.
  void updatePercentages(List<Expense> expenses) {
    // Inicializando las variables de suma para cada categoría como cero.
    double totalEntretenimiento = 0;
    double totalRetiros = 0;
    double totalSalud = 0;
    double totalTransporte = 0;
    double totalCompras = 0;
    double totalRestaurantesYBares = 0;
    double totalOtros = 0;

    // Calculando la suma de los gastos para cada categoría.
    for (Expense expense in expenses) {
      switch (expense.categoria) {
        case 'Entretenimiento':
          totalEntretenimiento += expense.monto;
          break;
        case 'Retiros':
          totalRetiros += expense.monto;
          break;
        case 'Salud':
          totalSalud += expense.monto;
          break;
        case 'Transporte':
          totalTransporte += expense.monto;
          break;
        case 'Compras':
          totalCompras += expense.monto;
          break;
        case 'Restaurantes y bares':
          totalRestaurantesYBares += expense.monto;
          break;
        default:
          totalOtros += expense.monto;
      }
    }

    // Calculando el total de gastos para normalizar los porcentajes.
    double totalExpenses = totalEntretenimiento +
        totalRetiros +
        totalSalud +
        totalTransporte +
        totalCompras +
        totalRestaurantesYBares +
        totalOtros;

    // Actualizando los porcentajes basados en las sumas calculadas.
    _entretenimientoPercentage = totalEntretenimiento / totalExpenses;
    _retirosPercentage = totalRetiros / totalExpenses;
    _saludPercentage = totalSalud / totalExpenses;
    _transportePercentage = totalTransporte / totalExpenses;
    _comprasPercentage = totalCompras / totalExpenses;
    _restaurantesYBaresPercentage = totalRestaurantesYBares / totalExpenses;
    _otrosPercentage = totalOtros / totalExpenses;
  }
}
