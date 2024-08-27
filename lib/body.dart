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
        body: Stack(
          children: _buildWidgetBasedOnState(sliderState),
        ),
      ),
    );
  }

  List<Widget> _buildWidgetBasedOnState(SliderState sliderState) {
    switch (sliderState.getWidgetState()) {
      case WidgetSt.initial:
        return [
          _buildTopBar(),
          _buildMessageQuestion(sliderState,
              top: 220.0, left: 30.0, right: 30.0),
          _buildFaces(sliderState, top: 220.0, left: 30.0, right: 30.0),
          _buildFeedbackText(sliderState, top: 450.0, left: 30.0, right: 30.0),
          _buildSlider(sliderState, bottom: 220.0, left: 30.0, right: 30.0),
          _buildCustomButton(sliderState,
              bottom: 30.0, left: 30.0, right: 30.0),
        ];
      case WidgetSt.feedback:
        return [
          _buildFaces(sliderState, top: 130.0, left: 30.0, right: 30.0),
          _buildCustomButton(sliderState,
              bottom: 150.0, left: 30.0, right: 30.0),
        ];
      case WidgetSt.thankYou:
        return [
          _buildFaces(sliderState, top: 140.0),
          //  _buildThankYouMessage(sliderState),
        ];
      default:
        return [
          _buildTopBar(),
          _buildMessageQuestion(sliderState,
              top: 220.0, left: 30.0, right: 30.0),
          _buildFaces(sliderState, top: 220.0, left: 30.0, right: 30.0),
          _buildFeedbackText(sliderState, top: 450.0, left: 30.0, right: 30.0),
          _buildSlider(sliderState, bottom: 220.0, left: 30.0, right: 30.0),
          _buildCustomButton(sliderState,
              bottom: 30.0, left: 30.0, right: 30.0),
        ];
    }
  }

  Widget _buildTopBar() {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      top: 50,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
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
      ),
    );
  }

  Widget _buildMessageQuestion(SliderState sliderState,
      {double top = 0.0, double left = 0.0, double right = 0.0}) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      top: top,
      left: left,
      right: right,
      child: Text(
        'How was your shopping experience?',
        key: ValueKey('question'),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          color: sliderState.getDarkColor(),
        ),
      ),
    );
  }

  Widget _buildFaces(SliderState sliderState,
      {double top = 0.0, double left = 0.0, double right = 0.0}) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      top: top,
      left: left,
      right: right,
      child: const Faces(),
    );
  }

  Widget _buildFeedbackText(SliderState sliderState,
      {double top = 0.0, double left = 0.0, double right = 0.0}) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      top: top,
      left: left,
      right: right,
      child: Text(
        sliderState.getText(),
        key: ValueKey('feedbackText'),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w900,
          color: sliderState.getBigTextColor(),
        ),
      ),
    );
  }

  Widget _buildSlider(SliderState sliderState,
      {double bottom = 0.0, double left = 0.0, double right = 0.0}) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      bottom: bottom,
      left: left,
      right: right,
      child: CustomSlider(
        key: ValueKey('slider'),
      ),
    );
  }

  Widget _buildCustomButton(SliderState sliderState,
      {double bottom = 0.0, double left = 0.0, double right = 0.0}) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      bottom: bottom,
      left: left,
      right: right,
      child: CustomButton(),
    );
  }
}
