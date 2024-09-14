import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/Helper/language_cash_helper.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial());

  Future<void> getSavedLanguage() async {
    final String cashedLanguageCode =
        await LanguageCashHelper().getCahedLanguageCode();
    emit(ChangedLanguageState(locale: Locale(cashedLanguageCode)));
  }

  Future<void> changeLanguageCode(String languageCode) async {
    await LanguageCashHelper().cashLanguageCode(languageCode);
    emit(ChangedLanguageState(locale: Locale(languageCode)));
  }
}
