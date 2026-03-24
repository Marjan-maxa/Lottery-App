import 'package:flutter/material.dart';
import 'package:lotaryapp/core/constants/app_colors.dart';

class Numbertile extends StatelessWidget {
  const Numbertile({
    super.key, required this.number,
    required this.isSelected,
    required this.onTap
  });
 final int number;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: .all(
            width: 1.5,
            color: isSelected? AppColors.accentCyanLight:AppColors.whiteOpacity50
          ),
          boxShadow: isSelected? [
            BoxShadow(
              color: AppColors.cyanShadow,
              blurRadius: 10,
              offset: const Offset(0,5)
            )
          ]:[],

          borderRadius: .circular(15),
          gradient: isSelected?LinearGradient(colors: AppColors.accentGradient):LinearGradient(colors: AppColors.tileGradient)
        ),
        child: Center(
          child: Text('$number',style:  TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold ,
            color: isSelected? AppColors.white:AppColors.whiteOpacity90,

          )),
        ),
      ),
    );
  }
}
 // 52:59 start again