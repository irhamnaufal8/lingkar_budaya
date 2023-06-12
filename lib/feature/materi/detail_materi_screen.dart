import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/Core/router.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';
import 'package:lingkar_budaya/feature/materi/materi_screen.dart';

class DetailMateriScreen extends StatefulWidget {
  DummyMateriData data;

  DetailMateriScreen({required this.data});

  @override
  State<DetailMateriScreen> createState() =>
      _DetailMateriScreenState(data: data);
}

class _DetailMateriScreenState extends State<DetailMateriScreen> {
  DummyMateriData data;

  _DetailMateriScreenState({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: 240,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(data.imagePath), fit: BoxFit.cover)),
        ),
        buildContent(),
        buildBackButton()
      ]),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: EdgeInsets.only(top: 260, left: 20, right: 20),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name,
            style: Poppins.bold(20),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            data.description,
            style: Poppins.regular(14, italic: true),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: List<Widget>.generate(data.totalArticle, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: BaseColors.inputGrey),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.white.withOpacity(0.7),
                      onTap: () {
                        print('Tap Artikel ${index + 1}');
                      },
                      borderRadius: BorderRadius.circular(6),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icon/ic_book.png',
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Artikel ${index + 1}',
                              style: Poppins.bold(14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          Column(
            children: List<Widget>.generate(data.totalQuiz, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: BaseColors.inputGrey),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.white.withOpacity(0.7),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AppRouter.quiz, arguments: data);
                      },
                      borderRadius: BorderRadius.circular(6),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icon/ic_edit.png',
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Quiz ${index + 1}',
                              style: Poppins.bold(14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      )),
    );
  }

  Widget buildBackButton() {
    return SafeArea(
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
