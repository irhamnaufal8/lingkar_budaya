import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/Core/constants.dart';
import 'package:lingkar_budaya/common/Core/router.dart';
import 'package:lingkar_budaya/common/components/button/primary_button.dart';
import 'package:lingkar_budaya/common/components/button/secondary_button.dart';
import 'package:lingkar_budaya/common/data/model/user.dart';
import 'package:lingkar_budaya/common/data/repository/auth_repository.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthRepository authRepository = AuthRepository();
  User? userData = User();

  @override
  void initState() {
    super.initState();
    getLocalUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColors.primaryGreen,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: refreshUserData,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/icon/ic_default_avatar.png',
                    width: 100,
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userData?.name ?? '',
                        style: Poppins.bold(22, color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRouter.editProfile);
                          },
                          icon: Image.asset(
                            'assets/icon/ic_white-edit.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.fitWidth,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(6),
                          splashColor: Colors.grey.withOpacity(0.7),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/icon/ic_people.png',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'About Us',
                                  style: Poppins.bold(14),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(AppRouter.faq);
                          },
                          borderRadius: BorderRadius.circular(6),
                          splashColor: Colors.grey.withOpacity(0.7),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/icon/ic_faq.png',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'FAQ',
                                  style: Poppins.bold(14),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white),
                        color: Colors.transparent),
                    child: InkWell(
                      onTap: () {
                        _showDialog();
                      },
                      borderRadius: BorderRadius.circular(50),
                      splashColor: Colors.grey.withOpacity(0.7),
                      child: Center(
                        child: Text(
                          'Log out',
                          style: Poppins.bold(14, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Lingkar Budaya Version 1.0',
                      style: Poppins.medium(14, color: Colors.white),
                    ),
                  )),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void getLocalUser() {
    authRepository.getLocalUser().then((value) {
      authRepository.getUserData(value?.username ?? '').then((remoteValue) {
        authRepository.updateLocalUser(remoteValue).then((_) {
          authRepository.getLocalUser().then((newValue) {
            setState(() {
              userData = newValue;
              print('Current User Data');
              print(newValue);
            });
          }).catchError((error) {
            print(error);
          });
        });
      });
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> refreshUserData() async {
    getLocalUser();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          icon: Icon(
            Icons.warning,
            size: 80,
          ),
          iconColor: BaseColors.softBrown,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Log out?',
            style: Poppins.bold(20),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Apakah kamu yakin untuk log out? Kamu harus login kembali untuk menggunakan aplikasi Lingkar Budaya.',
            style: Poppins.regular(14),
            textAlign: TextAlign.center,
          ),
          insetPadding: EdgeInsets.all(20),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: PrimaryButton(
                text: 'Log out',
                onTap: () {
                  authRepository.deleteLocalUser().then((value) {
                    Navigator.pop(context);
                    Navigator.popUntil(context, (route) => route.isFirst);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: SecondaryButton(
                text: "Batal",
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
