import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Logic%20Business/cubit/translation%20cubit/cubit/translation_cubit.dart';
import 'package:todo_app/Presentaion/Widgets/text_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
         backgroundColor: Colors.grey[200],
          elevation: 0,
        title: TextWidget(text: 'settings', fontSize: 18,
            fontWeight: FontWeight.w800,),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Card(
                color: Colors.indigo[100],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextWidget(text: 'lang_choose'),
                ),),
              
                  Card(
                     color: Colors.amber[100],
                    child: BlocConsumer<TranslationCubit, TranslationState>(
                        builder: (context, state) {
                      if (state is ChangedLanguageState) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                              value: state.locale.languageCode,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: ['ar', 'en'].map((String items) {
                                return DropdownMenuItem(child: Text(items), value: items);
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  context
                                      .read<TranslationCubit>()
                                      .changeLanguageCode(newValue);
                                }
                              }),
                        );
                      }
                      ;
                      return SizedBox();
                    }, listener: (context, state) {
                      if (state is ChangedLanguageState) {
                        Navigator.of(context).pop();
                      }
                    }),
                  ),
                 
               
            ],
          ),
        ),
      ),
    );
  }
}
