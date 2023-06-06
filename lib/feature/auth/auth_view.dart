import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/Core/router.dart';
import 'package:lingkar_budaya/common/components/button/primary_button.dart';
import 'package:lingkar_budaya/common/components/input_field/primary_text_field.dart';
import 'package:lingkar_budaya/common/components/input_field/secured_text_field.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';

class LoginScreen extends StatefulWidget {
  final bool isRegistering;

  LoginScreen({required this.isRegistering});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRegistering = false;
  bool isPasswordVisible = false;
  PrimaryTextField usernameTextField = PrimaryTextField(placeholder: 'username');
  PrimaryTextField emailTextField = PrimaryTextField(placeholder: 'email');
  PrimaryTextField nameTextField = PrimaryTextField(placeholder: 'nama lengkap');
  SecuredTextField passwordTextField = SecuredTextField(placeholder: 'password');

  @override
  void initState() {
    super.initState();
    // isRegistering = widget.isRegistering;
    isRegistering = widget.isRegistering;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.primaryGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 16,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                isRegistering ? 'Daftar' : 'Login',
                style: Poppins.bold(24, color: Colors.white),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                isRegistering ? 'Buat akunmu sekarang juga!' : 'Selamat datang di Lingkar Budaya',
                style: Poppins.regular(14, color: Colors.white),
              ),
            ),

              ],)
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: isRegistering ? _buildRegisterView() : _buildLoginView(),
                    ),
            
                    SizedBox(height: 20,),
            
                    PrimaryButton(
                      text: isRegistering ? 'Daftar' : 'Login',
                      onTap: () {
                        currentTab = 0;
                        Navigator.of(context).pushNamed(AppRouter.navigationBar);
                      },
                    ),
                      
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isRegistering ? 'Sudah memiliki akun?' : 'Belum memiliki akun?',
                                style: Poppins.regular(14, color: BaseColors.black2),
                              ),
                                            
                              TextButton(
                                child: Text(
                                  isRegistering ? 'Login' : 'Daftar Sekarang',
                                  style: Poppins.bold(14, color: BaseColors.softBrown, underline: true),
                                ),
                                onPressed: () {
                                  setState(() {
                                    this.isRegistering = isRegistering ? false : true;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
            
                    SizedBox(height: 20,),
                  ],)
                ),
              ),
            ),
          ],
        ),
      );
  }

  Widget _buildLoginView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          child: Image.asset(
            'assets/image/img_login.png',
            fit: BoxFit.cover,
          ),
        ),
        usernameTextField,

        SizedBox(height: 16,),

        passwordTextField,

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {}, 
            child: Text(
              'Lupa Kata Sandi?',
              style: Poppins.bold(14, color: BaseColors.softBrown),
            )
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          child: Image.asset(
            'assets/image/img_registration.png',
            fit: BoxFit.cover,
          ),
        ),
        nameTextField,
        SizedBox(height: 16,),
        usernameTextField,
        SizedBox(height: 16,),
        emailTextField,
        SizedBox(height: 16,),
        passwordTextField,
      ],
    );
  }
}