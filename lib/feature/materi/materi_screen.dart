import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/Core/router.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';

class DummyMateriData {
  String imagePath;
  String name;
  String description;
  int totalArticle;
  int totalQuiz;
  String quizURL;

  DummyMateriData(
      {required this.imagePath,
      required this.name,
      required this.description,
      required this.totalArticle,
      required this.totalQuiz,
      required this.quizURL});
}

class MateriScreen extends StatefulWidget {
  const MateriScreen({super.key});

  @override
  _MateriScreenState createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  List<DummyMateriData> dummyData = [
    DummyMateriData(
        imagePath: 'assets/image/img_dummy_1.png',
        name: 'Sumatera Utara',
        description:
            '“Unang hosom roham tujolma nahasea, ala dang taboto aha na dikorbanhon lao mencapai hasonangon i”',
        totalArticle: 1,
        totalQuiz: 1,
        quizURL: 'https://forms.gle/WFMjaL4A2RHtNw9u8'),
    DummyMateriData(
        imagePath: 'assets/image/img_dummy_2.png',
        name: 'DKI Jakarta',
        description:
            '“Kalo emang ente mau nantangin, eh aye sanggup biar ada perlawanan.”',
        totalArticle: 1,
        totalQuiz: 1,
        quizURL: 'https://forms.gle/yKisQhoyP7mQ9LsC8'),
    DummyMateriData(
        imagePath: 'assets/image/img_dummy_3.png',
        name: 'Jawa Tengah',
        description:
            '“Unang hosom roham tujolma nahasea, ala dang taboto aha na dikorbanhon lao mencapai hasonangon i”',
        totalArticle: 1,
        totalQuiz: 1,
        quizURL: 'https://forms.gle/FkK1zHGh9K8sDSqc7'),
    DummyMateriData(
        imagePath: 'assets/image/img_dummy_4.png',
        name: 'Papua',
        description:
            '“Unang hosom roham tujolma nahasea, ala dang taboto aha na dikorbanhon lao mencapai hasonangon i”',
        totalArticle: 1,
        totalQuiz: 1,
        quizURL: 'https://forms.gle/guHEKc3ru9QSTxGk9'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.primaryGreen,
      body: SafeArea(
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  'Materi Pembelajaran',
                  style: Poppins.bold(24, color: Colors.white),
                )),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: dummyData.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                AppRouter.detailMateri,
                                arguments: dummyData[index]);
                          },
                          child: buildCard(dummyData[index])));
                }),
          )
        ]),
      ),
    );
  }

  Widget buildCard(DummyMateriData data) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage(data.imagePath),
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  data.name,
                  style: Poppins.bold(16),
                )),
            Container(
              color: BaseColors.borderGrey,
              height: 1,
              width: double.infinity,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icon/ic_book.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${data.totalArticle} Artikel',
                        style: Poppins.regular(14, color: BaseColors.black2),
                      )
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icon/ic_edit.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${data.totalQuiz} Quiz',
                        style: Poppins.regular(14, color: BaseColors.black2),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
