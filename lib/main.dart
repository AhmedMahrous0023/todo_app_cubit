import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Helper/app_localization.dart';
import 'package:todo_app/Logic%20Business/cubit/categories%20cubit/cubit/categories_cubit.dart';
import 'package:todo_app/Presentaion/Screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>CategoriesCubit())

    ], child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      locale: Locale('en'),
      supportedLocales: [
        Locale('en'),
        Locale('ar')
      ],
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales){
          if (deviceLocale!=null){
            return deviceLocale ;
          }
          return supportedLocales.last;
        }
        return null ;
        
      },

    ));
  }
}