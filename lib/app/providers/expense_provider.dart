import 'package:eclub/app/models/expense.dart';
import 'package:eclub/app/services/expense_service.dart';
import 'package:flutter/material.dart';

class ExpenseProvider extends ChangeNotifier {
  final ExpenseService _expenseService;

  ExpenseProvider(this._expenseService) {
    _expenses = _expenseService.getAllExpenses();
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

  final List<String> _categories = [
    'Restaurantes y bares',
    'Otros',
    'Entretenimiento',
    'Retiros',
    'Transporte',
    'Compras',
    'Salud',
  ];

  List<Expense> _expenses = [];
  int _tabIndexExpense = 0;
  late double _entretenimientoPercentage;
  late double _retirosPercentage;
  late double _saludPercentage;
  late double _transportePercentage;
  late double _comprasPercentage;
  late double _restaurantesYBaresPercentage;
  late double _otrosPercentage;
  late String _selectedCategory;
  late Expense _selectedExpense;
  final List<Expense> _expensesInMonthByCategory = [];

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

  set selectedExpense(Expense value) {
    _selectedExpense = value;
    notifyListeners();
  }

  set selectedCategoryIndex(int value) {
    _selectedCategory = _categories[value];
    notifyListeners();
  }

  set selectedExpenseTabIndex(int value) {
    _tabIndexExpense = value;
    notifyListeners();
  }

  void getExpensesByMonthAndCategory() {
    final month = _tabIndexExpense;

    _expensesInMonthByCategory.clear();

    _expensesInMonthByCategory.addAll(_expenses.where((expense) {
      // Extrai o mês da data da despesa e verifica se corresponde ao mês fornecido
      int expenseMonth = int.parse(expense.fecha.split('/')[1]);
      bool isSameMonth = expenseMonth == month + 1;

      // Verifica se a categoria da despesa corresponde à categoria fornecida
      bool isSameCategory = expense.categoria == selectedCategory;

      // Retorna verdadeiro se a despesa estiver no mês e na categoria corretos
      return isSameMonth && isSameCategory;
    }));
    updatePercentages(_expensesInMonthByCategory);
    notifyListeners(); // Notifica os ouvintes que a lista de despesas foi atualizada
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
