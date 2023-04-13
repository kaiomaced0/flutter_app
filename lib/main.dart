import 'package:flutter/material.dart';
import 'package:flutter_app/resultado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (__) => const MyHomePage(title: 'Home'),
        '/resultado': (context) {
          final parametros = ModalRoute.of(context)!.settings.arguments as Map;
          return ResultadoPage(
            altura: (parametros['altura']),
            peso: (parametros['peso']),
          );
        }
      },
      title: 'App Test',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String peso = '';
  String altura = '';
  String bu1 = 'Realizar calculo';

  void _upgradeNavigator() {
    Navigator.pushNamed(context, '/resultado',
        arguments: {'peso': peso, 'altura': altura});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Dados a baixo:',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'peso: ',
                  style: Theme.of(context).textTheme.headline4,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: ((text) {
                    peso = text;
                  }),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'altura: ',
                  style: Theme.of(context).textTheme.headline4,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: ((text) {
                    altura = text;
                  }),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: (() {
                  _upgradeNavigator();
                }),
                child: Text(bu1)),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _upgradeNavigator();
        }),
        tooltip: 'Increment',
        child: const Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
