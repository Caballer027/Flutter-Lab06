import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Widget raíz
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendario',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Día del calendario
  Widget dia(String texto,
      {bool seleccionado = false, bool atenuado = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            color: seleccionado ? Colors.deepOrange : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              texto,
              style: TextStyle(
                fontSize: 18,
                fontWeight: seleccionado ? FontWeight.bold : FontWeight.normal,
                color: seleccionado
                    ? Colors.white
                    : atenuado
                        ? Colors.grey
                        : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Fila de días
  Widget semana(List<String> dias,
      {List<bool>? atenuados, int? indiceSeleccionado}) {
    return Row(
      children: List.generate(dias.length, (index) {
        return dia(dias[index],
            seleccionado: indiceSeleccionado == index,
            atenuado: atenuados != null && atenuados[index]);
      }),
    );
  }

  // Construcción de la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'juin 2019',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // Días de la semana
            Row(
              children: const [
                Expanded(
                  child: Center(
                    child: Text(
                      'lun.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'mar.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'mer.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'jeu.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'ven.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'sam.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'dim.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            semana(['27', '28', '29', '30', '31', '1', '2'],
                atenuados: [true, true, true, true, true, false, false]),
            semana(['3', '4', '5', '6', '7', '8', '9']),
            semana(['10', '11', '12', '13', '14', '15', '16']),
            semana(['17', '18', '19', '20', '21', '22', '23']),
            semana(['24', '25', '26', '27', '28', '29', '30'],
                indiceSeleccionado: 4),
            semana(['1', '2', '3', '4', '5', '6', '7'],
                atenuados: [true, true, true, true, true, true, true]),
          ],
        ),
      ),
    );
  }
}
