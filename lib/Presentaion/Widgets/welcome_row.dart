import 'package:flutter/material.dart';
import 'package:todo_app/Helper/app_localization.dart';
import 'package:todo_app/Presentaion/Widgets/text_widget.dart';

class WelcomeRow extends StatelessWidget {
  const WelcomeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: Colors.purple[50],
        margin: EdgeInsets.all(15),
        shadowColor: Colors.amber,
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextWidget(
                text: 'name',
                fontWeight: FontWeight.w600,
                color: Colors.pink,
              ),
              CircleAvatar(
                
                    child: Image.asset('assets/images/placeholder-male.jpg')),
              
            ],
          ),
        ),
      ),
    );
  }
}
