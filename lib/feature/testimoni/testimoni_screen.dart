import "package:flutter/material.dart";
import "package:lingkar_budaya/common/Core/constants.dart";
import "package:lingkar_budaya/common/components/button/primary_button.dart";
import "package:lingkar_budaya/common/components/button/secondary_button.dart";
import "package:lingkar_budaya/common/data/model/testimoni.dart";
import "package:lingkar_budaya/common/data/model/user.dart";
import "package:lingkar_budaya/common/data/repository/auth_repository.dart";
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
  final TestimoniRepository testimoniRepository = TestimoniRepository();
  List<Testimoni> testimonies = [];

  AuthRepository authRepository = AuthRepository();
  User? userData = User();

  @override
  void initState() {
    super.initState();
    if (testimonies.isEmpty) {
      getTestimoniList();
    }
    authRepository.getLocalUser().then((value) {
      setState(() {
        userData = value;
        print('Current User Data');
        print(userData);
      });
    }).catchError((error) {
      print(error);
    });
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
              child: RefreshIndicator(
                onRefresh: refreshTestimoniData,
                child: ListView.builder(
                    itemCount: testimonies.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: buildCard(
                              testimonies[testimonies.length - 1 - index]));
                    }),
              ),
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
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: PopupMenuButton<int>(
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                  value: 1,
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Edit")
                                    ],
                                  )),
                              PopupMenuItem(
                                  value: 2,
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Delete")
                                    ],
                                  ))
                            ],
                        onSelected: (value) {
                          if (value == 1) {
                            _showEditBottomSheet(context, data);
                          } else if (value == 2) {
                            _showDialog('Hapus Testimoni',
                                'Apakah kamu yakin untuk menghapus testimoni ini?',
                                buttonText: 'Hapus',
                                doubleButton: true,
                                isError: true, action: () {
                              deleteTestimoni(data.id ?? 0);
                            });
                          }
                        },
                        icon: Icon(
                          Icons.more_horiz,
                          color: BaseColors.black2,
                        )),
                  ),
                )
              ],
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
    Testimoni testimoniData = Testimoni(name: userData?.name ?? '');

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
                              userData?.name ?? '',
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
                                    testimoniData.ratingStar = (index + 1);
                                  });
                                },
                                child: Icon(
                                  Icons.star,
                                  color: (testimoniData.ratingStar ?? 0) >=
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
                                  testimoniData.comment = value;
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
                        isDisable: (testimoniData.ratingStar ?? 0) < 1 ||
                            (testimoniData.comment ?? "").isEmpty,
                        onTap: () {
                          Navigator.pop(context);
                          createTestimoni(testimoniData);
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

  void _showEditBottomSheet(BuildContext context, Testimoni testimoniData) {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Edit',
                            style: Poppins.bold(24),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.cancel,
                              fill: null,
                              color: BaseColors.borderGrey,
                            ),
                          ),
                        ],
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
                              userData?.name ?? '',
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
                                    testimoniData.ratingStar = (index + 1);
                                  });
                                },
                                child: Icon(
                                  Icons.star,
                                  color: (testimoniData.ratingStar ?? 0) >=
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
                                  testimoniData.comment = value;
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
                        text: "Edit Testimoni",
                        isDisable: (testimoniData.ratingStar ?? 0) < 1 ||
                            (testimoniData.comment ?? "").isEmpty,
                        onTap: () {
                          Navigator.pop(context);
                          editTestimoni(testimoniData, testimoniData.id ?? 0);
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

  void _showDialog(String title, String description,
      {String buttonText = 'Okay',
      bool doubleButton = false,
      bool isError = false,
      Function? action}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          icon: Icon(
            isError ? Icons.warning : Icons.task_alt,
            size: 80,
          ),
          iconColor: isError ? Colors.red : Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            title,
            style: Poppins.bold(20),
            textAlign: TextAlign.center,
          ),
          content: Text(
            description,
            style: Poppins.regular(14),
            textAlign: TextAlign.center,
          ),
          insetPadding: EdgeInsets.all(20),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: PrimaryButton(
                text: buttonText,
                onTap: () {
                  Navigator.pop(context);
                  action!();
                },
              ),
            ),
            doubleButton
                ? Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: SecondaryButton(
                      text: "Batal",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                : Container(
                    width: 0,
                    height: 0,
                  ),
          ],
        );
      },
    );
  }

  void getTestimoniList() {
    testimoniRepository.getTestimoniList().then((value) {
      setState(() {
        testimonies = value;
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future<void> refreshTestimoniData() async {
    getTestimoniList();
  }

  void createTestimoni(Testimoni body) {
    testimoniRepository.createTestimoni(body, () {
      print('success create');
      _showDialog('Testimoni Berhasil Terkirim!',
          'Testimoni kamu berhasil di posting, klik Okay untuk menutup.',
          action: () {
        getTestimoniList();
      });
    }, () {
      _showDialog('Testimoni Gagal Terkirim!',
          'Testimoni kamu gagal di posting, klik Okay untuk menutup.',
          isError: true);
    });
  }

  void editTestimoni(Testimoni body, int id) {
    testimoniRepository.editTestimoni(id, body, () {
      _showDialog('Testimoni Berhasil di Edit!',
          'Testimoni kamu berhasil di edit, klik Okay untuk menutup.',
          action: () {
        getTestimoniList();
      });
    }, () {
      _showDialog('Testimoni Gagal di Edit!',
          'Testimoni kamu gagal di edit, klik Okay untuk menutup.',
          isError: true);
    });
  }

  void deleteTestimoni(int id) {
    testimoniRepository.deleteTestimoni('$id', () {
      _showDialog('Testimoni Berhasil Dihapus!',
          'Testimoni kamu berhasil dihapus, klik Okay untuk menutup.',
          action: () {
        getTestimoniList();
      });
    }, () {
      _showDialog('Testimoni Gagal Dihapus!',
          'Testimoni kamu gagal dihapus, klik Okay untuk menutup.',
          isError: true);
    });
  }
}
