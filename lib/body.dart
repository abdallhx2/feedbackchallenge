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

    return Scaffold(
      body: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 300),
        color: sliderState.getBackgroundColor(),
        child: Stack(
          children: _buildWidgetBasedOnState(sliderState),
        ),
      ),
    );
  }

  List<Widget> _buildWidgetBasedOnState(SliderState sliderState) {
    if (sliderState.getWidgetState() == WidgetSt.initial) {
      return [
        _buildInitialBody(sliderState),
        _buildFaces(sliderState),
        _buildCustomButton(sliderState),
      ];
    } else if (sliderState.getWidgetState() == WidgetSt.feedback) {
      return [
        _buildFaces(sliderState),
        _buildCustomButton(sliderState),
      ];
    } else if (sliderState.getWidgetState() == WidgetSt.thankYou) {
      return [
        _buildTopBar(),
        _buildFaces(sliderState),
        _buildThankYouMessage(
          sliderState,
        ),
      ];
    } else {
      return [];
    }
  }

  Widget _buildInitialBody(
    SliderState sliderState,
  ) {
    return Column(
      children: [
        _buildTopBar(),
        SizedBox(height: 30),
        _buildMessageQuestion(sliderState),
        SizedBox(height: 30),
        _buildFeedbackText(sliderState),
        SizedBox(height: 30),
        _buildSlider(sliderState),
      ],
    );
  }

  Widget _buildTopBar() {
    return Positioned(
      top: 50,
      left: 30,
      right: 30,
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
    );
  }

  Widget _buildThankYouMessage(
    SliderState sliderState,
  ) {
    return Column(
      children: [
        Text(
          'Thank you for your feedback!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: sliderState.getDarkColor(),
          ),
        ),
        Text(
          'We appreciate your input and are always looking for ways to improve!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: sliderState.getDarkColor(),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageQuestion(
    SliderState sliderState,
  ) {
    return Text(
      'How was your shopping experience?',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        color: sliderState.getDarkColor(),
      ),
    );
  }

  Widget _buildFaces(
    SliderState sliderState,
  ) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 700),
      top: sliderState.topFace,
      left: 30,
      right: 30,
      child: const Faces(),
    );
  }

  Widget _buildFeedbackText(
    SliderState sliderState,
  ) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 700),
      child: Text(
        sliderState.getText(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w900,
          color: sliderState.getBigTextColor(),
        ),
      ),
    );
  }

  Widget _buildSlider(
    SliderState sliderState,
  ) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 700), child: CustomSlider());
  }

  Widget _buildButtonContinue(SliderState sliderState,
      {double bottom = 0.0, double left = 0.0, double right = 0.0}) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 700),
      child: ButtonContinue(),
    );
  }

  Widget _buildCustomButton(
    SliderState sliderState,
  ) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 700),
      bottom: sliderState.topButton,
      left: 30,
      right: 30,
      child: CustomButton(),
    );
  }
}
