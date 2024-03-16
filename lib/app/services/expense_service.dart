import 'dart:math';
import 'package:eclub/app/models/expense.dart';

class ExpenseService {
  final List<Expense> _expenses = []; // Lista privada que almacena las despesas

  // Constructor de la clase, genera despesas al inicializar
  ExpenseService() {
    generateExpenses(300);
  }

  // Método para obtener todas las despesas
  List<Expense> getAllExpenses() {
    return List<Expense>.from(_expenses);
  }

  // Método para generar y agregar una cantidad especificada de despesas a la lista
  void generateExpenses(int quantity) {
    final Random random = Random();
    final List<String> categories = [
      'Entretenimiento',
      'Retiros',
      'Salud',
      'Transporte',
      'Compras',
      'Restaurantes y bares',
    ];

    int month = 1;
    int category = 0;

    for (int i = 1; i < quantity; i++) {
      final String randomCategory = categories[category];
      final double randomAmount = (random.nextDouble() * 100000).toDouble();
      final int randomDay = random.nextInt(28) + 1;
      final int randomHour = random.nextInt(24);
      final int randomMinute = random.nextInt(60);
      final String randomDescription =
          _generateRandomDescription(randomCategory);
      if (month > 12) {
        month = 1;
      } else {
        month++;
      }
      if (category >= 5) {
        category = 0;
      } else {
        category++;
      }
      final String randomDate =
          '${_formatDay(randomDay)}/${_formatMonth(month)}/2022';

      _expenses.add(Expense(
        id: i,
        categoria: randomCategory,
        descripcion: randomDescription,
        monto: randomAmount,
        fecha: randomDate,
        hora: '$randomHour:$randomMinute hs',
        ubicacion: "ASUNCPY",
        codReferencia: 123456789123,
      ));
    }
  }

  // Genera una descripción aleatoria según la categoría
  String _generateRandomDescription(String category) {
    switch (category) {
      case 'Entretenimiento':
        return 'CINEART';
      case 'Retiros':
        return 'INFONET';
      case 'Salud':
        return 'LEBLANC';
      case 'Transporte':
        return 'UBER';
      case 'Compras':
        return 'GRANVIA';
      case 'Restaurantes y bares':
        return 'CAPITAO';
      default:
        return 'Descripción aleatoria';
    }
  }

  // Formatea el mes con ceros a la izquierda si es necesario
  String _formatMonth(int month) {
    return month.toString().padLeft(2, '0');
  }

  // Formatea el día con ceros a la izquierda si es necesario
  String _formatDay(int day) {
    return day.toString().padLeft(2, '0');
  }
}
