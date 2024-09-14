import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Logic%20Business/cubit/categories%20cubit/cubit/categories_cubit.dart';
import 'package:todo_app/Presentaion/Screens/my_tasks_screen.dart';
import 'package:todo_app/Presentaion/Widgets/categories%20widgets/add_category_button.dart';
import 'package:todo_app/Presentaion/Widgets/categories%20widgets/horizental_container.dart';
import 'package:todo_app/Presentaion/Widgets/categories%20widgets/vertical_container.dart';
import 'package:todo_app/Presentaion/Widgets/text_widget.dart';
import 'package:todo_app/Presentaion/Widgets/welcome_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          centerTitle: true,
          title: TextWidget(
            text: 'home',
            fontSize: 18,
            fontWeight: FontWeight.w800,
          )),
      body: Container(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            WelcomeRow(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextWidget(
                text: 'category',
                fontWeight: FontWeight.w700,
                fontSize: 19,
              ),
            ),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesChangedState) {
                  
                  return SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      color: Colors.purple[50],
                      child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.categoriesList.length,
                              itemBuilder: ((context, index) {
                                final categoryy = state.categoriesList[index];
                                return index.isEven?InkWell(
                                  onTap: () {
                                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyTasksScreen(categorymodel: categoryy,)));

                                  },
                                  child: HorizentalContainer(text: categoryy.name))
                               : InkWell(
                                onTap: () {
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyTasksScreen(categorymodel: categoryy,)));

                                },
                                child: VerticalContainer(text: categoryy.name));
                              })),
                    ),
                  );

                     
                }
                return SizedBox();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddButtonCategory(),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}




// Column(
//                     children: [
//                       Row(
//                         children: [
//                           VerticalContainer(
//                             text: state.categoriesList[0].name,
//                           ),
//                           Column(
//                             children: [
//                               HorizentalContainer(
//                                 text: state.categoriesList[1].name,
//                               ),
//                               HorizentalContainer(
//                                 text: state.categoriesList[2].name,
//                                 color: const Color.fromARGB(255, 228, 25, 96),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Visibility(
//                         visible: isVisible,
//                         child: Row(
//                           children: [
//                             VerticalContainer(
//                               text: state.categoriesList[3].name,
//                               color: Colors.cyan,
//                             ),
//                             VerticalContainer(
//                               text: state.categoriesList[4].name,
//                               color: Colors.green,
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
