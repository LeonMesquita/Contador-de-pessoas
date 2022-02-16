// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class PaginaInicial extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  PaginaInicial({Key? key}) : super(key: key);

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  int numeroDePessoas = 0;

  int decrement(int numero) {
    numero--;
    return numero;
  }

  int increment(int numero) {
    numero++;
    return numero;
  }

  bool get isEmpty => numeroDePessoas == 0;
  bool get isFull => numeroDePessoas == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              //color: Colors.black,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  isFull ? 'Lotado!' : 'Pode entrar!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Text(
                    '$numeroDePessoas',
                    style: TextStyle(
                      color: isFull ? Colors.red : Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: isEmpty
                          ? null
                          : () {
                              setState(() {
                                numeroDePessoas = decrement(numeroDePessoas);
                              });
                            },
                      child: Text(
                        'Saiu',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: isEmpty
                            ? Colors.white.withOpacity(0.2)
                            : Colors.white,
                        fixedSize: const Size(100, 100),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                    SizedBox(width: 32),
                    TextButton(
                      onPressed: isFull
                          ? null
                          : () {
                              setState(() {
                                numeroDePessoas = increment(numeroDePessoas);
                              });
                            },
                      child: Text(
                        'Entrou',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: isFull
                            ? Colors.white.withOpacity(0.2)
                            : Colors.white,
                        fixedSize: const Size(100, 100),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
