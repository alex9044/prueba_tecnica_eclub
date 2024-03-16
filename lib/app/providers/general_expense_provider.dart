import 'package:eclub/app/models/expense.dart';
import 'package:eclub/app/services/expense_service.dart';
import 'package:flutter/material.dart';

class GeneralExpenseProvider extends ChangeNotifier {
  final ExpenseService _expenseService;

  GeneralExpenseProvider(this._expenseService) {
    _expenses = _expenseService.getAllExpenses();
    getExpensesByMonth();
  }

  final List<String> _meses = [
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

  String _selectedMonth = 'Enero 2022';
  List<Expense> _expenses = [];
  int _tabIndexGeneralExpense = 0;
  late double _entretenimientoPercentage;
  late double _retirosPercentage;
  late double _saludPercentage;
  late double _transportePercentage;
  late double _comprasPercentage;
  late double _restaurantesYBaresPercentage;
  late double _otrosPercentage;
  final List<Expense> _expensesInMonth = [];

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

  set selectedGeneralExpenseTabIndex(int value) {
    _tabIndexGeneralExpense = value;
    notifyListeners();
  }

  void getExpensesByMonth() {
    final month = _tabIndexGeneralExpense;
    // Limpia la lista de gastos del mes
    _expensesInMonth.clear();

    // Actualiza la variable mes seleccionado
    _selectedMonth = meses[month].substring(0, meses[month].indexOf(' '));

    for (Expense expense in _expenses) {
      final List<String> dateParts = expense.fecha.split('/');
      final int expenseMonth = int.parse(dateParts[1]);
      if (expenseMonth == month + 1) {
        _expensesInMonth.add(expense);
      }
    }
    updatePercentages(_expensesInMonth);
    notifyListeners();
  }

  void updatePercentages(List<Expense> expenses) {
    // Inicializa as variáveis de soma para cada categoria como zero
    double totalEntretenimiento = 0;
    double totalRetiros = 0;
    double totalSalud = 0;
    double totalTransporte = 0;
    double totalCompras = 0;
    double totalRestaurantesYBares = 0;
    double totalOtros = 0;

    // Calcula a soma dos gastos para cada categoria
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

    // Calcula o total de gastos para normalizar as porcentagens
    double totalExpenses = totalEntretenimiento +
        totalRetiros +
        totalSalud +
        totalTransporte +
        totalCompras +
        totalRestaurantesYBares +
        totalOtros;

    // Atualiza as variáveis de porcentagem com base nas somas calculadas
    _entretenimientoPercentage = totalEntretenimiento / totalExpenses;
    _retirosPercentage = totalRetiros / totalExpenses;
    _saludPercentage = totalSalud / totalExpenses;
    _transportePercentage = totalTransporte / totalExpenses;
    _comprasPercentage = totalCompras / totalExpenses;
    _restaurantesYBaresPercentage = totalRestaurantesYBares / totalExpenses;
    _otrosPercentage = totalOtros / totalExpenses;
  }
}
