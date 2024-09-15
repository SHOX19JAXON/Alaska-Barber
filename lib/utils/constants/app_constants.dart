import 'package:flutter/services.dart';


class AppConstants {
  static String placeHolder = "";
  static RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  static RegExp passwordRegExp = RegExp(r"^(?=.*[A-Z]).{8,}$");
  static RegExp telegramOnlyLettersAndNumbersWithoutFirstCapital = RegExp( r'@([A-Za-z0-9_]{5,32})');
  static RegExp noMinusOrLettersNoZero = RegExp(r'^[^0a-zA-Z-]');
  static RegExp textRegExp = RegExp("[a-zA-Z]");
  static RegExp phoneRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  static String messageKey =
      "AAAA3JEaxN8:APA91bEPLFrTRYkCeTGI6mdJuqD5Ir_rmstsWgH0ATW7vvVjyn9_9YTRH5vgvMpA3COjBzjsOwvJM-6eNd-fuG98uC2I9crRql4grbeSuv2A6WF-spRAw8tMkoc-4odYRw0wWqQYJlOi";
  static const String vacancyTable = 'vacancy_table_sunnatillo';
  static const String saveVacancyTable = 'save_vacancy_table_sunnatillo';
  static String resumesTable = "resumes_table_sunnatillo";
  static String categories = "categories";
  static String banners = "banners";
  static String subCategories = "sub_categories";
  //
  // static SystemUiOverlayStyle getOverlayStyle() => const SystemUiOverlayStyle(
  //       statusBarColor: AppColors.transparent,
  //     );
}

List<String> levels = [
  "INTERNSHEEP",
  "JUNIOR",
  "MIDDLE",
  "SENIOR",
  "EXPERT",
  "TEAM LEADER",
  "PROJECT MANAGER",
];
List<String> workTypes = [
  "UYDAN",
  "OFISDAN",
  "HAR QANDAY",
];

List<String> selectTime = [
  "Ma'lum bir vaqt",
  "Toliq kun",
  "Farqi yo'q",
];

String partTime = "Ma'lum bir vaqt";
String fullTime = "Toliq kun";
String itDoesNotMatter = "Farqi yo'q";
