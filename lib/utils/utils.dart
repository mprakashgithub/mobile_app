import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void goBack(
        {dynamic result,
        bool closeOverlays = false,
        bool canPop = true,
        int? id}) =>
    Get.back(
        result: result, closeOverlays: closeOverlays, canPop: canPop, id: id);

//* predicate can be used like this: Get.until((route) => Get.currentRoute == '/home')
//* so when you get to home page,
void getPopUntil(String namedRoute, {int? id}) => Get.until(
      (route) => Get.currentRoute.compareTo(namedRoute) == 0,
      id: id,
    );

Future<dynamic>? push(Widget widget,
    {Object? arguments, bool preventDuplicates = true}) {
  return Get.to(() => widget,
      arguments: arguments, preventDuplicates: preventDuplicates);
}

Future<dynamic>? pushNamed(String routeName,
    {Object? arguments, bool preventDuplicates = true}) {
  return Get.toNamed(routeName,
      arguments: arguments, preventDuplicates: preventDuplicates);
}

Future<dynamic>? pushReplacementNamed(pageName,
    {Object? arguments, bool preventDuplicates = true}) {
  return Get.offAndToNamed(pageName, arguments: arguments);
}

void pushAndRemoveUntil(String page) {
  return Get.until((route) => route.settings.name == page);
}

Future<dynamic>? pushNamedAndRemoveUntil(
  String pageName, {
  RoutePredicate? predicate,
  Object? arguments,
}) {
  return Get.offAllNamed(pageName, predicate: predicate, arguments: arguments);
}

hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

double screenHeight = 0;
double screenWidth = 0;

// String? getNameInitials(String? text) {
//   try {
//     if (text == null || text.isEmpty) {
//       return text;
//     }

//     var commaSpittedList = [
//       for (var ele in text.split(' '))
//         if (ele.isNotEmpty) ele
//     ];
//     if (commaSpittedList.isEmpty ||
//         (commaSpittedList.firstOrNull?.isEmpty ?? true)) {
//       return text;
//     }
//     var firstChar = commaSpittedList.firstOrNull?.firstChar;
//     var secondChar = commaSpittedList.elementAtIndexOrNull(1)?.firstChar;
//     var lastChar = commaSpittedList.length < 3
//         ? null
//         : commaSpittedList.lastOrNull?.firstChar;
//     return "${firstChar ?? ''}${secondChar ?? ''}${lastChar ?? ''}"
//         .toUpperCase();
//   } catch (e) {
//     return null;
//   }
// }

DateTime? dateTimeFromEpoch(int? millisecondsSinceEpoch,
    {bool isProbablyMicroSeconds = true}) {
  if (millisecondsSinceEpoch != null) {
    return DateTime.fromMillisecondsSinceEpoch(
        millisecondsSinceEpoch * (isProbablyMicroSeconds ? 1000 : 1));
  } else {
    return null;
  }
}

String getDateFormatted(String? dateTime,
    {String format = "dd MM yyyy", int? offSet}) {
  if (dateTime == null) {
    return "";
  }
  DateFormat dateFormat = DateFormat(format);
  DateTime? dateParse = DateTime.tryParse(dateTime);

  if (offSet != null) {
    Duration duration = Duration(seconds: offSet);
    dateParse = dateParse?.add(duration);
  }

  if (dateParse == null) {
    return dateTime;
  }
  return dateFormat.format(dateParse);
}

String getDateFormattedFromTimeStamp(int? millisecondsSinceEpoch,
    {String format = "dd MM yyyy", bool isProbablyMicroSeconds = true}) {
  DateFormat dateFormat = DateFormat(format);
  DateTime? dateParse = dateTimeFromEpoch(millisecondsSinceEpoch,
      isProbablyMicroSeconds: isProbablyMicroSeconds);
  if (dateParse == null) {
    return "$millisecondsSinceEpoch";
  }
  return dateFormat.format(dateParse);
}

String getDateUsingTimeStamps(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  final formattedDate = DateFormat('MMMM d, yyyy').format(date);
  return formattedDate;
}

String getDateUsingTimeTwo(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  final formattedDate = DateFormat('MMM d yyyy').format(date);
  return formattedDate;
}

String getDateUsingMilisecond(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  final formattedDate = DateFormat('d MMM yyyy').format(date);
  return formattedDate;
}

String getCurrentDate({int dateValue = 0}) {
  var now = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day + dateValue);
  var formatter = DateFormat('MMM d yyyy');
  return formatter.format(now);
}

void pushNavigator(context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

DateTime getFirstLastDate(
    {bool? lastDay, bool? lastMonth, DateTime? dateTime}) {
  DateTime todayDate = dateTime ?? DateTime.now().toUtc();
  var year = todayDate.year;
  var month = todayDate.month;
  var day = (lastDay == true) ? 0 : 1;
  var hour = (lastDay ?? false) ? 23 : 0;
  var minutes = (lastDay ?? false) ? 59 : 0;
  var seconds = (lastDay ?? false) ? 59 : 0;

  if (lastDay == true && lastMonth != true) {
    month = todayDate.month + 1;
  }

  if (lastDay == true && lastMonth == true) {
    month = todayDate.month;
  }
  if (lastDay != true && lastMonth == true) {
    month = todayDate.month - 1;
  }
  var result = DateTime(year, month, day, hour, minutes, seconds);
  print(result);
  return result;
}

String getTimeStampInSecond(DateTime date) {
  return (date.millisecondsSinceEpoch / 1000).round().toString();
  // return date.millisecondsSinceEpoch.toString();
}

void getCloseOverlaysUntil({String? screenId}) {
  log("getCloseOverlayCalledTill : $screenId");
  Get.until((route) {
    //* return true for stopping method
    if ((Get.isBottomSheetOpen ?? false) || (Get.isDialogOpen ?? false)) {
      return false;
    } else if (screenId == null) {
      return true;
    }
    return route.settings.name == screenId;
  });
}

String? removeInvalidCharFromPhoneNumber(String? phoneNumber) {
  if (phoneNumber == null) {
    return null;
  }
  phoneNumber = phoneNumber.replaceAll('(', '');
  phoneNumber = phoneNumber.replaceAll(')', '');
  phoneNumber = phoneNumber.replaceAll('-', '');
  phoneNumber = phoneNumber.replaceAll(' ', '');
  return phoneNumber;
}

String? sanitizePhoneNumber(
    {required String? phoneNumber,
    required String? mobileRexEx,
    required String? isdCode}) {
  if (mobileRexEx == null || isdCode == null) {
    return null;
  }
  if (phoneNumber?.contains(isdCode) ?? false) {
    phoneNumber = phoneNumber?.split(isdCode).lastOrNull;
  }
  if (phoneNumber?.startsWith('0') ?? false) {
    phoneNumber = phoneNumber?.substring(1);
  }
  if (phoneNumber == null) {
    return null;
  }
  phoneNumber = "$isdCode$phoneNumber";
  return phoneNumber;
}

String? jsonCustomEncode(Map<String, dynamic>? data) {
  try {
    if (data == null) {
      return null;
    }
    return jsonEncode(data);
  } catch (e) {
    log("jsonCustomEncode error", error: e);
  }
  return null;
}

SnackbarController showSnackBar(
  String message, {
  String? title,
  Widget? mainButton,
  SnackStyle snackStyle = SnackStyle.FLOATING,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
  Color backgroundColor = const Color(0xFF303030),
  Function(GetSnackBar)? onTap,
  int? duration,
}) {
  Get.closeAllSnackbars();
  var space = " ";
  return Get.rawSnackbar(
    title: title,
    message: message.isNotEmpty ? message : space,
    borderRadius: 7,
    margin: const EdgeInsets.all(10),
    backgroundColor: backgroundColor,
    isDismissible: true,
    onTap: onTap,
    snackPosition: snackPosition,
    snackStyle: snackStyle,
    duration: (duration ?? 3).seconds,
    mainButton: mainButton,
  );
}

String maskPhone(String phoneNumber) {
  try {
    if (phoneNumber.isNotEmpty && phoneNumber.length > 9) {
      String masked = phoneNumber.substring(0, 3) +
          '*' * (phoneNumber.length - 7) +
          phoneNumber.substring(phoneNumber.length - 4);
      return masked;
    } else {
      return phoneNumber;
    }
  } catch (e) {
    return phoneNumber;
  }
}

String maskEmail(String email) {
  try {
    if (email.isNotEmpty && email.contains('@')) {
      List<String> splitEmail = email.split('@');

      String mask = splitEmail.first.substring(0, 1) +
          '*' * (splitEmail.first.length - 2) +
          splitEmail.first.substring(splitEmail.first.length - 1);
      String masked = '$mask@${splitEmail[1]}';

      return masked;
    } else {
      return email;
    }
  } catch (e) {
    return email;
  }
}

String? messageTime(int? messageTime) {
  if (messageTime == null) {
    return null;
  }
  var time = DateTime.fromMillisecondsSinceEpoch(messageTime);
  final now = DateTime.now();
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final weekAgo = now.subtract(const Duration(days: 6));
  if (time.year == now.year && time.month == now.month && time.day == now.day) {
    // Today
    return DateFormat("hh:mm a").format(time);
  } else if (time.isAfter(yesterday)) {
    // Yesterday
    return 'Yesterday';
  } else if (time.isAfter(weekAgo)) {
    // Within the past week
    return time.weekday == now.weekday
        ? 'Today'
        : time.weekday == now.weekday - 1
            ? 'Yesterday'
            : DateFormat('EEEE').format(time);
  } else {
    // Return date if time is longer than a week ago
    return DateFormat('dd MMM yy').format(time);
  }
}

String utfDecoding(String message) {
  try {
    message = utf8.decode(message.codeUnits);
  } catch (e) {
    log(e.toString());
  }
  return message;
}

String removeExtraHash(String inputString) {
  String result = inputString.replaceAll(RegExp(r'#+'), '#');
  result = result.replaceAll(RegExp(r'^#|#$'), '');
  result = result.replaceAll(RegExp(r'#\s'), ' ');
  return result;
}

Future<void> initializeControllerDispose<S>({bool force = false}) async {
  if (Get.isRegistered<S>()) {
    await Get.delete<S>(force: force);
  }
}

String formattedAmount(dynamic amount) {
  try {
    return NumberFormat.currency(locale: "en_US", symbol: "").format(amount);
  } catch (e) {
    return "";
  }
}

String? formatNumberWithDecimal(String? text, {int decimalRange = 2}) {
  if (text == null) {
    return null;
  }
  if (!text.contains(".")) {
    return text;
  }
  int indexOfDecimal = text.indexOf(".");
  if ((text.length - indexOfDecimal) <= decimalRange) {
    return text;
  }
  text = text.substring(0, indexOfDecimal + decimalRange + 1);
  return text;
}

double? stringToDouble(dynamic value, {bool? isReturnNull}) {
  var tempAmount = value.toString();
  if (tempAmount.isNotEmpty) {
    var tempVal = tempAmount.replaceAll(",", "");
    double? doubleValue;
    if (isReturnNull ?? false) {
      doubleValue = double.tryParse(tempVal);
    } else {
      doubleValue = double.tryParse(tempVal) ?? 0.0;
    }
    return doubleValue;
  }
  return 0.0;
}

int? stringToInt(dynamic value, {bool? isReturnNull}) {
  var tempAmount = value.toString();
  if (tempAmount.isNotEmpty) {
    var tempVal = tempAmount.replaceAll(",", "");
    int? integerValue;
    if (isReturnNull ?? false) {
      integerValue = int.tryParse(tempVal);
    } else {
      integerValue = int.tryParse(tempVal) ?? 0;
    }
    return integerValue;
  }
  return 0;
}

String formatNumberWithCommas(double number) {
  String formattedNumber = NumberFormat.decimalPattern('en').format(number);
  return formattedNumber;
}

String firstNdLast(String? firstName, String? lastName) {
  String name = (firstName ?? "") +
      (lastName != null ? (firstName != null ? " " : "") + lastName : "");
  return name;
}

String dateTimeToStringFormat(DateTime dateTime,
    {String? dateFormat = 'yyyy-MM-dd'}) {
  try {
    return DateFormat(dateFormat).format(dateTime);
  } catch (e) {
    return "";
  }
}

void removeAllDialogs() {
  Get.key.currentState!.popUntil((route) => route.isFirst);
}

dynamic jsonCustomDecode(String? source,
    {Object? Function(Object?, Object?)? reviver, bool isMapOnly = false}) {
  try {
    if (source == null || source.isNotEmpty) {
      return null;
    }
    return jsonDecode(source, reviver: reviver);
  } catch (e) {
    log("jsonCustomDecode error", error: e);
    if (isMapOnly) {
      return null;
    }
    return source;
  }
}
