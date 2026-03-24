import 'package:flutter/material.dart';
import 'package:lotaryapp/presentation/provider/lottery_provider.dart';
import 'package:lotaryapp/presentation/screens/entry_screen.dart';
import 'package:lotaryapp/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>LotteryProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        home: HomeScreen(),
      ),
    );
  }
}
