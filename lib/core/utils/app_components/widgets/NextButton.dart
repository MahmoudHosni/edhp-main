import 'package:edhp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  late double width;
  late Color backgroundColor;
  late double redius;
  final Function() function;
  final String text;
  late double height;
  late double fontSize;
  late Color textColor;

  NextButton({
    Key? key,
    this.width = double.infinity,
    this.backgroundColor = AppColors.primaryBlueColor,
    this.redius = 25.0,
    required this.function,
    required this.text,
    this.textColor = AppColors.whiteColor,
    this.height = 45,
    this.fontSize = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(redius),gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              AppColors.secondNew,
              AppColors.primaryNew
            ],
          ),
      ),
      width: width,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        Icon(Icons.arrow_back_ios,color: Colors.white,size: 16,),
        MaterialButton(
          onPressed: function,minWidth: 50,
          child: Text(
            text.toUpperCase(),
            style: TextStyle(color: textColor, fontSize: fontSize , fontFamily: 'Tajawal'),
          ),
        ),
      ],)
    );
  }
}