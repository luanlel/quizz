import 'package:flutter/material.dart';
import 'tela_resultado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, Object>> perguntas = [
    {'pergunta': 'Qual a banda mais influente da história?', 
                    'alternativas': ['Queen', 'Led Zeppelin', 'The Beatles', 'The Rolling Stones'],
                    'resposta': 'The Beatles'},
    {'pergunta': 'Em qual país foi feito o sushi?', 
                    'alternativas': ['Inglaterra', 'Irlanda', 'México', 'Japão'],
                    'resposta': 'Japão'},
    {'pergunta': 'Quem escreveu O Senhor dos Anéis?',
                    'alternativas': ['J.R.R.Tolkien', 'C.S.Lewis', 'Brandon Sanderson', 'George Orwell'],
                    'resposta': 'J.R.R.Tolkien'},
    {'pergunta': 'Em qual continente está o Monte Everest?', 
                    'alternativas': ['Europa', 'Antártida', 'Ásia', 'Oceania'],
                    'resposta': 'Ásia'},
    {'pergunta': 'Quando saiu o primeiro filme de Star Wars?', 
                    'alternativas': ['1977', '1980', '2001', '1994'],
                    'resposta': '1977'},
    {'pergunta': 'Quando o homem pisou na lua?', 
                    'alternativas': ['1959', '1969', '1979', '1989'],
                    'resposta': '1969'},
    {'pergunta': 'Quem foi o filósofo responsável pela frase "Penso, logo existo"?', 
                    'alternativas': ['Sócrates', 'Platão', 'Immanuel Kant', 'René Descartes'],
                    'resposta': 'René Descartes'},
    {'pergunta': 'Qual a provável religião mais antiga do mundo?', 
                    'alternativas': ['Judaísmo', 'Cristianismo', 'Hinduismo', 'Islamismo'],
                    'resposta': 'Hinduismo'},
    {'pergunta': 'Em qual país houve a Guerra de Secessão?', 
                    'alternativas': ['Estados Unidos', 'Brasil', 'França', 'Islândia'],
                    'resposta': 'Estados Unidos'},
    {'pergunta': 'Quantos anos durou a Segunda Guerra Mundial?', 
                    'alternativas': ['6 anos', '7 anos', '8 anos', '9 anos'],
                    'resposta': '6 anos'}
  ];


  int indice = 0;
  int pontuacao = 0;
  String mensagem = '';

  void _verificarResposta(String respostaSelecionada) {
    setState(() {
      String resposta = perguntas[indice]['resposta'] as String;

      if (respostaSelecionada == resposta) {
        pontuacao++;
        mensagem = 'Correto!';
      } else {
        mensagem = 'Incorreto! A resposta correta é $resposta.';
      }

      if (indice < perguntas.length - 1) {
        indice++;
      } else {
        mensagem += ' Quiz finalizado! Pontuação: $pontuacao de ${perguntas.length}.';
        indice = 0;
        pontuacao = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Image.network(
              'https://img.freepik.com/premium-vector/quiz-time-speech-bubble-isolated-design_569027-82.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 7,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    perguntas[indice]['pergunta'] as String,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ...( perguntas[indice]['alternativas'] as List<String>).map((alternativas) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                        onPressed: () => _verificarResposta(alternativas),
                        child: Text(alternativas),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  Text(
                    mensagem,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
