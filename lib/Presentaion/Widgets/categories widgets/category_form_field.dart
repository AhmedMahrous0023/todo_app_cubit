import 'package:flutter/material.dart';
import 'package:todo_app/Helper/app_localization.dart';

class CategoryFormField extends StatelessWidget {
  final String text;
  final TextEditingController controller ;
  final String? Function(String?)? validator ;
  const CategoryFormField({super.key, required this.text, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ,
      controller: controller,
      decoration: InputDecoration(
        hintText: AppLocalization.of(context)!.translate(text),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))

        )
      ),
    );
  }
}