import 'package:feedbackchallenge/customButtom.dart';
import 'package:feedbackchallenge/faces.dart';
import 'package:feedbackchallenge/providrState.dart';
import 'package:feedbackchallenge/slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    final sliderState = Provider.of<SliderState>(context);

    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      color: sliderState.getBackgroundColor(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: ListView(
              children: [
                _buildTopBar(),
                SizedBox(height: 20),
                _buildMessageOrQuestion(sliderState),
                SizedBox(height: 40),
                _buildFaces(sliderState),
                SizedBox(height: 20),
                _buildFeedbackText(sliderState),
                SizedBox(height: 20),
                _buildSlider(sliderState),
                SizedBox(height: 20),
                _buildCustomButtonOrThankYou(sliderState),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
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
    );
  }

  Widget _buildMessageOrQuestion(SliderState sliderState) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: sliderState.getFeeedbackText().isEmpty
          ? Text(
              'How was your shopping experience?',
              key: ValueKey('question'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: sliderState.getDarkColor(),
              ),
            )
          : Text(
              'Thank you for feedback',
              key: ValueKey('thankYou'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: sliderState.getDarkColor(),
              ),
            ),
    );
  }

  Widget _buildFaces(SliderState sliderState) {
    return const Faces();
  }

  Widget _buildFeedbackText(SliderState sliderState) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: !sliderState.isExpanded
          ? Text(
              sliderState.getText(),
              key: ValueKey('feedbackText'),
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w900,
                color: sliderState.getBigTextColor(),
              ),
            )
          : SizedBox.shrink(),
    );
  }

  Widget _buildSlider(SliderState sliderState) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: !sliderState.isExpanded
          ? CustomSlider(
              key: ValueKey('slider'),
            )
          : SizedBox.shrink(),
    );
  }

  Widget _buildCustomButtonOrThankYou(SliderState sliderState) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: sliderState.getFeeedbackText().isEmpty
          ? CustomButton()
          : SizedBox.shrink(),
    );
  }
}
