import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs {
  //?defining theme status key
  static const themeStatus = 'THEME_STATUS';

  //***************SETTING DARK THEME METHOD TO SAVE***************//
  setDarkTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(themeStatus, value);
  }

  //***************GETTING DARK THEME METHOD WHICH IS BEING SAVED ***************//

  Future<bool> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(themeStatus) ?? false;
  }
}
