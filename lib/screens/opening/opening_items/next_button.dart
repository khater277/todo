import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/home/home_screen.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Text("Let's see what is waiting us",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.white, fontSize: 18),

              ),
              const Spacer(),
              ElevatedButton(
                onPressed:(){
                  Get.to(()=>const HomeScreen(),curve: Curves.fastOutSlowIn);
                },
                child:const Icon(
                  IconBroken.Arrow___Right_2,
                  color: pink,
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary:Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius:BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                    ),
                    minimumSize: const Size(70,50)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
