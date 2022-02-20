class QuestionForm {
  late String questiontext;
  late bool answertext;

  QuestionForm({required String q, required bool a}) {
    questiontext = q;
    answertext = a;
  }
}

class QuestionBank {
  int questionNo = 0;

  List<QuestionForm> _questions = [
    QuestionForm(q: '2+2=4', a: true),
    QuestionForm(q: '2+3=6', a: false),
    QuestionForm(q: '2+8=10', a: true),
  ];

  void nextQuestion() {
    if (questionNo < _questions.length - 1) {
      questionNo++;
    }
  }

  String getQuestion() {
    return _questions[questionNo].questiontext;
  }

  bool getAnswer() {
    return _questions[questionNo].answertext;
  }

  bool isFinished() {
    if (questionNo == _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
