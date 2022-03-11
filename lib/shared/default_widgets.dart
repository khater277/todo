import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:progress_indicators/progress_indicators.dart';


class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.startsWith(' ')) {
      final String trimedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimedText,
        selection: TextSelection(
          baseOffset: trimedText.length,
          extentOffset: trimedText.length,
        ),
      );
    }
    return newValue;
  }
}

class DefaultProgressIndicator extends StatelessWidget {
  final IconData icon;
  const DefaultProgressIndicator({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlowingProgressIndicator(
            child: Icon(icon,size: 35,color: Colors.grey,),
          ),
          const SizedBox(height: 6,),
        ],
      ),
    );
  }
}

class DefaultLinerIndicator extends StatelessWidget {
  const DefaultLinerIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5,),
        LinearProgressIndicator(
          color: Colors.blue.withOpacity(0.3),
          backgroundColor: Colors.white,
        ),
        const SizedBox(height: 5,),
      ],
    );
  }
}

class DefaultButtonLoader extends StatelessWidget {
  final double size;
  final double width;
  final Color color;
  const DefaultButtonLoader({Key? key, required this.size,
    required this.width, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size, height: size,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: width,
      ),
    );
  }
}

class DefaultElevatedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double rounded;
  final double height;
  final double width;
  final onPressed;
  const DefaultElevatedButton({Key? key, required this.child, required this.color, required this.rounded,
    required this.height, required this.width, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      child:child,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          primary:color,
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(rounded),
          ),
          minimumSize: Size(width,height)
      ),
    );
  }
}

//ignore: must_be_immutable
class DefaultOutLinedButton extends StatelessWidget {
  final Widget child;
  final double rounded;
  final double height;
  final double width;
  final onPressed;
  Color? borderColor;
  DefaultOutLinedButton({Key? key, required this.child, required this.rounded,
    required this.height, required this.width, required this.onPressed,this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed:onPressed,
      child:child,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(rounded),
        ),
        minimumSize: Size(width,height),
        side: BorderSide(color: borderColor??const Color(0xFF000000)),
      ),
    );
  }
}

class NoItemsFounded extends StatelessWidget {
  final String text;
  final Widget widget;
  const NoItemsFounded({Key? key, required this.text, required this.widget,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget,
            const SizedBox(height: 15,),
            Text(text,style: TextStyle(
                color: Colors.grey[400],
                fontSize: 20,
                fontWeight: FontWeight.normal
            ),)
          ],
        ),
      ),
    );
  }
}

class DefaultSeparator extends StatelessWidget {
  const DefaultSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}



//ignore: must_be_immutable
class DefaultTextFormFiled extends StatelessWidget{
  final TextEditingController? controller;
  final Color? textColor;
  final TextInputType? inputType;
  final IconData? prefixIcon;
  final String? label;
  final Color? borderColor;
  final Color? preIconColor;
  final String? validateText;
  double? height;
  double? cursorHeight;
  Color? suffixIconColor;
  bool? isPassword;
  // Function? onSubmit(value)?;
  // Function? onChanged(value)?;
  Function? suffixPressed;
  IconData? suffixIcon;

  DefaultTextFormFiled({Key? key,
    required this.controller,
    required this.textColor,
    required this.inputType,
    required this.prefixIcon,
    required this.label,
    required this.borderColor,
    required this.preIconColor,
    this.validateText, this.cursorHeight,
    this.height,this.isPassword,
    this.suffixIcon,this.suffixIconColor,this.suffixPressed}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: textColor,
      validator: (value) {
        if (value!.isEmpty) {
          return "$validateText can't be empty";
        }
        return null;
      },
      style: TextStyle(
        color: textColor,
      ),
      cursorHeight: cursorHeight,
      keyboardType: inputType,
      obscureText: isPassword==null?false:isPassword!,
      //onFieldSubmitted: (value) => onSubmit!(value),
      //onChanged: (value)=>onChanged!(value),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: height==null?18:height!),
        prefixIcon: Icon(
          prefixIcon,
          color: preIconColor,
        ),
        //hintText: "ASD",
        suffixIcon:suffixIcon!=null? IconButton(
          onPressed: () => suffixPressed!(),
          icon: Icon(suffixIcon),
          color: suffixIconColor,
          //focusColor: suffixIconColor,
        ):null,
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: borderColor!,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: borderColor!,
            )),
        labelText: label,
        labelStyle: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class DefaultTextFiled extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final double hintSize;
  final double height;
  final double rounded;
  final Widget suffix;
  final Color focusBorder;
  final Color border;
  bool? validate;
  bool? obscure;
  var onSubmitted;
  var onChanged;

  DefaultTextFiled({Key? key, required this.controller, required this.hint,
    required this.hintSize, required this.height, required this.suffix,
    required this.focusBorder, required this.border,this.validate,
    this.onChanged,this.onSubmitted, required this.rounded,this.obscure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [NoLeadingSpaceFormatter()],
      cursorColor: focusBorder,
      controller: controller,
      onSubmitted: onSubmitted??(value){},
      onChanged: onChanged??(value){},
      obscureText: obscure??false,
      decoration:  InputDecoration(
        errorText: validate==true?null:"$hint ${"notEmpty".tr}",
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: hintSize,
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: height,
            horizontal: 15),
        suffixIcon: suffix,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(rounded),
            borderSide: BorderSide(
              color: border,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: focusBorder,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(rounded),
            borderSide: BorderSide(
              color: border,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: focusBorder,
            )),
      ),
    );
  }
}

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade300,
    );
  }
}