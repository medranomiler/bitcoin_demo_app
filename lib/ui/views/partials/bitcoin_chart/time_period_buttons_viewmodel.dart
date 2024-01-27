import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TimePeriodButtonsViewModel extends BaseViewModel {

  List<Widget> generateButtons(List<dynamic> data, int currentIndex, Function(int) onButtonPressed) {
    List<Widget> buttons = [];

    for (int i = 0; i < data.length; i++) {
      buttons.add(
        MaterialButton(
          onPressed: () {
            onButtonPressed(i);
          },
          color: Colors.black,
          child: Text(data[i]['name'], style: buttonStyle(currentIndex, i)),
        ),
      );
    }

    return buttons;
  }

     TextStyle buttonStyle(int currentIndex, int index) {
    return TextStyle(
      color: currentIndex == index ? Colors.blue : Colors.white,
    );
  }
}
