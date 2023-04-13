import 'package:flutter/material.dart';

class ResultadoPage extends StatefulWidget {
  const ResultadoPage({super.key, required this.altura, required this.peso});
  final String altura, peso;

  @override
  State<ResultadoPage> createState() => _ResultadoPageState();
}

String resultadoImc(String a) {
  double b = 0;
  try {
    b = double.parse(a);
  } catch (e) {
    b = 0;
  }
  if (b < 18.5 && b > 0) {
    return 'Você está abaixo do peso, coma mais!';
  }
  if (b >= 18.5 && b < 24.9) {
    return 'Peso normal';
  }
  if (b >= 24.9 && b < 30) {
    return 'Você esta com Sobrepeso';
  }
  if (b >= 30) {
    return 'Você esta com Obesidade';
  } else
    return 'Você informou um numero incorreto em seus dados, retorna a pagina anterior';
}

double calculo(String a, String b) {
  try {
    double c = double.parse(a);
    double d = double.parse(b);
    return c / (d * d);
  } catch (e) {
    return 0.0;
  }
}

class _ResultadoPageState extends State<ResultadoPage> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final peso = routeArgs['peso'];
    final altura = routeArgs['altura'];
    double i = calculo(peso, altura);
    String resultadoimc = resultadoImc(i.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(' O IMC é de $i'),
            Text(resultadoimc),
            ElevatedButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                child: Text('Voltar')),
          ],
        ),
      ),
      
    );
  }
}
