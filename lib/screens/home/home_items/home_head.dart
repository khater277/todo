import 'package:flutter/material.dart';
import 'package:todo/styles/icons_broken.dart';

class HomeHead extends StatelessWidget {
  const HomeHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){},
            child: const ImageIcon(
              AssetImage("assets/images/menu.png"),
              size: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                Text("Tasks",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 45),

                ),
                const Spacer(),
                IconButton(
                    onPressed: (){},
                    icon: const Icon(
                      IconBroken.Notification,
                      size: 25,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
