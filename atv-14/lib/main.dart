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
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
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
              'Digite sua idade: ',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: _controller1,
                onChanged: (value) {
                  setState(
                    () {
                      _idade = value;
                    },
                  );
                },
                decoration: InputDecoration(
                  hintText: 'Digite sua idade: ',
                ),
              ),
            ),
            Text(
              'Digite seu salário: ',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: _controller3,
                onChanged: (value) {
                  setState(
                    () {
                      _salario = value;
                    },
                  );
                },
                decoration: InputDecoration(
                  hintText: 'Digite seu salário: ',
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
                    if (_nome.isNotEmpty &
                        _salario.isNotEmpty &
                        _idade.isNotEmpty) {
                      _mostrarMensagem(context,
                          'Olá, Seu nome é: $_nome  idade: $_idade  salario: $_salario! ');
                    } else {
                      _mostrarMensagem(
                          context, 'Por favor, preencha os campos vazios.');
                    }
                  },
                  child: Text('Mostrar Saudação'),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    _controller.clear();
                    _controller1.clear();
                    _controller3.clear();
                    setState(
                      () {
                        _nome = '';
                        _salario = '';
                        _idade = '';
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
