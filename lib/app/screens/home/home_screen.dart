import 'package:eclub/app/constants/app_text_style.dart';
import 'package:eclub/app/utils/format_number.dart';
import 'package:eclub/app/widgets/custom_list_tile.dart';
import 'package:eclub/app/widgets/custom_navigation_bar.dart';
import 'package:eclub/app/screens/home/components/balance_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showBalance = true;

  final List<Map<String, dynamic>> data = [
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
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tarjeta de saldo
          BalanceCard(
            balance: showBalance
                ? "2.000.080"
                : "---", // Balance actual o mensaje de falta de saldo
            onShowPressed: () => setState(() {
              showBalance = !showBalance; // Alternar la visibilidad del saldo
            }),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height *
                      .055, // Margen superior basado en el tamaño de la pantalla
                  left: MediaQuery.of(context).size.width *
                      .05, // Margen izquierdo basado en el tamaño de la pantalla
                  right: MediaQuery.of(context).size.width *
                      .05), // Margen derecho basado en el tamaño de la pantalla
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título de la sección de movimientos
                  const Text('Movimientos', style: AppTextStyle.titleSmall),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height *
                                .045), // Padding inferior basado en el tamaño de la pantalla
                        itemBuilder: (context, index) => CustomListTile(
                          category: data[index]
                              ['categoria'], // Categoría del movimiento
                          title: data[index]
                              ['descripcion'], // Descripción del movimiento
                          subitle: data[index]
                              ['categoria'], // Subtítulo del movimiento
                          trailing: FormatNumber.formatDouble(
                              data[index]['monto']), // Importe del movimiento
                          subtrailing: data[index]
                              ['fecha'], // Fecha del movimiento
                          padding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 0.00), // Padding del ListTile
                        ),
                        itemCount: data.length,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(), // Barra de navegación
    );
  }
}
