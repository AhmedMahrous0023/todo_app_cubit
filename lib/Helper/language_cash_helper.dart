
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCashHelper{

  Future<void>cashLanguageCode(String languageCode)async{
    final SharedPreferences prefix =await SharedPreferences.getInstance();
    prefix.setString('LOCALE', languageCode);
  }

  Future<String>getCahedLanguageCode()async{
    final SharedPreferences prefix=await SharedPreferences.getInstance();
    final cashedLanguageCode =prefix.getString('LOCALE');
    if(cashedLanguageCode!=null){
      return cashedLanguageCode;
    }
    return 'en';
  }
}