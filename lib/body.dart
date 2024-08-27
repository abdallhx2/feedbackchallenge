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
          children: [
            _buildTopBar(),
            _buildMessageOrQuestion(sliderState),
            _buildFaces(sliderState),
            _buildFeedbackText(sliderState),
            _buildSlider(sliderState),
            _buildCustomButtonOrThankYou(sliderState),
            
          if (sliderState.getWidgetState() == WidgetSt.initial) ...[
          _buildMessageOrQuestion(sliderState, top: 130.0),
          _buildSlider(sliderState, ),
          _buildFaces(sliderState,top: 140.0),

        ],
          ],
        ),
      ),
    );
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

  Widget _buildMessageOrQuestion(SliderState sliderState, {double top = 0.0}) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      top: top,
      left: 30,
      right: 30,
      child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            'How was your shopping experience?',
            key: ValueKey('question'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: sliderState.getDarkColor(),
            ),
          )),
    );
  }

  Widget _buildFaces(SliderState sliderState,{double top = 0.0}) {
    return const AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      top: 220,
      left: 30,
      right: 30,
      child: Faces(),
    );
  }

  Widget _buildFeedbackText(SliderState sliderState) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      top: 450,
      left: 30,
      right: 30,
      child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            sliderState.getText(),
            key: ValueKey('feedbackText'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w900,
              color: sliderState.getBigTextColor(),
            ),
          )),
    );
  }

  Widget _buildSlider(SliderState sliderState) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      bottom: 220,
      left: 30,
      right: 30,
      child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: CustomSlider(
            key: ValueKey('slider'),
          )),
    );
  }

  Widget _buildCustomButtonOrThankYou(SliderState sliderState) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      bottom: 30,
      left: 30,
      right: 30,
      child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300), child: CustomButton()),
    );
  }
}
