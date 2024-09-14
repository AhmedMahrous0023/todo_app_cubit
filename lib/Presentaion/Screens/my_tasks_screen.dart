import 'package:flutter/material.dart';
import 'package:todo_app/Data/Models/category_model.dart';
import 'package:todo_app/Presentaion/Widgets/text_widget.dart';

class MyTasksScreen extends StatefulWidget {
  final CategoryModel categorymodel ;
  const MyTasksScreen({super.key, required this.categorymodel});

  @override
  State<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  backgroundColor: Colors.grey[200],
      appBar: AppBar(
         backgroundColor: Colors.grey[200],
        elevation: 0,
        centerTitle: true,
        title: TextWidget(text:widget.categorymodel.name,fontSize: 18,
          fontWeight: FontWeight.w800,),
      ),
    );
  }
}