import 'package:flutter/material.dart';
import 'package:lotaryapp/core/constants/app_colors.dart';
import 'package:lotaryapp/core/constants/app_string.dart';
import 'package:lotaryapp/presentation/core/widgets/gradient_scaffold.dart';
import 'package:lotaryapp/presentation/screens/entry_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GradientScaffold(
      title: AppStrings.homeTitle,
      showBackButton: true,
      body: Column(
        children: [
          const SizedBox(height: 150,),

        Container(


        height: 110,
        width: 110,
        decoration: BoxDecoration(
          shape: .circle,
          color: AppColors.accentTeal,


        ),
        child: Icon(Icons.casino,size: 70,color: AppColors.white),
      ),
          const SizedBox(height: 35,),
          Container(
            height: 290,
            width: 323,
            padding: .all(20),
            decoration: BoxDecoration(
                color: AppColors.whiteOpacity30,
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: .topLeft,
                    end: .bottomRight,
                    colors: AppColors.glassGradient
                ),
                border: Border.all(
                    color: AppColors.whiteOpacity50,
                    width: 2

                ),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.whiteOpacity10,
                      blurRadius: 10,
                      offset: const Offset(0,5)
                  )
                ]
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(AppStrings.appTitle,style: TextStyle(
                    fontSize: 51,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
              
              
                  ),),
                  const SizedBox(height: 5,),
                  Text(AppStrings.homeTagline,style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteOpacity90,
                  ),),
                  const SizedBox(height: 30,),
                  Text(AppStrings.homeEmoji,style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,

                  ),),
                  const SizedBox(height: 12,),

                ],
              ),
            ),
          ),
          const SizedBox(height: 50,),
          SizedBox(
            height: 55,
            width: 350,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentCyan,
                  foregroundColor:  AppColors.buttonForeground,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                onPressed:()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EntryScreen()));
                }
                , child: Row(
              mainAxisAlignment: .center,
              children: [
                Icon(Icons.play_arrow,size: 30,color:AppColors.buttonForeground),
                Text(AppStrings.playLotteryAction,style: TextStyle(fontWeight: FontWeight.bold,color:  AppColors.buttonForeground),)
              ],
            )),
          ),

        ],
      ),

    );
  }
}
