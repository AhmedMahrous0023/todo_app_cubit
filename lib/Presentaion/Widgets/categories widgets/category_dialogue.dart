import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Data/Models/category_model.dart';
import 'package:todo_app/Logic%20Business/cubit/categories%20cubit/cubit/categories_cubit.dart';
import 'package:todo_app/Presentaion/Widgets/categories%20widgets/category_form_field.dart';
import 'package:todo_app/Presentaion/Widgets/text_widget.dart';

class CategoryDialogue extends StatefulWidget {
  const CategoryDialogue({super.key});

  @override
  State<CategoryDialogue> createState() => _CategoryDialogueState();
}

class _CategoryDialogueState extends State<CategoryDialogue> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _describtionController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextWidget(
              text: 'add_categ',
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: 'name_categ',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 20,
                ),
                CategoryFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your name';
                    }
                    return _nameController.text;
                  },
                  text: 'name_categ',
                ),
                SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: 'des_categ',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 20,
                ),
                CategoryFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter the describtion';
                    }
                    return _describtionController.text;
                  },
                  controller: _describtionController,
                  text: 'des_categ',
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: TextWidget(
                          text: 'cancel',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                    TextButton(
                        onPressed: () {
                          context.read<CategoriesCubit>().addCategory(
                              CategoryModel(
                                  name: _nameController.text,
                                  description: _describtionController.text));
                        },
                        child: TextWidget(
                          text: 'save',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
