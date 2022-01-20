import 'package:voprosu_dly_testa/question.dart';
class QuizBrain {
  int _questionNumber = 0; //С какой позиции будут начинаться вопросы
  final List _questionBank = [
    Question(q: 'У некоторых кошек на самом деле аллергия на людей', a: true),
    Question(q: 'Вы можете вести корову вниз по лестнице, но не вверх по лестнице.', a: false),
    Question(
        q: 'Примерно четверть человеческих костей находится в стопах.',
        a: true),
    Question(q: 'Кровь слизня зеленого цвета.', a: true),
    Question(q: 'Девичья фамилия матери Базза Олдрина была "Луна".', a: true),
    Question(q: 'В Португалии запрещено мочиться в Океан.', a: true),
    Question(
        q: 'Ни один квадратный кусок сухой бумаги нельзя сложить пополам более 7 раз.',
        a: false),
    Question(
        q: 'В Лондоне, Великобритания, если вам случится умереть в здании парламента, вы технически имеете право на государственные похороны, потому что это здание считается слишком священным местом.',
        a: true),
    Question(
        q: 'Самый громкий звук, производимый любым животным, - 188 децибел. Это животное - африканский слон.',
        a: false),
    Question(
        q: 'Общая площадь двух легких человека составляет примерно 70 квадратных метров.',
        a: true),
    Question(q: 'Изначально Google назывался "Backrub".', a: true),
    Question(
        q: 'Шоколад влияет на сердце и нервную систему собаки; нескольких унций достаточно, чтобы убить маленькую собаку.',
        a: true),
    Question(
        q: 'В Западной Вирджинии, США, если вы случайно сбили животное своей машиной, вы можете забрать его домой, чтобы поесть.',
        a: true),
  ];
  void nextQuestio(){//
    if (_questionNumber < _questionBank.length -1){
        _questionNumber++;
    }
    print(_questionNumber);
    print(_questionBank.length);
  }
  // String getQuestionText(int questionNumber){
  //   return _questionBank[questionNumber].questionText;//Инкапсуляция

  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;//Инкапсуляция
  }
  // bool getCorrectAnswer(int questionNumber){
  //   return _questionBank[questionNumber].questionAnswer;//Инкапсуляция

bool getCorrectAnswer(){
    return _questionBank[_questionNumber].questionAnswer;//Инкапсуляция
}
  bool isFinished() {
    return _questionNumber == _questionBank.length - 1;
  }

  void reset() {
    if (isFinished()) {
      _questionNumber = 0;
    }
    print('Что произошло');
  }
}
