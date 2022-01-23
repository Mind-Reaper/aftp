import 'dart:async';

import 'package:aftp/pages/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateProvider with ChangeNotifier{
  //state_provider to control states needed to accessed outside stateful widget


  PageController pageController = PageController();
  int pageIndex = 0;
  String name = '';
 int theme = 0;
  TimeOfDay nextWatch = TimeOfDay.now().replacing(minute: 30);
  late TimeOfDay currentWatch =  TimeOfDay.now() ;
  bool timerRunning = false;



  startTimer() {
    if(!timerRunning) {
      timerRunning = true;
      currentWatch = nextWatch.plusMinutes(240);
      notifyListeners();
      Timer.periodic(Duration(minutes: 1), (timer) {
        nextWatch = nextWatch.plusMinutes(1);

        notifyListeners();
        if (nextWatch.hour == currentWatch.hour) {
          currentWatch = nextWatch.plusMinutes(240).replacing(minute: 30);
          notifyListeners();
        }
      });
    }
  }


 changeTheme(int index) {
   theme = index;
   notifyListeners();
 }

  changeName (String name) {
    this.name = name;
    notifyListeners();
  }

  changePage(int index) {
    pageController.jumpToPage(index);
    pageIndex = index;
    notifyListeners();
  }
}


extension TimeOfDayExtension on TimeOfDay {
  // Ported from org.threeten.bp;
  TimeOfDay plusMinutes(int minutes) {
    if (minutes == 0) {
      return this;
    } else {
      int mofd = this.hour * 60 + this.minute;
      int newMofd = ((minutes % 1440) + mofd + 1440) % 1440;
      if (mofd == newMofd) {
        return this;
      } else {
        int newHour = newMofd ~/ 60;
        int newMinute = newMofd % 60;
        return TimeOfDay(hour: newHour, minute: newMinute);
      }
    }
  }
}
