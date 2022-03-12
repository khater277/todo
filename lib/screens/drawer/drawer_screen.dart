import 'package:flutter/material.dart';
import 'package:todo/styles/icons_broken.dart';

// ignore: must_be_immutable
class DrawerItem extends StatelessWidget {
  final String text;
  bool? isSub;
  IconData? icon;

  DrawerItem({Key? key, required this.text, this.isSub ,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isSub!=true?20:14),
      child: SizedBox(
        width: MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width * 0.45),
        child: Row(
          children: [
            if(icon!=null)
            Row(
              children: [
                Icon(icon!,
                size: 22,
                color: Colors.white,),
                const SizedBox(width: 5,),
              ],
            ),
            Flexible(
              child: Text(text,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: isSub!=true?20:14,
                    color: Colors.white,
                    letterSpacing: 0.5
                ),),
            ),
          ],
        ),
      ),
    );
  }
}


class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade500,
      body: Padding(
        padding: const EdgeInsets.only(top: 120,left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TODO',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Colors.white,
                fontSize: 30,
                letterSpacing: 2
              ),
            ),
            const SizedBox(height: 30,),
            DrawerItem(text: "Dashboard",icon: IconBroken.Category,),
            DrawerItem(text: "Calender",icon: IconBroken.Calendar,),
            DrawerItem(text: "Categorize Tasks",icon: IconBroken.Document,),
            DrawerItem(text: "Setting",icon: IconBroken.Setting,),
            const SizedBox(height: 30,),
            DrawerItem(text: "About",isSub: true,),
            DrawerItem(text: "Privacy Policy",isSub: true,),
            DrawerItem(text: "License",isSub: true,),
          ],
        ),
      ),
    );
  }
}
