import 'package:flutter/material.dart';
import 'package:lotaryapp/core/constants/app_colors.dart';
import 'package:lotaryapp/core/constants/app_string.dart';
import 'package:lotaryapp/presentation/core/widgets/gradient_scaffold.dart';
import 'package:lotaryapp/presentation/provider/lottery_provider.dart';
import 'package:lotaryapp/presentation/screens/entry_screen.dart';
import 'package:lotaryapp/presentation/screens/widgets/result_icon.dart';
import 'package:lotaryapp/presentation/screens/widgets/result_number_card.dart';
import 'package:provider/provider.dart';
class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<LotteryProvider>(context);
    final result=provider.lotteryResult;
    if(result==null){
      return GradientScaffold(
          title: AppStrings.resultTitle,
          body: Text(AppStrings.noResultFound),
          showBackButton: true);
    }
    final isWinner = result.userNumber == result.winningNumber;
    return GradientScaffold(
        title: AppStrings.resultTitle,
        body: Column(
          children: [
            const SizedBox(
              height: 159,
            ),
            ResultIcon(isWinner: isWinner,),
            const SizedBox(
              height: 25,
            ),
            Text(isWinner ? AppStrings.winMessage : AppStrings.loseMessage,style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,color: AppColors.white
            ),),
            const SizedBox(
              height: 30,
            ),
            ResultNumberCard(
                isWinner: isWinner,
                userNumber: result.userNumber,
                winningNumber: result.winningNumber
            ),
            const SizedBox(
              height: 50,
            ),
            
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  onPressed: (){
                    Provider.of<LotteryProvider>(context, listen: false).reset();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>EntryScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Icon(Icons.refresh,color: Colors.black,),
                      Text(AppStrings.tryAgainButton,style: TextStyle(color: Colors.black),),

                    ],
                  )),
            )


          ],
        ),
        showBackButton: true);
  }
}
