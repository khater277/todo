import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
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
          padding: EdgeInsets.only(
              left: languageFun(ar: 0.0, en: 4.w),
              right: languageFun(ar: 4.w, en: 0.0)),
          child: Row(
            children: [
              Expanded(
                child: Text("opening".tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.white, fontSize: 15.sp),

                ),
              ),
              ElevatedButton(
                onPressed:(){
                  Get.to(()=>const HomeScreen(),curve: Curves.fastOutSlowIn);
                },
                child: Icon(
                  languageFun(
                      ar: IconBroken.Arrow___Left_2,
                      en: IconBroken.Arrow___Right_2
                  ),
                  color: pink,
                  size: 25.sp,
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary:Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.only(
                        bottomLeft: Radius.circular(languageFun(ar: 0.0, en: 5.sp)),
                        topLeft: Radius.circular(languageFun(ar: 0.0, en: 5.sp)),
                        topRight: Radius.circular(languageFun(ar: 5.sp, en: 0.0)),
                        bottomRight: Radius.circular(languageFun(ar: 5.sp, en: 0.0)),
                      ),
                    ),
                    minimumSize: Size(19.5.w,7.h)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
