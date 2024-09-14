
import 'package:flutter/material.dart';
import 'package:todo_app/Presentaion/Screens/settings_screen.dart';
import 'package:todo_app/Presentaion/Widgets/text_widget.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
            backgroundColor: Colors.grey[200],
            width: MediaQuery.of(context).size.width*.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                    },
                    child: Card(
                      margin: EdgeInsets.all(20),
                      color: Colors.amber[50],
                      
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextWidget(text: 'settings'),
                      )),
                  ),
                )
              ],
            ),
          );
  }
}