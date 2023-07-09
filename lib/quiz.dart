import 'package:flutter/material.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/Data/question.dart';
import 'package:quizapp/result_screen.dart';

class Quiz extends StatefulWidget{
  Quiz({super.key});

  @override

  State<Quiz> createState(){
    return _QuizState();
}
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";
  void switchScreen(){
    setState(() {
      activeScreen = 'question-screen';
    });
  }
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length){
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }
  @override
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen=='question-screen'){
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer,
      );
    }
    if(activeScreen=='result-screen'){
      screenWidget = ResultScreen(choosenAnswers: selectedAnswers, onRestart: restartQuiz,);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 78 , 13, 151),
                  Color.fromARGB(255, 107 , 15,168),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}