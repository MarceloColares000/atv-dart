import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saudação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _nome = '';
  String _idade = '';
  String _salario = '';
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerIdade = TextEditingController();
  TextEditingController _controllerSalario = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saudação'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Digite seu nome: ',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  setState(
                    () {
                      _nome = value;
                    },
                  );
                },
                decoration: InputDecoration(
                  hintText: 'Digite seu nome: ',
                ),
              ),
            ),
            Text(
              'Qual é a sua idade? ',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: _controllerIdade,
                onChanged: (value) {
                  setState(
                    () {
                      _idade = value;
                    },
                  );
                },
                decoration: InputDecoration(
                  hintText: 'Qual é a sua idade? ',
                ),
              ),
            ),
            Text(
              'Qual o seu salário? ',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: _controllerSalario,
                onChanged: (value) {
                  setState(
                    () {
                      _salario = value;
                    },
                  );
                },
                decoration: InputDecoration(
                  hintText: 'Qual o seu salário? ',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_nome.isNotEmpty) {
                      _mostrarMensagem(context,
                          'Olá, $_nome! Sua idade é $_idade e você tem um salário de $_salario');
                    } else {
                      _mostrarMensagem(
                          context, 'Por favor, preecha todos os campos.');
                    }
                  },
                  child: Text('Mostrar Saudação'),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    _controller.clear();
                    setState(
                      () {
                        _nome = '';
                      },
                    );
                  },
                  child: Text('Limpar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarMensagem(BuildContext context, String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mensagem'),
          content: Text(mensagem),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
