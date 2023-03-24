import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceteria_app/Themes/theme.dart';
import 'package:provider/provider.dart';

import '../../Providers/ThemeProviders/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: themeState.getDarkTheme
                      ? [
                          bgColorDark,
                          bgLightBlack,
                        ]
                      : [
                          Colors.white,
                          Colors.amber.shade100,
                        ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: themeState.getDarkTheme
                        ? Colors.amber.withOpacity(0.1)
                        : Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: const Icon(
                IconlyLight.profile,
                size: 50,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Sana Khan',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              'sana7@gmail.com',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            _listTiles(themeState,
                title: 'Orders', icon: IconlyLight.tickSquare, onTap: () {}),
            _listTiles(themeState,
                title: 'WishList', icon: IconlyLight.heart, onTap: () {}),
            _listTiles(themeState,
                title: 'Viewed', icon: IconlyLight.show, onTap: () {}),
            _listTiles(themeState,
                title: 'Payments', icon: IconlyLight.wallet, onTap: () {}),
            _listTiles(themeState, title: 'Address', icon: IconlyLight.location,
                onTap: () async {
              await _showAddressDialog();
            }),
            _listTiles(themeState, title: 'Settings', icon: IconlyLight.setting,
                onTap: () async {
              await _showSettingDialog();
            }),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: themeState.getDarkTheme
                      ? [
                          bgColorDark,
                          bgLightBlack,
                        ]
                      : [
                          Colors.white,
                          Colors.amber.shade100,
                        ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: themeState.getDarkTheme
                        ? Colors.amber.withOpacity(0.1)
                        : Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: SwitchListTile(
                activeColor: Colors.yellow,
                title: const Text("Theme"),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.dark_mode_rounded
                    : Icons.light_mode),
                onChanged: (bool value) {
                  setState(() {
                    themeState.setDarkTheme = value;
                  });
                },
                value: themeState.getDarkTheme,
              ),
            ),
            _listTiles(themeState,
                title: 'Logout', icon: IconlyLight.logout, onTap: () {})
          ],
        ),
      ),
    );
  }

  Future<void> _showSettingDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Settings'),
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                      onTap: () {},
                      child: const Text(
                        'Help & Support',
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Info',
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {},
                      child: const Text(
                        'Privacy Policy',
                      )),
                ]),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: const Text('Address Book'),
            content: TextField(
              onChanged: (val) {},
              controller: addressController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: 'Your Address'),
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.amber),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'cancle',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          );
        });
  }

  Container _listTiles(
    DarkThemeProvider themeState, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: themeState.getDarkTheme
              ? [
                  bgColorDark,
                  bgLightBlack,
                ]
              : [
                  Colors.white,
                  Colors.amber.shade100,
                ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: themeState.getDarkTheme
                ? Colors.amber.withOpacity(0.1)
                : Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        leading: Icon(icon),
        trailing: const Icon(IconlyLight.arrowRight),
        onTap: onTap,
      ),
    );
  }
}
