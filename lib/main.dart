import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int enemyAnswer = 0;
  int yourAnswer = 0;
  String yourLinkImage = 'assets/images/rock.jpg';
  String enemyLinkImage = 'assets/images/rock.jpg';

  void getEnemyAnswer() {
    enemyAnswer = new Random().nextInt(3);
    if (enemyAnswer == 0) {
      enemyLinkImage = 'assets/images/rock.jpg';
    } else if (enemyAnswer == 1) {
      enemyLinkImage = 'assets/images/paper.png';
    } else if (enemyAnswer == 2) {
      enemyLinkImage = 'assets/images/scissors.png';
    }
  }

  String getResult() {
    if ((yourAnswer == 0 && enemyAnswer == 2) ||
        (yourAnswer == 1 && enemyAnswer == 0) ||
        (yourAnswer == 2 && enemyAnswer == 1)) {
      return "You Win!!";
    } else if ((yourAnswer == 0 && enemyAnswer == 1) ||
        (yourAnswer == 1 && enemyAnswer == 2) ||
        (yourAnswer == 2 && enemyAnswer == 0)) {
      return "You lose!!";
    } else {
      return "Draw";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("JanKenPon Game")),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 100),
                    child: Text(getResult(),
                        style:
                            TextStyle(fontSize: 60, fontFamily: "ChunkFive"))),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 30, bottom: 20),
                        child: Text("You",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, bottom: 20),
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Enemy",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 20, bottom: 90),
                      child: Image.asset(yourLinkImage, height: 90, width: 90)),
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 90),
                    child: RotationTransition(
                        turns: AlwaysStoppedAnimation(180 / 360),
                        child:
                            Image.asset(enemyLinkImage, height: 90, width: 90)),
                  )
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        child: Text("Rock", style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          setState(() {
                            yourAnswer = 0;
                            yourLinkImage = 'assets/images/rock.jpg';
                            getEnemyAnswer();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8)),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                          child: Text("Paper", style: TextStyle(fontSize: 20)),
                          onPressed: () {
                            setState(() {
                              yourAnswer = 1;
                              yourLinkImage = 'assets/images/paper.png';
                              getEnemyAnswer();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: EdgeInsets.fromLTRB(15, 8, 15, 8))),
                      SizedBox(width: 20),
                      ElevatedButton(
                          child:
                              Text("Scissor", style: TextStyle(fontSize: 20)),
                          onPressed: () {
                            setState(() {
                              yourAnswer = 2;
                              yourLinkImage = 'assets/images/scissors.png';
                              getEnemyAnswer();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: EdgeInsets.fromLTRB(15, 8, 15, 8))),
                    ]),
              ],
            )));
  }
}
