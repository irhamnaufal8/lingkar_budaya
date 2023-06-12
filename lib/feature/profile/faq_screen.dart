import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';

class FAQ {
  String question;
  String answer;

  FAQ({required this.question, required this.answer});
}

class FAQScreen extends StatefulWidget {
  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<FAQ> data = [
    FAQ(
      question: 'Apa itu Lingkar Budaya?',
      answer:
          'Platform Lingkar Budaya merupakan sebuah platform yang dirancang untuk memudahkan seseorang dalam mengenal dan mempelajari kebudayaan Indonesia. Perangkat lunak berfokus pada visualisasi pembelajaran materi melalui artikel, video, forum, dan quiz.',
    ),
    FAQ(
      question: 'Apa saja fitur Lingkar Budaya?',
      answer:
          'Terdapat beberapa fitur pembelajaran seperti artikel kebudayaan, video penjelsana serta quiz. Selain itu terdapat forum diskusi untuk sesama user.',
    ),
    FAQ(
      question: 'Bagaimana cara mengerjakan quiz?',
      answer:
          'Pergi ke halaman pembelajaran lalu pilih menu quiz pada bagian akhir konten.',
    ),
    FAQ(
      question: 'Mengapa saya tidak bisa mengakses quiz?',
      answer:
          'Untuk mengakses forum dan quiz anda diharuskan untuk login/ memiliki akun terlebih dahulu.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQ',
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: BaseColors.primaryGreen,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: BaseColors.primaryGreen,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 35),
                child: Image.asset('assets/image/img_faq.png'),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List<Widget>.generate(data.length, (index) {
                    return buildTile(data[index]);
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTile(FAQ data) {
    return Card(
      child: Card(
        elevation: 0,
        shadowColor: Colors.transparent,
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          title: Text(
            data.question,
            style: Poppins.bold(18),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                data.answer,
                style: Poppins.regular(14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
