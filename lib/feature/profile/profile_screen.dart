import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/Core/router.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColors.primaryGreen,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                    'Rich Andienty',
                    style: Poppins.bold(22, color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {
                        print('edit tapped');
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
                    Navigator.popUntil(context, (route) => route.isFirst);
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
            ]),
          ),
        ));
  }
}
