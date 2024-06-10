import 'dart:math';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import '../presentation/resources/routes_manager.dart';
import 'app_prefs.dart';
import 'di.dart';

bool isCurrentLanguageEn(context) {
  return EasyLocalization.of(context)!.locale.languageCode == 'en'
      ? true
      : false;
}

String translateString(
    {String? arString, String? enString, required BuildContext context}) {
  if (arString == null || enString == null) {
    nullTranslateString(arString: arString, enString: enString);
  } else if (isCurrentLanguageEn(context)) {
    return enString;
  } else {
    return arString;
  }
  return "";
}

String? nullTranslateString({String? arString, String? enString}) {
  if (arString == null) {
    return enString;
  } else if (enString == null) {
    return arString;
  }
  return null;
}

String truncateString({required String input, required int maxLength}) {
  if (input.length > maxLength) {
    return "${input.substring(0, maxLength)}...";
  } else {
    return input;
  }
}

String extractTime(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  int hour = dateTime.hour;
  int minute = dateTime.minute;

  // تحويل الساعة إلى تنسيق 12 ساعة
  String period = (hour < 12) ? 'AM' : 'PM';
  if (hour > 12) {
    hour = hour - 12;
  }

  // إضافة صفر إذا كانت الدقائق أقل من 10
  String minuteString = (minute < 10) ? '0$minute' : '$minute';

  // إعداد النص النهائي
  String formattedTime = '$hour:$minuteString $period';
  return formattedTime;
}

String extractDay(String date) {
  // Splitting the date into parts
  List<String> parts = date.split(' ')[0].split('-');

  // Getting day and month
  int day = int.parse(parts[2]);
  int month = int.parse(parts[1]);

  // Converting month to its name
  List<String> months = [
    '',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  String monthName = months[month];

  // Returning the formatted date
  return '$day $monthName';
}

logOut(BuildContext context) {
  AppPreferences appPreferences = instance<AppPreferences>();
  appPreferences.logout().then(
      (value) => Navigator.of(context).pushReplacementNamed(Routes.loginRoute));
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isMobileNumberValid(String mobileNumber) {
  RegExp regex = RegExp(r'^(01[0-2]|02|03|015)[0-9]{8}$');
  return regex.hasMatch(mobileNumber);
}

bool isValidName(String name) {
  RegExp nameRegex = RegExp(r"^[a-zA-Z\u0600-\u06FF\s]{4,}$");
  return nameRegex.hasMatch(name);
}

bool containsArabic(List<String>? strings) {
  if (strings == null) {
    return false;
  }

  for (final string in strings) {
    for (final char in string.runes) {
      if ((char >= 0x0600 && char <= 0x06FF) ||
          (char >= 0xFB50 && char <= 0xFDFF) ||
          (char >= 0xFE70 && char <= 0xFEFF)) {
        return true;
      }
    }
  }
  return false;
}

bool containsEnglish(List<String>? strings) {
  if (strings == null) {
    return false;
  }

  for (final string in strings) {
    for (final char in string.runes) {
      if ((char >= 0x0041 && char <= 0x007A) ||
          (char >= 0x00C0 && char <= 0x024F)) {
        return true;
      }
    }
  }
  return false;
}

bool containsArabicLetter(List<String>? strings) {
  if (strings == null) {
    return false;
  }

  for (final string in strings) {
    for (final char in string.runes) {
      if ((char >= 0x0600 && char <= 0x06FF) ||
          (char >= 0xFB50 && char <= 0xFDFF) ||
          (char >= 0xFE70 && char <= 0xFEFF)) {
        return true;
      }
    }
  }
  return false;
}

bool isEnglishOrArabic(String input) {
  for (int i = 0; i < input.length; i++) {
    int charCode = input.codeUnitAt(i);
    if ((charCode >= 65 && charCode <= 90) ||
        (charCode >= 97 && charCode <= 122) ||
        (charCode >= 1280 && charCode <= 1919) ||
        (charCode >= 2208 && charCode <= 2303)) {
      continue;
    } else {
      return false;
    }
  }
  return true;
}

setStatusBarTextBlack() {
  /// Set the status bar text color to black
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
}

setStatusBarTextLight() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
}

filteringTextFormatter() {
  return FilteringTextInputFormatter.allow(
      RegExp(r'^[\u0600-\u06FFa-zA-Z\s]+$'));
}

getTextDirection(BuildContext context) {
  return isCurrentLanguageEn(context)
      ? ui.TextDirection.ltr
      : ui.TextDirection.rtl;
}

bool isEmailRegValid(String email) {
  String mail = email.trim();

  final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    caseSensitive: false,
    multiLine: false,
  );

  return emailRegex.hasMatch(mail);
}

userNameFiltering() {
  return FilteringTextInputFormatter.allow(RegExp(r"[0-9]"));
}

bool isTablet(MediaQueryData query) {
  var size = query.size;
  var diagonal = sqrt((size.width * size.width) + (size.height * size.height));



  var isTablet = diagonal > 1100.0;
  return isTablet;
}
late Dio dio ;
void init(){
  dio = Dio(
    BaseOptions(
      baseUrl: 'https://eye-tracker.onrender.com/eyeTracker/',
      receiveDataWhenStatusError: true,
      headers: {
        //'Content-Type': 'application/json',
        //'Content-Type':'multipart/form-data',
      },
    ),
  );
}

Future<Response> postData({
  required dynamic data,
  bool formDataIsEnabled = false,
}) async {
  return await dio.post(
    '',
    data: formDataIsEnabled ? FormData.fromMap(data!) : data,
  );
}



