import 'package:eclub/app/models/movement.dart';
import 'package:eclub/app/services/movement_service.dart';
import 'package:flutter/material.dart';

class MovementProvider extends ChangeNotifier {
  final MovementService _movementService; // Servicio de movimientos.
  bool _showBalance = true; // Variable para controlar si se muestra el saldo.

  MovementProvider(this._movementService); // Constructor.

  List<Movement> get movements =>
      _movementService.getAllMovements(); // Obtener todos los movimientos.
  bool get showBalance =>
      _showBalance; // Obtener el estado actual de mostrar saldo.

  // Setter para actualizar el estado de mostrar saldo.
  set showBalance(bool value) {
    _showBalance = value;
    notifyListeners(); // Notificar a los oyentes sobre el cambio en el estado de mostrar saldo.
  }
}
