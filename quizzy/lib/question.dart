class QuestionForm {
  late String questiontext;
  late bool answertext;

  QuestionForm({required String q, required bool a}) {
    questiontext = q;
    answertext = a;
  }
}

class QuestionBank {
  int _questionNo = 0;

  List<QuestionForm> _questions = [
    QuestionForm(q: '2+2=4', a: true),
    QuestionForm(q: '2+3=6', a: false),
    QuestionForm(q: '2+8=10', a: true),
  ];

  void nextQuestion() {
    if (_questionNo < _questions.length - 1) {
      _questionNo++;
    }
  }

  String getQuestion() {
    return _questions[_questionNo].questiontext;
  }

  bool getAnswer() {
    return _questions[_questionNo].answertext;
  }

  bool isFinished() {
    if (_questionNo == _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
