import 'package:flutter/material.dart';
import 'package:lotaryapp/core/constants/app_colors.dart';
import 'package:lotaryapp/core/constants/app_string.dart';
import 'package:lotaryapp/presentation/core/widgets/gradient_scaffold.dart';
import 'package:lotaryapp/presentation/provider/lottery_provider.dart';
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
        body: Column(
          children: [
           const SizedBox(width: .infinity,height: 150,),
            Icon(Icons.casino,size: 100,),
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

            const SizedBox(width: .infinity,height: 12,),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteOpacity30,
                borderRadius: BorderRadius.circular(10),
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
                      });
                      provider.setSelectedNumber(number);
                    });
                  }),
            ),

          ]
        ),
        showBackButton: false,

    );
  }
}
