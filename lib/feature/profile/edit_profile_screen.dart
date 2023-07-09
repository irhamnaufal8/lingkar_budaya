import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/components/button/primary_button.dart';
import 'package:lingkar_budaya/common/data/model/user.dart';
import 'package:lingkar_budaya/common/data/repository/auth_repository.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  AuthRepository authRepository = AuthRepository();
  User? user;
  User? defaultUser;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  String? confirmPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocalUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: BaseColors.primaryGreen,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: BaseColors.primaryGreen,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 35),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icon/ic_default_avatar.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      defaultUser?.name ?? '',
                      style: Poppins.bold(20, color: Colors.white),
                    ),
                    Text(
                      defaultUser?.email ?? '',
                      style: Poppins.medium(16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Info Personal',
                        style: Poppins.bold(20),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Text(
                        'Ubah Nama Lengkap',
                        style: Poppins.regular(14, color: BaseColors.black2),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      buildNameTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Perbarui Password',
                        style: Poppins.regular(14, color: BaseColors.black2),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      buildPasswordField(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Konfirmasi Password',
                        style: Poppins.regular(14, color: BaseColors.black2),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      buildConfirmationPasswordField(),
                      const SizedBox(
                        height: 6,
                      ),
                      !isPasswordSame()
                          ? Text(
                              'Konfirmasi password harus sama',
                              style: Poppins.medium(12, color: Colors.red),
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      const SizedBox(
                        height: 34,
                      ),
                      PrimaryButton(
                        text: 'Simpan',
                        onTap: () {
                          editUser();
                        },
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getLocalUser() {
    authRepository.getLocalUser().then((value) {
      setState(() {
        user = value;
        user?.password = null;
        defaultUser = User(
            id: value?.id,
            name: value?.name,
            email: value?.email,
            password: value?.password);
        print('USER ID: ${user?.id}');
      });
    });
  }

  void editUser() {
    authRepository
        .editUser(defaultUser?.id ?? 0,
            name: user?.name, password: user?.password)
        .then((value) {
      _showDialog();
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          icon: const Icon(
            Icons.task_alt,
            size: 80,
          ),
          iconColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Berhasil Edit Profile',
            style: Poppins.bold(20),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Yeay! Kamu berhasil mengubah profile kamu.',
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
                text: 'Okay',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        );
      },
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
              user?.name = value;
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
              user?.password = value;
              isPasswordSame();
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

  Widget buildConfirmationPasswordField() {
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
              confirmPassword = value;
              isPasswordSame();
            });
          },
          obscureText: !isConfirmPasswordVisible,
          style: Poppins.regular(14),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'konfirmasi password',
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  isConfirmPasswordVisible = !isConfirmPasswordVisible;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  bool isPasswordSame() {
    return user?.password == confirmPassword;
  }
}
