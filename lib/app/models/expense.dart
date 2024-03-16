class Expense {
  final int id;
  final String categoria;
  final String descripcion;
  final double monto;
  final String fecha;
  final String hora;
  final String ubicacion;
  final int codReferencia;

  Expense({
    required this.id,
    required this.ubicacion,
    required this.categoria,
    required this.descripcion,
    required this.monto,
    required this.fecha,
    required this.hora,
    required this.codReferencia,
  });
}
