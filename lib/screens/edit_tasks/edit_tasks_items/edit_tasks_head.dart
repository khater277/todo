import 'package:flutter/material.dart';


class EditTasksHead extends StatelessWidget {
  const EditTasksHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60,left: 20,right: 10,bottom: 50),
      child: Text("Edit Tasks",
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(fontSize: 35),

      ),
    );
  }
}
