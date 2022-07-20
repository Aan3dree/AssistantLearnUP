import '../models/assistant_quiz.dart';

class AssistantQuizBrain {
  int _questionNumber = 1;

  final List<AssistantQuiz> _quizData = [
    AssistantQuiz('O que é um assistente virtual inteligente?', [
      'Algo que nos ajuda de forma inteligente',
      'Inteligência digital em nosso cotidiano',
      'Agente de sofware que pode nos auxiliar'
    ]),
    AssistantQuiz('Como surgiram as assistentes virtuais?', [
      'A partir da ingeligência de mercado',
      'Através a união de várias áreas da computação',
      'Através da inovação técnológica de ciêntistas'
    ]),
    AssistantQuiz(
        'De que forma as assistentes virtuais processam informação?', [
      'Por detecção de linguagem natural',
      'Ouvindo nossa fala',
      'Copiando o comportamento humano'
    ]),
    AssistantQuiz(
        'Como as assistentes virtuais encontram respostas para nós?', [
      'Em grandes bases de dados',
      'Em sua memória interna',
      'Pesquisando no google'
    ]),
    AssistantQuiz(
        'Qual área da computação faz assistentes virtuais parecerem com nós?',
        ['Redes de computadores', 'Inteligência artificial', 'Banco de dados']),
    AssistantQuiz(
        'Qual a principal forma de interação das assistentes virtuais',
        ['Voz', 'Visão', 'Contato']),
    AssistantQuiz(
        'Qual dessas aplicações de assistentes virtais pode nos ajudar a ter uma vida melhor?',
        ['Financiais', 'Saúde e bem estar', 'Comercial']),
    AssistantQuiz(
        'Qual dessas aplicações de assistentes virtais pode nos ajudar a conhecer o mundo?',
        ['Saúde e bem estar', 'Financiais', 'Turismo']),
    AssistantQuiz(
        'Qual a principal aplicação das assistentes virtuais disponíveis no mercado?',
        ['Auxílio em atividades', 'Venda de produtos', 'Educação']),
    AssistantQuiz('Fim do Quiz', ['Voltar para home', '', '']),
  ];

  String getQuestion() {
    return _quizData[_questionNumber].title;
  }

  String getChoice(int choose) {
    return _quizData[_questionNumber].choices[choose - 1];
  }

  bool isCorrectAnswer(int userInput) {
    if (userInput == 3 && _questionNumber == 0) {
      return true;
    } else if (userInput == 2 && _questionNumber == 1) {
      return true;
    } else if (userInput == 1 && _questionNumber == 2) {
      return true;
    } else if (userInput == 1 && _questionNumber == 3) {
      return true;
    } else if (userInput == 2 && _questionNumber == 4) {
      return true;
    } else if (userInput == 1 && _questionNumber == 5) {
      return true;
    } else if (userInput == 2 && _questionNumber == 6) {
      return true;
    } else if (userInput == 3 && _questionNumber == 7) {
      return true;
    } else if (userInput == 1 && _questionNumber == 8) {
      return true;
    } else {
      return false;
    }
  }

  void nextQuestion() {
    //print('Question number $_questionNumber');
    _questionNumber++;
    //print('Question number $_questionNumber');
    /*
    try {
      if (!isFinished()) {
        if (_questionNumber < _quizData.length) {
          int lenf = _quizData.length;
          print('Question number $_questionNumber');
          print('Quiz Lenght $lenf');
          _questionNumber++;
        }
      } else {
        endGame();
      }
    } catch (e) {
      print('crashou no nextQuestion');
      print(e);
    }
    * */
  }

  bool isFinished() {
    try {
      if (_questionNumber == _quizData.length - 2) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      //print('crashou no isFinished e vai retornar false');
      //print(e);
    } finally {
      return false;
    }
  }

  void endGame() {
    _questionNumber = 9;
  }
/*
  void endGame() {
    try {
      _questionNumber = 9;
    } catch (e) {
      print('crashou no endGame');
      print(e);
    }
  }
  * */
}
