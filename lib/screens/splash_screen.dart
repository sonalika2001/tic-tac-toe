import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height:40),
            Expanded(
              flex: 1,
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.all(0.01* MediaQuery.of(context).size.height),
                  child: Text(
                    'TIC-TAC-TOE',
                    style: ktitletextstyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: AvatarGlow(
                  duration: Duration(milliseconds: 1500),
                  child: Container(
                    decoration: ksplashscreendecor,
                    child: CircleAvatar(
                      radius: 0.25 * MediaQuery.of(context).size.width,
                      backgroundColor: Colors.grey[900],
                      child: Image.asset(
                        './images/tictactoelogo.png',
                        color: Colors.white,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  endRadius: 0.45 * MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '@aureate_halcyon',
                    style: knamestyle,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:40),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GameScreen()));
                },
                color: Colors.white,
                height: 0.08* MediaQuery.of(context).size.height,
                child: Text('Play Game',style: kbuttonstyle,),
                padding: EdgeInsets.symmetric(vertical:15,horizontal: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
