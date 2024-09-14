import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Presentaion/Screens/my_tasks_screen.dart';
import 'package:todo_app/Presentaion/Widgets/categories%20widgets/category_dialogue.dart';
import 'package:todo_app/Presentaion/Widgets/categories%20widgets/horizental_container.dart';
import 'package:todo_app/Presentaion/Widgets/categories%20widgets/vertical_container.dart';
import 'package:todo_app/Presentaion/Widgets/text_widget.dart';

import '../../Logic Business/cubit/categories cubit/categories_cubit.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        centerTitle: true,
        title: TextWidget(
          text: 'all_categ_screen',
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: Container(
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesChangedState) {
              return Card(
                  color: Colors.purple[50],
                  child: GridView.builder(
                      itemCount: state.categoriesList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: ((context, index) {
                        final categoryy = state.categoriesList[index];
                        return index.isEven
                            ? InkWell(
                              onTap: () {
                                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyTasksScreen(categorymodel: categoryy,)));

                              },
                              child: HorizentalContainer(text: categoryy.name))
                            : InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyTasksScreen(categorymodel: categoryy,)));
                              },
                              child: VerticalContainer(text: categoryy.name));
                      })));
            }
            return SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * .52,
                    width: MediaQuery.sizeOf(context).width * .8,
                    child:CategoryDialogue()
                  ),
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }
}
