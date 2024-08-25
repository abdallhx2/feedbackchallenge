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

class FeedbackScreen extends StatefulWidget {
  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    final sliderState = Provider.of<SliderState>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      color: sliderState.getBackgroundColor(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: ListView(
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
                Visibility(
                  visible: !sliderState.isExpanded,
                  child: Text(
                    'How was your shopping experience?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24, color: sliderState.getDarkColor()),
                  ),
                ),
                SizedBox(height: 40),
                Faces(), // Faces remains visible regardless of isExpanded
                Visibility(
                  visible: !sliderState.isExpanded,
                  child: AnimatedSwitcher(
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
                ),
                SizedBox(height: 20),
                Visibility(
                  visible: !sliderState.isExpanded,
                  child: CustomSlider(),
                ),
                SizedBox(height: 20),
                Visibility(
                  visible: !sliderState.isExpanded,
                  child: Spacer(
                    flex: 1,
                  ),
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
