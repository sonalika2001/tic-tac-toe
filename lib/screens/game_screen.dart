import 'package:flutter/material.dart';

import 'package:tic_tac_toe/constants.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool oTurn = true;
  int filledboxes = 0;
  List<String> xno = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int Oscore = 0;
  int Xscore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
          body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 0.08 * MediaQuery.of(context).size.height),
            Center(
              child: Text(
                'TIC-TAC-TOE',
                style: ktitletextstyle,
              ),
            ),
            SizedBox(height: 0.08 * MediaQuery.of(context).size.height),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        onClick(index);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[700],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          xno[index],
                          style: kgametextstyle,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 0.015 * MediaQuery.of(context).size.height),
            Center(
              child: Text(
                'SCOREBOARD',
                style: kscoretitlestyle,
              ),
            ),
            SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Player O',
                            style: kscorestyle,
                          ),
                        ),
                        Text(
                          Oscore.toString(),
                          style: kscorestyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Player X',
                            style: kscorestyle,
                          ),
                        ),
                        Text(
                          Xscore.toString(),
                          style: kscorestyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onClick(int index) {
    setState(() {
      if (oTurn && xno[index] == '') {
        xno[index] = 'O';
        print('o');
      } else if (!oTurn && xno[index] == '') {
        xno[index] = 'X';
        print('x');
      }
      filledboxes++;
      oTurn = !oTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    print('entered');
    if (xno[0] == xno[1] && xno[0] == xno[2] && xno[0] != '') {
      showWinner(xno[0]);
    }

    // checks 2nd row
    else if (xno[3] == xno[4] && xno[3] == xno[5] && xno[3] != '') {
      showWinner(xno[3]);
    }

    // checks 3rd row
    else if (xno[6] == xno[7] && xno[6] == xno[8] && xno[6] != '') {
      showWinner(xno[6]);
    }

    // checks 1st column
    else if (xno[0] == xno[3] && xno[0] == xno[6] && xno[0] != '') {
      showWinner(xno[0]);
    }

    // checks 2nd column
    else if (xno[1] == xno[4] && xno[1] == xno[7] && xno[1] != '') {
      showWinner(xno[1]);
    }

    // checks 3rd column
    else if (xno[2] == xno[5] && xno[2] == xno[8] && xno[2] != '') {
      showWinner(xno[2]);
    }

    // checks diagonal
    else if (xno[6] == xno[4] && xno[6] == xno[2] && xno[6] != '') {
      showWinner(xno[6]);
    }

    // checks diagonal
    else if (xno[0] == xno[4] && xno[0] == xno[8] && xno[0] != '') {
      showWinner(xno[0]);
    } else if (filledboxes == 9) {
      draw();
    }
  }

  void showWinner(String winner) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                '$winner is the winner!',
                style: kalerttitlestyle,
              ),
            ),
            actions: [
              MaterialButton(
                color: Colors.white,
                child: Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      'Play Again',
                      style: kalertcontentstyle,
                    )),
                  ],
                ),
                onPressed: () {
                  clearboard();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
    if (winner == 'O') {
      Oscore += 1;
    } else if (winner == 'X') {
      Xscore += 1;
    }
  }

  void draw() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              'Uh Oh! It\'s a draw.',
              style: kalerttitlestyle,
            ),
            actions: [
              MaterialButton(
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right:10),
                    child: Text(
                      'Play Again',
                      style: kalertcontentstyle,
                    ),
                  ),
                ),
                onPressed: () {
                  clearboard();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void clearboard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        xno[i] = '';
      }
    });

    filledboxes = 0;
  }
}
