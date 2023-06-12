import "package:flutter/material.dart";
import "package:lingkar_budaya/common/components/button/primary_button.dart";
import "package:lingkar_budaya/common/data/model/testimoni.dart";
import "package:lingkar_budaya/common/data/repository/testimoni_repository.dart";
import "package:lingkar_budaya/common/resources/colors.dart";
import "package:lingkar_budaya/common/resources/fonts.dart";

class Review {
  int? id;
  String? name;
  int? ratingStar;
  String? comment;

  Review({this.id, this.name, this.ratingStar, this.comment});
}

class TestimoniScreen extends StatefulWidget {
  @override
  _TestimoniScreenState createState() => _TestimoniScreenState();
}

class _TestimoniScreenState extends State<TestimoniScreen> {
  List<Review> dummyData = [
    Review(
        id: 1,
        name: "Rich Andiety",
        ratingStar: 5,
        comment:
            "Lingkar Budaya adalah website yang bagus dan inovatif karena bisa memberi wawasan luas tentang kebudayaan Indonesia"),
    Review(id: 2, name: "Naufal", ratingStar: 3, comment: "Hmm bole laa"),
    Review(id: 3, name: "Abdul", ratingStar: 4, comment: "Baguss"),
    Review(
        id: 4,
        name: "Fadhly",
        ratingStar: 5,
        comment: "Bagus bangett saya sangat suka dengan UI nya"),
    Review(id: 5, name: "Rizal", ratingStar: 4, comment: "Okeoke"),
    Review(id: 6, name: "Rici", ratingStar: 4, comment: "bolee"),
  ];

  final TestimoniRepository testimoniRepository = TestimoniRepository();
  List<Testimoni> testimonies = [];

  @override
  void initState() {
    super.initState();
    if (testimonies.isEmpty) {
      testimoniRepository.getTestimoniList().then((value) {
        setState(() {
          testimonies = value;
        });
      }).catchError((error) {
        print(error.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.primaryGreen,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  "Testimoni",
                  style: Poppins.bold(24, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(
                text: "Buat Testimoni Kamu",
                onTap: () {
                  _showBottomSheet(context);
                },
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: testimonies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: buildCard(testimonies[index]));
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCard(Testimoni data) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List<Widget>.generate(5, (index) {
                return Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: (data.ratingStar ?? 0) >= (index + 1)
                          ? BaseColors.softBrown
                          : BaseColors.inActiveGrey,
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                );
              }),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              '"${data.comment}"',
              style: Poppins.regular(14, color: BaseColors.black2),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icon/ic_default_avatar.png',
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  data.name ?? "",
                  style: Poppins.bold(16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    Review reviewData = Review(name: "Rich Andiety");

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return FractionallySizedBox(
              heightFactor: 0.8,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.cancel,
                            fill: null,
                            color: BaseColors.borderGrey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Nama",
                        style: Poppins.medium(12, color: BaseColors.black2),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: BaseColors.inputGrey,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: BaseColors.borderGrey, width: 1)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              reviewData.name ?? "",
                              style: Poppins.medium(14),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Pilih Rating",
                        style: Poppins.medium(12, color: BaseColors.black2),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                          children: List<Widget>.generate(5, (index) {
                        return Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    reviewData.ratingStar = (index + 1);
                                  });
                                },
                                child: Icon(
                                  Icons.star,
                                  color: (reviewData.ratingStar ?? 0) >=
                                          (index + 1)
                                      ? BaseColors.softBrown
                                      : BaseColors.inActiveGrey,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        );
                      })),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Tulis Komentar",
                        style: Poppins.medium(12, color: BaseColors.black2),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 290,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                                color: BaseColors.borderGrey, width: 1)),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  reviewData.comment = value;
                                });
                              },
                              maxLines: null,
                              style: Poppins.medium(14),
                              decoration: InputDecoration(
                                hintText: 'Tulis komentarmu di sini...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(
                        text: "Kirim Testimoni",
                        isDisable: (reviewData.ratingStar ?? 0) < 1 ||
                            (reviewData.comment ?? "").isEmpty,
                        onTap: () {
                          Navigator.pop(context);
                          _showDialog();
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          icon: Icon(
            Icons.task_alt,
            size: 80,
          ),
          iconColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Testimoni Berhasil Terkirim!',
            style: Poppins.bold(20),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Testimoni kamu berhasil di posting, klik Okay untuk menutup.',
            style: Poppins.regular(14),
            textAlign: TextAlign.center,
          ),
          insetPadding: EdgeInsets.all(20),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: PrimaryButton(
                text: "Okay",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
