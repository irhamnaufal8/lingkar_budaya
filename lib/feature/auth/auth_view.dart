import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/Core/router.dart';
import 'package:lingkar_budaya/common/components/button/primary_button.dart';
import 'package:lingkar_budaya/common/data/model/user.dart';
import 'package:lingkar_budaya/common/data/repository/auth_repository.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';

class LoginScreen extends StatefulWidget {
  final bool isRegistering;

  const LoginScreen({super.key, required this.isRegistering});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthRepository authRepository = AuthRepository();

  User userData = User();

  bool isRegistering = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
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
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  isRegistering ? 'Daftar' : 'Login',
                  style: Poppins.bold(24, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  isRegistering
                      ? 'Buat akunmu sekarang juga!'
                      : 'Selamat datang di Lingkar Budaya',
                  style: Poppins.regular(14, color: Colors.white),
                ),
              ),
            ],
          )),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isRegistering
                            ? _buildRegisterView()
                            : _buildLoginView(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(
                        text: isRegistering ? 'Daftar' : 'Login',
                        onTap: () {
                          currentTab = 0;
                          isRegistering
                              ? registerUser()
                              : Navigator.of(context)
                                  .pushNamed(AppRouter.navigationBar);
                        },
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isRegistering
                                    ? 'Sudah memiliki akun?'
                                    : 'Belum memiliki akun?',
                                style: Poppins.regular(14,
                                    color: BaseColors.black2),
                              ),
                              TextButton(
                                child: Text(
                                  isRegistering ? 'Login' : 'Daftar Sekarang',
                                  style: Poppins.bold(14,
                                      color: BaseColors.softBrown,
                                      underline: true),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isRegistering =
                                        isRegistering ? false : true;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
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
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          child: Image.asset(
            'assets/image/img_login.png',
            fit: BoxFit.cover,
          ),
        ),
        buildUsernameTextField(),
        const SizedBox(
          height: 16,
        ),
        buildPasswordField(),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {},
              child: Text(
                'Lupa Kata Sandi?',
                style: Poppins.bold(14, color: BaseColors.softBrown),
              )),
        ),
      ],
    );
  }

  Widget _buildRegisterView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          child: Image.asset(
            'assets/image/img_registration.png',
            fit: BoxFit.cover,
          ),
        ),
        buildNameTextField(),
        const SizedBox(
          height: 16,
        ),
        buildUsernameTextField(),
        const SizedBox(
          height: 16,
        ),
        buildEmailTextField(),
        const SizedBox(
          height: 16,
        ),
        buildPasswordField(),
      ],
    );
  }

  void _showDialog(String title, String description,
      {String buttonText = 'Okay', bool isError = false, Function? action}) {
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
          insetPadding: const EdgeInsets.all(20),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
          ],
        );
      },
    );
  }

  Widget buildUsernameTextField() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: BaseColors.inputGrey,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: TextField(
          onChanged: (value) {
            setState(() {
              userData.username = value;
            });
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'username',
          ),
          style: Poppins.regular(14),
        ),
      ),
    );
  }

  Widget buildNameTextField() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: BaseColors.inputGrey,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: TextField(
          autocorrect: false,
          onChanged: (value) {
            setState(() {
              userData.name = value;
            });
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'nama lengkap',
          ),
          style: Poppins.regular(14),
        ),
      ),
    );
  }

  Widget buildEmailTextField() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: BaseColors.inputGrey,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: TextField(
          autocorrect: false,
          onChanged: (value) {
            setState(() {
              userData.email = value;
            });
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'email',
          ),
          style: Poppins.regular(14),
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: BaseColors.inputGrey,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: TextField(
          autocorrect: false,
          onChanged: (value) {
            setState(() {
              userData.password = value;
            });
          },
          obscureText: !isPasswordVisible,
          style: Poppins.regular(14),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'password',
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  void registerUser() {
    authRepository.register(userData).then((value) {
      authRepository.storeLocalUser(value);
      _showDialog('Registrasi Berhasil!',
          'Yeaay kamu berhasil mendaftarkan akun di Lingkar Budaya!',
          action: () {
        currentTab = 0;
        Navigator.of(context).pushNamed(AppRouter.navigationBar);
      });
    });
  }
}
