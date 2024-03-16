import 'package:eclub/app/models/expense.dart';
import 'package:eclub/app/services/expense_service.dart';
import 'package:flutter/material.dart';

class ExpenseProvider extends ChangeNotifier {
  final ExpenseService _expenseService; // Servicio de despesas.

  ExpenseProvider(this._expenseService) {
    _expenses =
        _expenseService.getAllExpenses(); // Obteniendo todas las despesas.
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

  final List<String> _categories = [
    // Lista de categorías de despesas.
    'Restaurantes y bares',
    'Otros',
    'Entretenimiento',
    'Retiros',
    'Transporte',
    'Compras',
    'Salud',
  ];

  List<Expense> _expenses = []; // Lista de despesas.
  int _tabIndexExpense = 0; // Índice de la pestaña seleccionada.
  late double
      _entretenimientoPercentage; // Porcentaje de despesas de entretenimiento.
  late double _retirosPercentage; // Porcentaje de despesas de retiros.
  late double _saludPercentage; // Porcentaje de despesas de salud.
  late double _transportePercentage; // Porcentaje de despesas de transporte.
  late double _comprasPercentage; // Porcentaje de despesas de compras.
  late double
      _restaurantesYBaresPercentage; // Porcentaje de despesas de restaurantes y bares.
  late double _otrosPercentage; // Porcentaje de despesas de otras categorías.
  late String _selectedCategory; // Categoría seleccionada.
  late Expense _selectedExpense; // Despesa seleccionada.
  final List<Expense> _expensesInMonthByCategory =
      []; // Lista de despesas por mes y categoría.

  // Getters
  int get tabIndexExpense => _tabIndexExpense;
  double get entretenimientoPercentage => _entretenimientoPercentage;
  double get retirosPercentage => _retirosPercentage;
  double get saludPercentage => _saludPercentage;
  double get transportePercentage => _transportePercentage;
  double get comprasPercentage => _comprasPercentage;
  double get restaurantesYBaresPercentage => _restaurantesYBaresPercentage;
  double get otrosPercentage => _otrosPercentage;
  String get selectedCategory => _selectedCategory;
  Expense get selectedExpense => _selectedExpense;
  List<String> get meses => _meses;
  List<String> get categories => _categories;
  List<Expense> get expenses => _expenses;
  List<Expense> get expenseInMonthByCategory => _expensesInMonthByCategory;

  // Setters
  set selectedExpense(Expense value) {
    _selectedExpense = value;
    notifyListeners(); // Notificando a los oyentes sobre el cambio en la despesa seleccionada.
  }

  set selectedCategoryIndex(int value) {
    _selectedCategory = _categories[value];
    notifyListeners(); // Notificando a los oyentes sobre el cambio en la categoría seleccionada.
  }

  set selectedExpenseTabIndex(int value) {
    _tabIndexExpense = value;
    notifyListeners(); // Notificando a los oyentes sobre el cambio en la pestaña seleccionada.
  }

  // Método para obtener despesas por mes y categoría.
  void getExpensesByMonthAndCategory() {
    final month = _tabIndexExpense; // Obtener el mes seleccionado.

    _expensesInMonthByCategory
        .clear(); // Limpiando la lista de despesas por mes y categoría.

    _expensesInMonthByCategory.addAll(_expenses.where((expense) {
      // Extraer el mes de la fecha de la despesa y verificar si coincide con el mes proporcionado.
      int expenseMonth = int.parse(expense.fecha.split('/')[1]);
      bool isSameMonth = expenseMonth == month + 1;

      // Verificar si la categoría de la despesa coincide con la categoría proporcionada.
      bool isSameCategory = expense.categoria == selectedCategory;

      // Devolver verdadero si la despesa está en el mes y categoría correctos.
      return isSameMonth && isSameCategory;
    }));
    updatePercentages(
        _expensesInMonthByCategory); // Actualizar los porcentajes.
    notifyListeners(); // Notificar a los oyentes que la lista de despesas ha sido actualizada.
  }

  // Método para actualizar los porcentajes de las categorías de despesas.
  void updatePercentages(List<Expense> expenses) {
    // Inicializar las variables de suma para cada categoría como cero.
    double totalEntretenimiento = 0;
    double totalRetiros = 0;
    double totalSalud = 0;
    double totalTransporte = 0;
    double totalCompras = 0;
    double totalRestaurantesYBares = 0;
    double totalOtros = 0;

    // Calcular la suma de las despesas para cada categoría.
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

    // Calcular el total de despesas para normalizar los porcentajes.
    double totalExpenses = totalEntretenimiento +
        totalRetiros +
        totalSalud +
        totalTransporte +
        totalCompras +
        totalRestaurantesYBares +
        totalOtros;

    // Actualizar los porcentajes basados en las sumas calculadas.
    _entretenimientoPercentage = totalEntretenimiento / totalExpenses;
    _retirosPercentage = totalRetiros / totalExpenses;
    _saludPercentage = totalSalud / totalExpenses;
    _transportePercentage = totalTransporte / totalExpenses;
    _comprasPercentage = totalCompras / totalExpenses;
    _restaurantesYBaresPercentage = totalRestaurantesYBares / totalExpenses;
    _otrosPercentage = totalOtros / totalExpenses;
  }
}
