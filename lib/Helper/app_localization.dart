
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale? locale ;
  AppLocalization({this.locale});

  static AppLocalization? of (BuildContext context){
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static const LocalizationsDelegate<AppLocalization> delegate =_AppLocalizationDelegate();
  
  late Map<String,String> _localizedStrings ;

  Future<void>loadJsonLanguages ()async{
    String jsonStrings =await rootBundle.loadString('assets/translations/${locale!.languageCode}.json');
    Map<String,dynamic> jsonMap =jsonDecode(jsonStrings);
    _localizedStrings=jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate (String key){
    return _localizedStrings[key]??"" ;
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization>{
  const _AppLocalizationDelegate();
  
  @override
  bool isSupported(Locale locale) {
return ['en','ar'].contains(locale.languageCode);
  }
  
  @override
  Future<AppLocalization> load(Locale locale)async {
   AppLocalization appLocalization =AppLocalization(locale: locale);
   await appLocalization.loadJsonLanguages();
   return appLocalization ;
  }
  
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
   return false ;
  }
  
}