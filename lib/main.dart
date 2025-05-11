import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData (colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home:  Calculadora(),
    );
  }
}

////////

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});


  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String display = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
  Widget buildBotao(String texto) {
    return SizedBox(
      width: 80,
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (texto == 'C') {
              display = '';
            } else if (texto == '=') {

            } else {
              display += texto;
            }
            _controller.text = display;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 249, 206, 227),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          texto,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 146, 194, 242),
        title: Row(
        children: [
          const Image(
            image: AssetImage('lib/assets/littletwinstars.png'),
            height: 70,
            ),
          Text('Calculadora em Flutter')
          ],
        ),
      ),
      body: Column(
        children: [
        //visor
        Container(
          color: const Color.fromARGB(255, 239, 233, 155),
          height: 250,
          padding: EdgeInsets.all(16),
          alignment: Alignment.bottomRight,
          child: TextField(
            controller: _controller,
            readOnly: true,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 50,
              color: const Color.fromARGB(255, 9, 153, 215),
            ),
              decoration: InputDecoration(
              border: InputBorder.none,
            )
          )
        ),  
        //teclado
        Container(
          height: 530,
          color: const Color.fromARGB(255, 158, 212, 255),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildBotao('C'),
                  buildBotao('CE'),
                  buildBotao(','),
                  buildBotao('/'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildBotao('7'),
                  buildBotao('8'),
                  buildBotao('9'),
                  buildBotao('*'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildBotao('4'),
                  buildBotao('5'),
                  buildBotao('6'),
                  buildBotao('-'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildBotao('1'),
                  buildBotao('2'),
                  buildBotao('3'),
                  buildBotao('+'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildBotao('0'),
                  buildBotao('='),
                ],
              ),
            ],
          ),
        ),
        ],
      ),
    ); 
  }
}
