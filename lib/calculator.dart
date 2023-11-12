import 'package:calculator/components/my_button.dart';
import 'package:calculator/model/buttonModel.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Buttons>(
      create: (context) => Buttons(),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(children: [
          Expanded(
              child: Container(
            child: Consumer<Buttons>(
              builder: (context, value, child) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          value.userQuestion,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: Text(value.userAnswer,
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  )
                ],
              ),
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: Consumer<Buttons>(
                  builder: (context, value, child) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemCount: value.buttons.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MyButton(
                            isOperator(value.buttons[index])
                                ? Color(0xFFEAAFB7)
                                : isClear(value.buttons[index])
                                    ? Color(0xFF8C2315)
                                    : (value.buttons[index] == '=')
                                        ? Color.fromARGB(255, 147, 158, 211)
                                        : Colors.black,
                            Colors.white,
                            value.buttons[index],
                            () {
                              if (index == 0) {
                                Provider.of<Buttons>(context, listen: false)
                                    .btnClear(index);
                              } else if (index == 1) {
                                Provider.of<Buttons>(context, listen: false)
                                    .btnDel(index);
                              } else if (index == value.buttons.length - 1) {
                                Provider.of<Buttons>(context, listen: false)
                                    .equalPressed();
                              } else {
                                Provider.of<Buttons>(context, listen: false)
                                    .buttonTapped(index);
                              }
                            },
                          );
                        });
                  },
                ),
              ))
        ]),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '\u00F7' || x == 'x' || x == '-' || x == '+') {
      return true;
    }
    return false;
  }

  bool isClear(String x) {
    if (x == 'AC' || x == 'D') {
      return true;
    }
    return false;
  }
}
