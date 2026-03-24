import 'package:flutter/material.dart';
import 'package:lotaryapp/core/constants/app_colors.dart';

class ResultNumberCard extends StatefulWidget {
  const ResultNumberCard({super.key, required this.isWinner, required this.userNumber, required this.winningNumber});
  final bool isWinner;
  final int userNumber;
  final int winningNumber;

  @override
  State<ResultNumberCard> createState() => _ResultNumberCardState();
}

class _ResultNumberCardState extends State<ResultNumberCard> {
  @override
  Widget build(BuildContext context) {
    return Container(

        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.15),
        ),
        child: Column(
          children: [
          Row(
            mainAxisAlignment: .center,
            children: [
              Icon(Icons.person,color: widget.isWinner? AppColors.accentCyan:AppColors.white,),
              const Text(
              "Your Number",
              style: TextStyle(color: Colors.white70,fontWeight: .bold),
                 ),
            ],
          ),
        const SizedBox(height: 10),

        /// USER NUMBER
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.accentTeal,
          child: Text(
            "${widget.userNumber}",
            style: const TextStyle(
              fontWeight: .bold,
                fontSize: 22, color: Colors.white),
          ),
        ),

        const SizedBox(height: 20),

        Row(
          children: const [
            Expanded(child: Divider(color: Colors.white54)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("VS",
                  style: TextStyle(color: Colors.white70)),
            ),
            Expanded(child: Divider(color: Colors.white54)),
          ],
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: .center,
          children: [
            Icon(Icons.star,color: widget.isWinner? AppColors.accentCyan:AppColors.white,),
            const Text(

              "Winning Number",
              style: TextStyle(color: Colors.white70,fontWeight: .bold),
            ),
          ],
        ),
        const SizedBox(height: 10),

        /// WINNING NUMBER
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blueAccent,
          child: Text(
            "${widget.winningNumber}",
            style: TextStyle(
              fontWeight: .bold ,
                fontSize: 22, color: AppColors.white),
          ),
        )
        ]

    )
    );

  }
}
