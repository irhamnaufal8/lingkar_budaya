import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/components/button/primary_button.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toScreen;

  const HomeScreen(this.toScreen, {super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState(toScreen);
}

class _HomeScreenState extends State<HomeScreen> {

  final VoidCallback toScreen;

  _HomeScreenState(this.toScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.primaryGreen,
      body: SafeArea(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 25, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image/logo.png',
                        width: 34,
                        height: 34,
                      ),
                      const SizedBox(width: 14),
                      Text('Lingkar Budaya', style: Poppins.bold(15, color: Colors.white),)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Image.asset(
                    'assets/image/img_home_banner.png',
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),


                Expanded(
                  child: 
                    Container(
                      decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bagaimana Cara Mulai Belajar?', style: Poppins.bold(18),),

                          const SizedBox(height: 15,),

                          Row(
                            children: [
                              Image.asset(
                                'assets/icon/ic_badge_1.png',
                                width: 46,
                                height: 46,
                              ),
                              const SizedBox(width: 6,),

                              Text('Buka Menu Pembelajaran', style: Poppins.medium(14),)
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 22, top: 4, bottom: 4),
                            child: Container(
                              width: 2,
                              height: 12,
                              color: BaseColors.primaryGreen,
                            ),
                          ),

                          Row(
                            children: [
                              Image.asset(
                                'assets/icon/ic_badge_2.png',
                                width: 46,
                                height: 46,
                              ),
                              const SizedBox(width: 6,),

                              Expanded(
                                child: Text(
                                  'Pilih salah satu provinsi yang tersedia dalam list', 
                                  style: Poppins.medium(14),
                                ),
                              )
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 22, top: 4, bottom: 4),
                            child: Container(
                              width: 2,
                              height: 12,
                              color: BaseColors.primaryGreen,
                            ),
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icon/ic_badge_3.png',
                                width: 46,
                                height: 46,
                              ),
                              const SizedBox(width: 6,),

                              Expanded(
                                child: Text(
                                  'Akan terdapat beberapa artikel, video, dan quiz yang tersedia dan siap untuk didpelajari', 
                                  style: Poppins.medium(14),
                                ),
                              )
                            ],
                          ),

                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: PrimaryButton(
                                text: 'Mulai Belajar Sekarang!',
                                onTap: () {
                                  toScreen();
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ),
              ],
            )
      ),
    );
  }
}