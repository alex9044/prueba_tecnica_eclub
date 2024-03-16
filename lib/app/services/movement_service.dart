import 'dart:math';

import 'package:eclub/app/models/movement.dart';

class MovementService {
  // Constructor de la clase
  MovementService() {
    // Genera datos aleatorios al inicializar la clase
    generateRandomData(20);
  }
  // Lista privada que almacena los datos de los movimientos financieros
  final List<Map<String, dynamic>> _data = [
    // Datos iniciales de los movimientos
    {
      'categoria': 'Entretenimiento',
      'descripcion': 'Playstation Network',
      'monto': 1000.0,
      'fecha': '08/06/2022'
    },
    {
      'categoria': 'Retiros',
      'descripcion': 'Banco Regional',
      'monto': 150000.0,
      'fecha': '07/06/2022'
    },
    {
      'categoria': 'Salud',
      'descripcion': 'Punto Farma',
      'monto': 1000000.0,
      'fecha': '07/06/2022'
    },
    {
      'categoria': 'Transporte',
      'descripcion': 'Uber',
      'monto': 150000.0,
      'fecha': '08/06/2022'
    },
    {
      'categoria': 'Compras',
      'descripcion': 'Ferias Asuncion',
      'monto': 1000000.0,
      'fecha': '08/06/2022'
    },
    {
      'categoria': 'Transporte',
      'descripcion': 'Uber',
      'monto': 150000.0,
      'fecha': '08/06/2022'
    },
    {
      'categoria': 'Restaurantes y bares',
      'descripcion': 'Uber',
      'monto': 150000.0,
      'fecha': '08/06/2022'
    }
  ];

  // Método para obtener todos los movimientos
  List<Movement> getAllMovements() {
    return _data.map((item) {
      return Movement(
        categoria: item['categoria'],
        descripcion: item['descripcion'],
        monto: item['monto'],
        fecha: item['fecha'],
      );
    }).toList();
  }

  // Método para generar datos aleatorios de movimientos
  void generateRandomData(int count) {
    final Random random = Random();
    final List<String> categories = [
      'Entretenimiento',
      'Retiros',
      'Salud',
      'Transporte',
      'Compras',
      'Restaurantes y bares'
    ];

    final List<String> descriptions = [
      'Playstation Network',
      'Banco Regional',
      'Punto Farma',
      'Ferias Asuncion',
      'Uber',
    ];

    // Genera datos aleatorios según el número especificado
    for (int i = 0; i < count; i++) {
      final randomCategory = categories[random.nextInt(categories.length)];
      final randomDescription =
          descriptions[random.nextInt(descriptions.length)];
      final randomAmount = (random.nextDouble() * 100000).toDouble();
      final randomDate =
          '${random.nextInt(31) + 1}/${random.nextInt(12) + 1}/2022';

      // Agrega los datos aleatorios a la lista privada
      _data.add({
        'categoria': randomCategory,
        'descripcion': randomDescription,
        'monto': randomAmount,
        'fecha': randomDate,
      });
    }
  }
}
