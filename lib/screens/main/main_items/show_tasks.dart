import 'package:flutter/material.dart';
import 'package:todo/shared/constants.dart';


class TaskText extends StatelessWidget {
  final String text;
  final bool isDone;
  const TaskText({Key? key, required this.text, required this.isDone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("2:00 AM",
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey,
              letterSpacing: 0.5,
              fontFamily: "Avenir-Medium",
              decoration: isDone?TextDecoration.lineThrough:TextDecoration.none,
              decorationColor: pink,
            )),
        const SizedBox(height: 2,),
        Text(text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              decoration: isDone?TextDecoration.lineThrough:TextDecoration.none,
              decorationColor: pink,
              fontSize: 20,
              color: Colors.black87,
              letterSpacing: 0.5
          ),),
      ],
    );
  }
}


class ShowTasks extends StatelessWidget {
  const ShowTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.grey.withOpacity(0.08),
        child: Padding(
          padding: const EdgeInsets.only(right: 10,left: 10,bottom: 20),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
              itemBuilder:(context,index)=> Column(
                children: [
                  if(index==0)
                    const SizedBox(height: 10,),
                  TaskText(
                      text: "Book appointment with doctor ragab",
                      isDone: index==0?true:false),
                  if(index==9)
                    const SizedBox(height: 60,)
                ],
              ),
              separatorBuilder:(context,index)=> const SizedBox(height: 30,),
              itemCount: 10
          ),
        ),
      ),
    );
  }
}
