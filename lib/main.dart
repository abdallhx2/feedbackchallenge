import 'package:feedbackchallenge/customButtom.dart';
import 'package:feedbackchallenge/faces.dart';
import 'package:feedbackchallenge/providrState.dart';
import 'package:feedbackchallenge/slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SliderState(),
      child: MaterialApp(home: FeedbackScreen()),
    ),
  );
}

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sliderState = Provider.of<SliderState>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      color: sliderState.getBackgroundColor(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.info_outline, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'How was your shopping experience',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Faces(),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Text(
                    sliderState.getFeedbackText(),
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                      color: sliderState.getBigTextColor(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomSlider(),
                SizedBox(height: 20),
                Spacer(
                  flex: 1,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  child: CustomButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
