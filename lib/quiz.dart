import 'package:adv_basics/questions-screen.dart';
import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'questions-screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //Widget activeScreen = StartScreen(switchScreen); // Error
  // Happens too early happens at the same point of time where switchScreen is created
  // It is not guaranted it exists yet
  // initState - to do extra initializations when state object is created for the 1st time.
  // Executed once

  // Widget? activeScreen;

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }

  // This solution doesn't require initState
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 78, 13, 151),
                    Color.fromARGB(255, 107, 15, 168)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: screenWidget),
        ));
  }
}
