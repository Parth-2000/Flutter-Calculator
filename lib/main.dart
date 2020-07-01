// Importing the Pakages
import 'package:flutter/material.dart';

// Main Function
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator App",
      home: CalcPage(),
    );
  }
}

class CalcPage extends StatefulWidget {
  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  double num1;
  String previousOperator = "";
  String operatorPressed = "";
  double displayAns = 0;

  // Main Function for the working of Calculator
  void calculateFunction(String value) {
    switch (value) {
      case 'C':
        setState(() {
          displayAns = 0;
          num1 = 0;
          previousOperator = "";
          operatorPressed = "";
        });
        break;
      case '+':
        if (previousOperator == "=" || previousOperator == "") {
          operatorPressed = '+';
          previousOperator = '+';
          setState(() {
            num1 = displayAns;
            displayAns = 0;
          });
        } else {
          setState(() {
            if (previousOperator == '+') {
              displayAns = num1 + displayAns;
              num1 = displayAns;
              displayAns = 0;
              previousOperator = '+';
              operatorPressed = "";
            }
            if (previousOperator == '-') {
              displayAns = num1 - displayAns;
              num1 = displayAns;
              displayAns = 0;
              previousOperator = '+';
              operatorPressed = "";
            }
            if (previousOperator == '*') {
              displayAns = num1 * displayAns;
              num1 = displayAns;
              displayAns = 0;
              previousOperator = '+';
              operatorPressed = "";
            }
          });
        }
        break;
      case '-':
        if (previousOperator == "=" || previousOperator == "") {
          operatorPressed = '-';
          previousOperator = '-';
          setState(() {
            num1 = displayAns;
            displayAns = 0;
          });
        } else {
          setState(() {
            if (previousOperator == '+') {
              displayAns = num1 + displayAns;
              print(displayAns);
              num1 = displayAns;
              displayAns = 0;
              previousOperator = '-';
            }
            if (previousOperator == '-') {
              displayAns = num1 - displayAns;
              num1 = displayAns;
              displayAns = 0;
              previousOperator = '-';
              operatorPressed = "";
            }
            if (previousOperator == '*') {
              displayAns = num1 * displayAns;
              num1 = displayAns;
              displayAns = 0;
              previousOperator = '-';
              operatorPressed = "";
            }
          });
        }
        break;
      case '*':
        if (previousOperator == "=" || previousOperator == "") {
          num1 = displayAns;
          previousOperator = '*';
          operatorPressed = '*';
          setState(() {
            displayAns = 0;
          });
        } else {
          setState(() {
            if (previousOperator == '+') {
              displayAns = num1 + displayAns;
              num1 = displayAns;
              displayAns = 0;
              previousOperator = '*';
            }
            if (previousOperator == '-') {
              displayAns = num1 - displayAns;
              num1 = displayAns;
              displayAns = 0;
              previousOperator = '*';
              operatorPressed = "";
            }
            if (previousOperator == '*') {
              displayAns = num1 * displayAns;
              num1 = displayAns;
              displayAns = 0;
              previousOperator = '*';
              operatorPressed = "";
            }
          });
        }
        break;
      case '=':
        setState(() {
          if (operatorPressed == '+' || previousOperator == '+') {
            displayAns = num1 + displayAns;
            previousOperator = '=';
            operatorPressed = "";
          }
          if (operatorPressed == '-' || previousOperator == '-') {
            displayAns = num1 - displayAns;
            previousOperator = '=';
            operatorPressed = "";
          }
          if (operatorPressed == '*') {
            displayAns = num1 * displayAns;
            previousOperator = '=';
            operatorPressed = "";
          }
        });
        break;
      default:
        setState(() {
          displayAns = displayAns * 10 + double.parse(value);
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Calculator",
          style: TextStyle(
            color: Colors.grey[800],
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 1.5,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10.0),
                height: 100.0,
                margin: EdgeInsets.only(bottom: 120.0, top: 160.0),
                child: Text(
                  displayAns.toString(),
                  style: TextStyle(
                    fontSize: 28.0,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: returnButton("7"),
                  ),
                  Expanded(
                    child: returnButton("8"),
                  ),
                  Expanded(
                    child: returnButton("9"),
                  ),
                  Expanded(
                    child: returnButtonOperator("*"),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: returnButton("4"),
                  ),
                  Expanded(
                    child: returnButton("5"),
                  ),
                  Expanded(
                    child: returnButton("6"),
                  ),
                  Expanded(
                    child: returnButtonOperator("-"),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: returnButton("1"),
                  ),
                  Expanded(
                    child: returnButton("2"),
                  ),
                  Expanded(
                    child: returnButton("3"),
                  ),
                  Expanded(
                    child: returnButtonOperator("+"),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: returnButtonOperator("C"),
                  ),
                  Expanded(
                    flex: 3,
                    child: returnButton("0"),
                  ),
                  Expanded(
                    flex: 6,
                    child: returnButtonOperator("="),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Button Widget Function that returns Button
  Widget returnButton(String btnValue) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        // width: 93.0,
        height: 50.0,
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            calculateFunction(btnValue);
          },
          child: Text(
            btnValue,
            style: TextStyle(fontSize: 24.0, color: Colors.teal[600]),
          ),
        ),
      ),
    );
  }

  // Button Widget Function that returns Button for operators
  Widget returnButtonOperator(String btnOperator) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        // width: 93.0,
        height: 50.0,
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            calculateFunction(btnOperator);
          },
          child: Text(
            btnOperator,
            style: TextStyle(fontSize: 24.0, color: Colors.teal[900]),
          ),
        ),
      ),
    );
  }
}
