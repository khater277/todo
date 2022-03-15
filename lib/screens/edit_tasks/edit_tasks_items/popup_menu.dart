import 'package:flutter/material.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Map<String,dynamic>> items = [
      {
        "name":"Complete",
        "icon":IconBroken.Shield_Done,
      },
      {
        "name":"Pin",
        "icon":IconBroken.Bookmark,
      },
      {
        "name":"Delete",
        "icon":IconBroken.Delete,
      }
    ];

    return PopupMenuButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).scaffoldBackgroundColor,
            )
        ),
        color: (const Color(0xff010108)),
        elevation: 0,
        enabled: true,
        onSelected: (value) {
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
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 16
                    )
                    ,)),
                  //const SizedBox(width: 2,),
                  Icon(choice['icon'],color: Colors.white,)
                ],
              ),
            );
          }).toList();
        }
    );
  }
}