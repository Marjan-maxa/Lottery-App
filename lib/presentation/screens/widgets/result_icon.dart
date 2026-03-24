import 'package:flutter/material.dart';
import 'package:lotaryapp/core/constants/app_colors.dart';

class ResultIcon extends StatefulWidget {
  const ResultIcon({super.key, required this.isWinner});
 final bool isWinner;
  @override
  State<ResultIcon> createState() => _ResultIconState();
}

class _ResultIconState extends State<ResultIcon> {
  @override
  Widget build(BuildContext context, ) {
    return Container(

      height: 110,
      width: 110,
      decoration: BoxDecoration(
        shape: .circle,
        color: widget.isWinner? AppColors.winCyan:AppColors.whiteOpacity30,
        

      ),
      child: Center(child: Text(widget.isWinner? '🎉':'🥲',style: TextStyle(fontSize: 40),)),
    );
  }
}
