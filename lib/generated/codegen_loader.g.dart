// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar_EGY = {
    // "loading": "تحميل...",
    "noRouteFound": "لا توجد شاشة",
    "SUCCESS": "تم بنجاح",
    "NO_CONTENT": "لا يوجد محتوى",
    "BAD_REQUEST": "طلب غير صالح ، حاول مرة أخرى في وقت لاحق",
    "FORBIDDEN": "طلب محظور ، حاول مرة أخرى لاحقًا",
    "UNAUTHORIZED": "المستخدم غير مصرح به ، حاول مرة أخرى لاحقًا",
    "NOT_FOUND": "طلب لم يتم العثور عليه ، حاول مرة أخرى لاحقًا",
    "INTERNAL_SERVER_ERROR": "حدث خطأ ما ، حاول مرة أخرى لاحقًا",
    "EMPTY_LIST": "قائمة فارغة ، حاول مرة أخرى",
    "CONNECT_TIMEOUT": "خطأ انتهاء المهلة ، حاول مرة أخرى لاحقًا",
    "CANCEL": "تم إلغاء الطلب ، حاول مرة أخرى لاحقًا",
    "RECEIVE_TIMEOUT": "خطأ انتهاء المهلة ، حاول مرة أخرى لاحقًا",
    "SEND_TIMEOUT": "خطأ انتهاء المهلة ، حاول مرة أخرى لاحقًا",
    "CASHE_ERROR": "خطأ في ذاكرة التخزين المؤقت ، حاول مرة أخرى لاحقًا",
    "NO_INTERNET_CONNECTION": "الرجاء التحقق من اتصال الانترنت الخاص بك",
    "DEFAULT": "حدث خطأ ما ، حاول مرة أخرى لاحقًا"
  
  };

  static const Map<String, dynamic> en_US = {
    "noRouteFound": "NoRouteFound",
    "SUCCESS": "success",
    "NO_CONTENT": "No content",
    "BAD_REQUEST": "Bad request, Try again later",
    "FORBIDDEN": "Forbidden request, Try again later",
    "UNAUTHORIZED": "User is unauthorised, Try again later",
    "NOT_FOUND": "NotFound request, Try again later",
    "INTERNAL_SERVER_ERROR": "Something went wrong, Try again later",
    "EMPTY_LIST": "Empty List, Try again",
    "CONNECT_TIMEOUT": "Time out error, Try again later",
    "CANCEL": "Request was cancelled, Try again later",
    "RECEIVE_TIMEOUT": "Time out error, Try again later",
    "SEND_TIMEOUT": "Time out error, Try again later",
    "CASHE_ERROR": "Cache error, Try again later",
    "NO_INTERNET_CONNECTION": "Please check your internet connection",
    "DEFAULT": "Something went wrong, Try again later",
    
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar_EGY": ar_EGY,
    "en_US": en_US
  };
}
