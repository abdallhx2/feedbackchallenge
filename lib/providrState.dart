import 'package:feedbackchallenge/faces.dart';
import 'package:flutter/material.dart';

class SliderState with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Color getBackgroundColor() {
    if (_selectedIndex == 2) return Color(0xffAEE772);
    if (_selectedIndex == 1) return Color(0xffFDC84C);
    return Color(0xffE56B6F);
  }

  Color getDarkColor() {
    if (_selectedIndex == 2) return Color(0xff4C6D0E);
    if (_selectedIndex == 1) return Color(0xff7B6103);
    return Color(0xff6F0000);
  }

  Color getBigTextColor() {
    if (_selectedIndex == 2) return Color.fromARGB(255, 147, 192, 63);
    if (_selectedIndex == 1) return Color.fromARGB(255, 212, 171, 23);
    return Color(0xffC05255);
  }

  String getFeedbackText() {
    if (selectedIndex == 2) return "GOOD";
    if (selectedIndex == 1) return "NOT BAD";
    return "BAD";
  }


  FaceProperties getFaceProperties() {
    switch (_selectedIndex) {
      case 0:
        return FaceProperties(
          leftEye: EyeProperties(
            width: 60,
            height: 60,
            position: 90,
            topPosition: 40,
          ),
          rightEye: EyeProperties(
            width: 60,
            height: 00,
            position: 90,
            topPosition: 40,
          ),
          mouth: MouthProperties(
            width: 1,
            height: 10,
            curvature: 2,
            expression: 'bad',
            bottomPosition: 125,
            leftPosition: 150,
            rightPosition: 150,
          ),
        );
      case 1:
        return FaceProperties(
          leftEye: EyeProperties(
            width: 103,
            height: 38,
            position: 63,
            topPosition: 40,
          ),
          rightEye: EyeProperties(
            width: 103,
            height: 38,
            position: 63,
            topPosition: 40,
          ),
          mouth: MouthProperties(
            width: 1,
            height: 10,
            curvature: 3,
            expression: 'bad',
            bottomPosition: 125,
            leftPosition: 150,
            rightPosition: 150,
          ),
        );
      case 2:
        return FaceProperties(
          leftEye: EyeProperties(
            width: 120,
            height: 120,
            position: 50,
            topPosition: 40,
          ),
          rightEye: EyeProperties(
            width: 120,
            height: 120,
            position: 50,
            topPosition: 40,
          ),
          mouth: MouthProperties(
            width: 1,
            height: 10,
            curvature: 2,
            expression: 'smile',
            bottomPosition: 60,
            leftPosition: 150,
            rightPosition: 150,
          ),
        );
      default:
        return FaceProperties(
          leftEye: EyeProperties(
            width: 120,
            height: 120,
            position: 50,
            topPosition: 40,
          ),
          rightEye: EyeProperties(
            width: 120,
            height: 120,
            position: 50,
            topPosition: 40,
          ),
          mouth: MouthProperties(
            width: 80,
            height: 40,
            curvature: 1,
            expression: 'smile',
            bottomPosition: 30,
            leftPosition: 50,
            rightPosition: 50,
          ),
        );
    }
  }
}
