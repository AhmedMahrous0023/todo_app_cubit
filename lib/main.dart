import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Helper/app_localization.dart';
import 'package:todo_app/Logic%20Business/cubit/categories%20cubit/categories_cubit.dart';
import 'package:todo_app/Logic%20Business/cubit/translation%20cubit/cubit/translation_cubit.dart';
import 'package:todo_app/Presentaion/Screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CategoriesCubit()),
          BlocProvider(
              create: (context) => TranslationCubit()..getSavedLanguage())
        ],
        child: BlocBuilder<TranslationCubit, TranslationState>(
            builder: ((context, state) {
          if (state is ChangedLanguageState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
              locale: state.locale,
              supportedLocales: [Locale('en'), Locale('ar')],
              localizationsDelegates: [
                AppLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null) {
                    return deviceLocale;
                  }
                  return supportedLocales.last;
                }
                return null;
              },
            );
          }
          return SizedBox();
        })));
  }
}
