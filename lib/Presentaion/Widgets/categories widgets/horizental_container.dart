import 'package:flutter/material.dart';
import 'package:todo_app/Presentaion/Widgets/text_widget.dart';
import 'package:todo_app/Presentaion/Widgets/top_left_cut_clipper.dart';

class HorizentalContainer extends StatelessWidget {
  final double height ,width ;
  final Color color ;
  final String text ;
  const HorizentalContainer({super.key,  this.height=120,  this.width=170,  this.color=const Color.fromARGB(207, 2, 200, 240), required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
                               padding: const EdgeInsets.all(15.0),
                               child: ClipPath(
                    clipper: TopLeftCutClipper(),
                    child: Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                                          color: color,
                   borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                                                TextWidget(text: text,color: Colors.black,fontWeight: FontWeight.w700,),

                        ],
                      ),
                    ),
                                 ),
                             );
  }
}