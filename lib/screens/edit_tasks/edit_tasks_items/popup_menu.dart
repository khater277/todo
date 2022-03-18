import 'package:flutter/material.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';

class PopupMenu extends StatelessWidget {
  final TodoCubit cubit;
  final TaskModel task;
  final int index;
  const PopupMenu({Key? key, required this.task, required this.index, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Map<String,dynamic>> items = [
      {
        "name":"Complete",
        "icon":IconBroken.Shield_Done,
        "color":Colors.green,
      },
      {
        "name":"Pend",
        "icon":IconBroken.Bookmark,
        "color":Colors.pink,
      },
      {
        "name":"Delete",
        "icon":IconBroken.Delete,
        "color":Colors.red,
      }
    ];

    return PopupMenuButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).scaffoldBackgroundColor,
            )
        ),
        //color: !cubit.isDarkMode?const Color(0xff010108):Colors.white,
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2,
        enabled: true,
        onSelected: (Map<String,dynamic>value) {
          if(value['name'] == "Delete") {
            cubit.deleteTask(index: index, task: task);
          }else if(value['name'] == "Complete"){
            cubit.addToCompleted(index: index, task: task);
          }else{
            cubit.addToPend(index: index, task: task);
          }
          print(value);
          //cubit.deletePost(index: index);
        },
        itemBuilder:(context) {
          return items.map((Map<String,dynamic> choice) {
            return PopupMenuItem(
              value: choice,
              child: Row(
                children: [
                  Expanded(child: Text(choice['name'],
                    style:Theme.of(context).textTheme.bodyText1!.copyWith(
                      //color:!cubit.isDarkMode?Colors.white:Colors.black87,
                      fontSize: 16
                    )
                    ,)),
                  //const SizedBox(width: 2,),
                  Icon(choice['icon'],color: choice['color'],)
                ],
              ),
            );
          }).toList();
        }
    );
  }
}