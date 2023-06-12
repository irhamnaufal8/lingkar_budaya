import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';
import 'package:lingkar_budaya/feature/materi/materi_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuizScreen extends StatefulWidget {
  DummyMateriData data;

  QuizScreen({required this.data});

  @override
  State<QuizScreen> createState() => _QuizScreenState(data: data);
}

class _QuizScreenState extends State<QuizScreen> {
  DummyMateriData data;

  _QuizScreenState({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz ${data.name}',
          style: Poppins.bold(16, color: Colors.white),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: BaseColors.primaryGreen,
      ),
      body: WebView(
        initialUrl: data.quizURL,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
