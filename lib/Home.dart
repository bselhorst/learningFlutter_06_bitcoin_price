import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String real = '';
  String dolar = '';
  String euro = '';
  _getValue() async {
    String url = "https://blockchain.info/ticker";
    http.Response response;
    response = await http.get(Uri.parse(url));

    Map<String, dynamic> bitcoinValue = json.decode(response.body);

    setState(() {
      this.real = "R\$: " + bitcoinValue["BRL"]["buy"].toString();
      this.dolar = "US\$: " + bitcoinValue["USD"]["buy"].toString();
      this.euro = "EUR: " + bitcoinValue["EUR"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/bitcoin.png"),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 32),
                // ignore: prefer_const_constructors
                child: Text(
                  "${real}",
                  textAlign: TextAlign.justify,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.amberAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                // ignore: prefer_const_constructors
                child: Text(
                  "${dolar}",
                  textAlign: TextAlign.justify,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.amberAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 32),
                // ignore: prefer_const_constructors
                child: Text(
                  "${euro}",
                  textAlign: TextAlign.justify,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.amberAccent,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _getValue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Atualizar",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
