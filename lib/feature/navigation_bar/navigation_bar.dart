import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/Core/router.dart';
import 'package:lingkar_budaya/common/components/button/navigation_icon.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';
import 'package:lingkar_budaya/common/resources/fonts.dart';
import 'package:lingkar_budaya/feature/home/home_screen.dart';
import 'package:lingkar_budaya/feature/materi/materi_screen.dart';
import 'package:lingkar_budaya/feature/profile/profile_screen.dart';

class AppNavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<AppNavigationBar> {
  late List<Widget> tabScreen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabScreen = [
      HomeScreen(() {
        setState(() {
          currentTab = 1;
        });
      }), MateriScreen(), Text('Testimoni'), ProfileScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabScreen[currentTab],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 25.0,
              offset: Offset(0, -6),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: NavigationIcon(
                iconPath: 'assets/icon/tab_home.svg',
                isActive: currentTab == 0,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: NavigationIcon(
                iconPath: 'assets/icon/tab_materi.svg',
                isActive: currentTab == 1,
              ),
              label: 'Materi',
            ),
            BottomNavigationBarItem(
              icon: NavigationIcon(
                iconPath: 'assets/icon/tab_testimoni.svg',
                isActive: currentTab == 2,
              ),
              label: 'Testimoni',
            ),
            BottomNavigationBarItem(
              icon: NavigationIcon(
                iconPath: 'assets/icon/tab_profile.svg',
                isActive: currentTab == 3,
              ),
              label: 'Profil',
            ),
          ],
          currentIndex: currentTab,
          onTap: (index) {
            setState(() {
              currentTab = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: BaseColors.softBrown,
          unselectedItemColor: BaseColors.inActiveGrey,
          selectedLabelStyle: Poppins.medium(12),
          unselectedLabelStyle: Poppins.medium(12),
        ),
      ),
    );
  }
}