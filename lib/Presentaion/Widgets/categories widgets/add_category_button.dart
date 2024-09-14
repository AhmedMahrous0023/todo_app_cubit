import 'package:flutter/material.dart';
import 'package:todo_app/Presentaion/Screens/all_categories_screen.dart';
import 'package:todo_app/Presentaion/Widgets/text_widget.dart';

class AddButtonCategory extends StatelessWidget {
  const AddButtonCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategoriesScreen()));
      },
      child: Card(
        elevation: 3,
        shadowColor: Colors.green,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: TextWidget(
              text: 'show_all_categ',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
