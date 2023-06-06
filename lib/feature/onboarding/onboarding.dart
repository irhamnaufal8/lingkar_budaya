import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/Core/router.dart';
import 'package:lingkar_budaya/common/components/button/primary_button.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';

class OnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 80, left: 52, right: 52, bottom: 42),
              child: Image.asset(
              'assets/image/img_onboarding.png',
              fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20, 
                vertical: 30
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang di',
                    style: Poppins.bold(24)
                  ),

                  Text(
                    'Lingkar Budaya',
                    style: Poppins.bold(24, color: BaseColors.darkBrown)
                  ),

                  const SizedBox(height: 12, width: double.infinity),

                  Text(
                    'Kami adalah ahli waris yang sah dari kebudayaan dunia dan kebudayaan ini kami teruskan dengan cara kami sendiri',
                    style: Poppins.regular(14, color: BaseColors.black2)
                  ),
                  const SizedBox(height: 32),

                  PrimaryButton(
                    text: 'Daftar Sekarang',
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRouter.login, arguments: true);
                    },
                    ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah memiliki akun?',
                        style: Poppins.regular(14, color: BaseColors.black2),
                      ),
                      TextButton(
                        child: 
                          Text(
                          'Login',
                          style: Poppins.bold(
                            14, 
                            color: BaseColors.softBrown,
                            underline: true
                          ),
                          ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRouter.login, arguments: false);
                        },
                      )
                    ],
                  ),
                ],
              ),
            )
            ),
        ],
      ),
      backgroundColor: BaseColors.cream,
    );
  }
}