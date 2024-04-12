import '../../services/configuration/model/language_model.dart';
import '../gen/assets.gen.dart';

class AppConstants {
  static const String appName = "Pacific Loyalty";
  static List<LanguageModel> languages = [
    LanguageModel(
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
      jsonData: Assets.json.en,
    ),
    LanguageModel(
      languageName: 'हिन्दी',
      countryCode: 'IN',
      languageCode: 'hi',
      jsonData: Assets.json.hi,
    ),
  ];

  static String mobileRegExp = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

  static bool isNameOnly(String s) => hasMatch(s, r'^[A-Za-zÀ-ÖØ-öø-ÿ .]+$');

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static bool isDialogShowing = false;
}

const String noInternetTag =
    "Please check your internet connection and try again";

const String sendbirdAppID = '13192011-356C-4A7F-8AD2-4F393A752B26';
const String sendbirdApiTokenMaster =
    '49f9089f95120a8f86da30eafb65d5295bb0382e';
// const String sendbirdApiTokenAjay = '0ce34c0d0082a76b1bac0f47e34a2fe32d715c9f';
const String sendbirdApiToken = '9788207f9af064f2b83768320742f74babcbac84';
const String freshChatNonLoginUrl =
    'https://dev-spg-cdn.azureedge.net/strapi-service/html/help-guest-user.html';
