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
  List<QuestionForm> questions = [
    QuestionForm(q: '2+2=4', a: true),
    QuestionForm(q: '2+3=6', a: false),
    QuestionForm(q: '2+8=10', a: true),
  ];
  void nextQuestion() {
    if (questionNo < questions.length - 1) {
      questionNo++;
    }
  }

  String getQuestion() {
    return questions[questionNo].questiontext;
  }

  bool getAnswer() {
    return questions[questionNo].answertext;
  }

  bool isFinished() {
    if (questionNo == questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
