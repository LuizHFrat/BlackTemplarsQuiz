import 'package:flutter/material.dart';
import 'package:new_app/mainscreen_gradient.dart';
import 'package:new_app/questions_screen.dart';
import 'package:new_app/data/questions.dart';
import 'package:new_app/results_screen.dart';

//Como trocar de telas como em um Quiz, usar ternary expressions.

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState(); //If every single use of this, carry a _ it'll only be used inside of this.
    //if another file could get access to it, that other code wouldn't be able to.
  }
}

//it belongs to the class above /\ which is NOT private.
class _QuizState extends State<Quiz> {
  //_ means private class only usable inside this file!
  List<String> selectedAnswers = []; //Needs properties and answers.
  var activeScreen = 'mainscreen-gradient';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

//Reset function. How to get back to the first page
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = MainscreenGradient(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
//How to get back to the first page!
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 163, 5, 5),
                Color.fromARGB(255, 37, 7, 6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
