import 'package:flutter/material.dart';

void main() {
  runApp(const EasyExams());
}

class EasyExams extends StatelessWidget {
  const EasyExams({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyExams',
      home: const LandingPage(),
    );
  }
}

// -------------------------
// LANDING PAGE
// -------------------------
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.flag_outlined, size: 110, color: Colors.brown),
            const SizedBox(height: 20),

            const Text(
              "EasyExams",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QuizPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                "Start Exam",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------
// QUIZ PAGE
// -------------------------
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Flutter is a framework developed by Google.",
      "answer": true
    },
    {
      "question": "Dart is the programming language used for Flutter.",
      "answer": true
    },
    {
      "question": "Flutter apps cannot run on iOS.",
      "answer": false
    },
    {
      "question": "Widgets in Flutter are immutable.",
      "answer": true
    },
    {
      "question": "Flutter uses Java for UI rendering.",
      "answer": false
    },
  ];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = questions[questionIndex]["answer"];

    if (userAnswer == correctAnswer) {
      score++;
    }

    if (questionIndex == questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(score: score, total: questions.length),
        ),
      );
    } else {
      setState(() {
        questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Quiz"),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Question ${questionIndex + 1} of ${questions.length}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Text(
              questions[questionIndex]["question"],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 50),

            // TRUE BUTTON
            ElevatedButton(
              onPressed: () => checkAnswer(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
              ),
              child: const Text("True", style: TextStyle(fontSize: 20)),
            ),

            const SizedBox(height: 20),

            // FALSE BUTTON
            ElevatedButton(
              onPressed: () => checkAnswer(false),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
              ),
              child: const Text("False", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------
// RESULT PAGE
// -------------------------
class ResultPage extends StatelessWidget {
  final int score;
  final int total;

  const ResultPage({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 110, color: Colors.green),
            const SizedBox(height: 20),
            Text(
              "Your Score",
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 10),
            Text(
              "$score / $total",
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LandingPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: const Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }
}
