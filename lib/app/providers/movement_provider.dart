import 'package:eclub/app/models/movement.dart';
import 'package:eclub/app/services/movement_service.dart';
import 'package:flutter/material.dart';

class MovementProvider extends ChangeNotifier {
  final MovementService _movementService;
  bool _showBalance = true;

  MovementProvider(this._movementService);

  List<Movement> get movements => _movementService.getAllMovements();
  bool get showBalance => _showBalance;

  set showBalance(bool value) {
    _showBalance = value;
    notifyListeners();
  }
}
