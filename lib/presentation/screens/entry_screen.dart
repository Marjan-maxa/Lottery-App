import 'package:flutter/material.dart';
import 'package:lotaryapp/core/constants/app_colors.dart';
import 'package:lotaryapp/core/constants/app_string.dart';
import 'package:lotaryapp/presentation/core/widgets/gradient_scaffold.dart';
import 'package:lotaryapp/presentation/provider/lottery_provider.dart';
import 'package:lotaryapp/presentation/screens/result_screen.dart';
import 'package:lotaryapp/presentation/screens/widgets/numberTile.dart';
import 'package:provider/provider.dart';
class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
 int? _selectedNumber;
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<LotteryProvider>(context);
    return GradientScaffold(
        title: AppStrings.entryTitle,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
             const SizedBox(width: .infinity,height: 150,),
              Icon(Icons.casino,size: 100,color: AppColors.accentCyan,),
              const SizedBox(width: .infinity,height: 12,),
              Text(AppStrings.entryHeading,style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColors.white,

              )),
              const SizedBox(width: .infinity,height: 7,),
              Text(AppStrings.entrySubheading,style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.white,

              )),

              const SizedBox(width: .infinity,height: 40,),
              Container(
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
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,


                    ),
                    itemCount: 10,
                    itemBuilder: (context,index){
                      final number=index+1;
                      return Numbertile(number: number, isSelected: _selectedNumber==number, onTap:(){
                        setState(() {
                          _selectedNumber=number;
                        }
                        );
                        provider.setSelectedNumber(number);
                      });
                    }),
              ),
              
                const SizedBox(height: 35,),
              SizedBox(
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedNumber != null? AppColors.accentCyan : AppColors.disabledGreyLight,
                    foregroundColor: _selectedNumber != null? AppColors.buttonForeground : AppColors.buttonForeground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                    onPressed:_selectedNumber==null?null:()
                {
                    provider.playLottery();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen()));
                }
                    , child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Icon(Icons.play_arrow,size: 30,color:_selectedNumber != null? AppColors.buttonForeground:AppColors.white,),
                        Text(AppStrings.playLotteryAction,style: TextStyle(fontWeight: FontWeight.bold,color: _selectedNumber != null? AppColors.buttonForeground:AppColors.white),)
                      ],
                    )),
              )
            ]
          ),
        ),
        showBackButton: false,

    );
  }
}
