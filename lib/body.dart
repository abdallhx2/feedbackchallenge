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
      resizeToAvoidBottomInset: false,
      body: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 500),
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
        _buildFaces(sliderState),
        _buildCustomButton(sliderState),
        _buildTopBar(sliderState),
        _buildMessageQuestion(sliderState),
        _buildFeedbackText(sliderState),
        _buildSlider(sliderState),
      ];
    } else if (sliderState.getWidgetState() == WidgetSt.feedback) {
      return [
        _buildFaces(sliderState),
        _buildCustomButton(sliderState),
      ];
    } else if (sliderState.getWidgetState() == WidgetSt.thankYou) {
      return [
        _buildFaces(sliderState),
        _buildButtonContinue(sliderState),
        _buildTopBar(sliderState),
        _buildThankYouMessage(
          sliderState,
        ),
        _buildThankMessage(sliderState),
      ];
    } else {
      return [];
    }
  }

  Widget _buildTopBar(
    SliderState sliderState,
  ) {
    return Positioned(
      top: 50,
      left: 30,
      right: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(11.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: sliderState.getDarkColor().withOpacity(0.1)),
              child: Icon(Icons.close, color: sliderState.getDarkColor()),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(11.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: sliderState.getDarkColor().withOpacity(0.1),
              ),
              child:
                  Icon(Icons.info_outline, color: sliderState.getDarkColor()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThankMessage(
    SliderState sliderState,
  ) {
    return Positioned(
      bottom: 150,
      right: 30,
      left: 30,
      child: Text(
        'We appreciate your input and are always looking for ways to improve!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: sliderState.getDarkColor(),
        ),
      ),
    );
  }

  Widget _buildThankYouMessage(
    SliderState sliderState,
  ) {
    return Positioned(
      bottom: 200,
      right: 30,
      left: 30,
      child: Text(
        'Thank you for your feedback!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.bold,
          color: sliderState.getDarkColor(),
        ),
      ),
    );
  }

  Widget _buildMessageQuestion(
    SliderState sliderState,
  ) {
    return Positioned(
      top: 100,
      right: 30,
      left: 30,
      child: Text(
        'How was your shopping experience?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          color: sliderState.getDarkColor(),
        ),
      ),
    );
  }

  Widget _buildFaces(
    SliderState sliderState,
  ) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 500),
      top: sliderState.topFace,
      left: 30,
      right: 30,
      child: const Faces(),
    );
  }

  Widget _buildFeedbackText(
    SliderState sliderState,
  ) {
    return Positioned(
      bottom: 220,
      right: 30,
      left: 30,
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
    return Positioned(bottom: 150, right: 30, left: 30, child: CustomSlider());
  }

  Widget _buildButtonContinue(
    SliderState sliderState,
  ) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 500),
      bottom: 50,
      right: 30,
      left: 30,
      child: ButtonContinue(),
    );
  }

  Widget _buildCustomButton(
    SliderState sliderState,
  ) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 500),
      bottom: sliderState.topButton,
      left: 30,
      right: 30,
      child: CustomButton(),
    );
  }
}
