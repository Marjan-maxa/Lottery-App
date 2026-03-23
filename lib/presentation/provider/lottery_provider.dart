//23:04

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotaryapp/core/constants/app_string.dart';
import 'package:lotaryapp/domain/entities/lottery_results.dart';

class LotteryProvider extends ChangeNotifier {
  final Random _random = Random();
  int? _selectedNumber;
  LotteryResult? _lotteryResult;
  String? _errorMassege;

  int? get selectedNumber=>_selectedNumber;
  LotteryResult ? get lotteryResult=>_lotteryResult;
  String? get errorMessage=>_errorMassege;

  bool get canplay=>_selectedNumber!=null;

  bool isValidNumber(int number){
    return number>1 && number<=10;
  }
  void setSelectedNumber(int number){
    if(isValidNumber(number)){
      _selectedNumber=number;
      _errorMassege=null;
      notifyListeners();
    }
  }
  void playLottery(){
    _errorMassege=null;
    if(_selectedNumber==null){
      _errorMassege=AppStrings.selectNumberError;
      notifyListeners();
      return;
    }
    if(!isValidNumber(_selectedNumber!)){
      _errorMassege=AppStrings.numberRangeError;
      notifyListeners();
      return;
    }
    final int winningNumber=_random.nextInt(10)+1;
    final bool iswinner=_selectedNumber==winningNumber;
    _lotteryResult=LotteryResult(
        userNumber: _selectedNumber!,
        winningNumber: winningNumber,
        isWinner: iswinner
    );
    notifyListeners();

  }
   void reset(){
     _selectedNumber=null;
     _lotteryResult=null;
     _errorMassege=null;
     notifyListeners();
   }

}