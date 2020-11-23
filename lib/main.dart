import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0" ;
  String _output = "0" ;
  double num1 = 0.0;
  double num2 = 0.0;
  String operands ="";

  buttonPressed(String Buttontext) {
    if (Buttontext == "CLEAR") {
      _output = "0";
      num1 = 0.0;
       num2 = 0.0;
     operands = "";
    }
    else if (Buttontext == "+" || Buttontext == "-" || Buttontext == "X" ||
        Buttontext == "/") {
      num1 = double.parse(output);
      operands = Buttontext;
      _output = "0";
    }

    else if (Buttontext == ".") {
      if (_output.contains(".")) {
        print("Already contains a Decimals");
        return;
      }
      else {
        _output = _output + Buttontext;
      }
    }
    else if (Buttontext == "=") {
      num2 = double.parse(output);
      if (operands == "+") {
        _output = (num1 + num2).toString();
      }
      if (operands == "-") {
        _output = (num1 - num2).toString();
      }
      if (operands == "X") {
        _output = (num1 * num2).toString();
      }
      if (operands == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operands = "";
    } else{
      _output = _output + Buttontext;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget Buildbutton(String Buttontext){
    return Expanded(
      child: OutlineButton(
       child: FlatButton(
         padding: EdgeInsets.all(24.0),
         child: Text(Buttontext,
         style: TextStyle(
           fontSize: 20.0,
           fontWeight: FontWeight.bold,
         ),
         ),
         textColor: Colors.white,
         onPressed: () {
           setState(() {
             buttonPressed(Buttontext);
           });
         },
       ),
     ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 24.0),
              child: Text(output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),

            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Buildbutton("7"),
                    Buildbutton("8"),
                    Buildbutton("9"),
                    Buildbutton("/"),

                  ],
                ),
                Row(
                  children: [
                    Buildbutton("4"),
                    Buildbutton("5"),
                    Buildbutton("6"),
                    Buildbutton("X"),

                  ],
                ),
                Row(
                  children: [
                    Buildbutton("1"),
                    Buildbutton("2"),
                    Buildbutton("3"),
                    Buildbutton("-"),

                  ],
                ),
                Row(
                  children: [
                    Buildbutton("."),
                    Buildbutton("0"),
                    Buildbutton("00"),
                    Buildbutton("+"),

                  ],
                ),
                Row(
                  children: [
                    Buildbutton("CLEAR"),
                    Buildbutton("="),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
