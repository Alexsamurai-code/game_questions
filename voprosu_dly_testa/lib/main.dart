import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:voprosu_dly_testa/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Этот виджет является корнем вашего приложения.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //
  // List<bool> answers = [
  //   true,
  //   false,
  //   true,
  //   true,
  //   false,
  //   false,
  //   true
  // ];
  // List questionBank = [
  //   Question(q: 'Some cats are actually allergic to humans', a: true),
  //   Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  //   Question(
  //       q: 'Approximately one quarter of human bones are in the feet.',
  //       a: true),
  //   Question(q: 'A slug\'s blood is green.', a: true),
  //   Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
  //   Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
  //   Question(
  //       q: 'No piece of square dry paper can be folded in half more than 7 times.',
  //       a: false),
  //   Question(
  //       q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
  //       a: true),
  //   Question(
  //       q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
  //       a: false),
  //   Question(
  //       q: 'The total surface area of two human lungs is approximately 70 square metres.',
  //       a: true),
  //   Question(q: 'Google was originally called \"Backrub\".', a: true),
  //   Question(
  //       q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
  //       a: true),
  //   Question(
  //       q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
  //       a: true),
  // ];
  //Question q1 = Question(q:"Вы можете вести корову вниз по лестнице, но не вверх по лестнице",a: false);

  //int questionNumber = 0; //С какой позиции будут начинаться вопросы
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer =
    quizBrain.getCorrectAnswer(); //Инкапсуляция
    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If true, execute Part A, B, C, D.
      //TODO: Step 4 Part A - show an alert using rFlutter_alert (remember to read the docs for the package!)
      //HINT! Step 4 Part B is in the quiz_brain.dart
      //TODO: Step 4 Part C - reset the questionNumber,
      //TODO: Step 4 Part D - empty out the scoreKeeper.

      //TODO: Step 5 - If we've not reached the end, ELSE do the answer checking steps below 👇
    //Правильно ми ответили
    if (userPickedAnswer == correctAnswer) {
      scoreKeeper.add(const Icon(Icons.check,color: Colors.green,),);
      print('Ты правильно ответила ');
    } else {
      scoreKeeper.add(const Icon(Icons.close,color: Colors.red,),);
      print('Ты не правильно ответила');
    }

      quizBrain.nextQuestio();
      print('Следущий вопрос');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                //quizBrain.getQuestionText(questionNumber), //Инкапсуляция
                //quizBrain.questionBank[questionNumber].questionText,//Обстракция
                //questionBank[questionNumber].questionText,//Инкапсуляция
                //questions[questionNumber],//Это функция к закоментированому выше
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(true);
                // //bool correctAnswer = answers[questionNumber];// Это функция к закоментированому выше
                // //bool correctAnswer = questionBank[questionNumber].questionAnswer;//Инкапсуляция
                // // bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;//Обстракция
                // bool correctAnswer =
                //     quizBrain.getCorrectAnswer(); //Инкапсуляция
                // //Правильно ми ответили
                // if (correctAnswer == true) {
                //   print('Ты правильно ответила ');
                // } else {
                //   print('Ты не правильно ответила');
                // }
                // setState(() {
                //   quizBrain.nextQuestio();
                //   //questionNumber++;//Инкапсуляция
                //   print('Следущий вопрос');
                //   //scoreKeeper.add(const Icon (Icons.close,color:Colors.red),);//Это функция к закоментированому выше
                //   // print('Tru');
                //   // print(q1.questionText);
                //});
              },
              child: const Text(
                'Правда',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(false);
                // // bool correctAnswer = answers[questionNumber];//Это функция к закоментированому выше
                // //bool correctAnswer = questionBank[questionNumber].questionAnswer;
                // //quizBrain.questionBank[questionNumber].questionAnswer = true;//Мы неможем изменить на true
                // // bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;//Обстракция
                //
                // bool correctAnswer =
                //     quizBrain.getCorrectAnswer(); //Инкапсуляция
                // //Правильно ми ответили
                // if (correctAnswer == false) {
                //   //Правильно ми ответили
                //   print('Ты правильно ответила ');
                // } else {
                //   print('Ты не правильно ответила ');
                // }
                // setState(() {
                //   quizBrain.nextQuestio();
                //   //questionNumber++;//Инкапсуляция
                //   //scoreKeeper.add(const Icon (Icons.check,color:Colors.green),);//Это функция к закоментированому выше
                //   print('Следущий вопрос');
                //});
              },
              child: const Text(
                'Лож',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: scoreKeeper,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
      ],
    );
  }
}
