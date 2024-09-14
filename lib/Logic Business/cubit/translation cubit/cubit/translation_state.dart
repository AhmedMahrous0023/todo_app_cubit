part of 'translation_cubit.dart';

@immutable
sealed class TranslationState {}

final class TranslationInitial extends TranslationState {}

final class ChangedLanguageState extends TranslationState {
  final Locale locale;

  ChangedLanguageState({required this.locale});
}
