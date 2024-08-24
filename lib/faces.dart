import 'package:feedbackchallenge/providrState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Faces extends StatelessWidget {
  const Faces({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderState = Provider.of<SliderState>(context);

    return Container(
      height: 250,
      child: FaceWidget(
        color: sliderState.getDarkColor(),
        eyeWidth: sliderState.getFaceProperties().leftEye.width,
        eyeHeight: sliderState.getFaceProperties().leftEye.height,
        leftEyeLeftPosition: sliderState.getFaceProperties().leftEye.position,
        rightEyeRightPosition:
            sliderState.getFaceProperties().rightEye.position,
        eyeTopPosition: sliderState.getFaceProperties().leftEye.topPosition,
        mouthWidth: sliderState.getFaceProperties().mouth.width,
        mouthHeight: sliderState.getFaceProperties().mouth.height,
        mouthCurvature: sliderState.getFaceProperties().mouth.curvature,
        mouthExpression: sliderState.getFaceProperties().mouth.expression,
        mouthBottomPosition:
            sliderState.getFaceProperties().mouth.bottomPosition,
        mouthLeftPosition: sliderState.getFaceProperties().mouth.leftPosition,
        mouthRightPosition: sliderState.getFaceProperties().mouth.rightPosition,
      ),
    );
  }
}

class FaceWidget extends StatelessWidget {
  final Color color;
  final double eyeWidth;
  final double eyeHeight;
  final double leftEyeLeftPosition;
  final double rightEyeRightPosition;
  final double eyeTopPosition;
  final double mouthWidth;
  final double mouthHeight;
  final double mouthCurvature;
  final String mouthExpression;
  final double mouthBottomPosition;
  final double mouthLeftPosition;
  final double mouthRightPosition;

  FaceWidget({
    required this.color,
    required this.eyeWidth,
    required this.eyeHeight,
    required this.leftEyeLeftPosition,
    required this.rightEyeRightPosition,
    required this.eyeTopPosition,
    required this.mouthWidth,
    required this.mouthHeight,
    required this.mouthCurvature,
    required this.mouthExpression,
    required this.mouthBottomPosition,
    required this.mouthLeftPosition,
    required this.mouthRightPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Left Eye
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          left: leftEyeLeftPosition,
          top: eyeTopPosition,
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300),
            width: eyeWidth,
            height: eyeHeight,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ),
        // Right Eye
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          right: rightEyeRightPosition,
          top: eyeTopPosition,
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300),
            width: eyeWidth,
            height: eyeHeight,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ),
        // Mouth
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          bottom: mouthBottomPosition,
          left: mouthLeftPosition,
          right: mouthRightPosition,
          child: MouthWidget(
            mouthWidth: mouthWidth,
            mouthHeight: mouthHeight,
            mouthCurvature: mouthCurvature,
            mouthColor: color,
            mouthExpression: mouthExpression,
          ),
        ),
      ],
    );
  }
}

class FaceProperties {
  final EyeProperties leftEye;
  final EyeProperties rightEye;
  final MouthProperties mouth;

  FaceProperties({
    required this.leftEye,
    required this.rightEye,
    required this.mouth,
  });
}

class EyeProperties {
  final double width;
  final double height;
  final double position;
  final double topPosition;

  EyeProperties({
    required this.width,
    required this.height,
    required this.position,
    required this.topPosition,
  });
}

class MouthProperties {
  final double width;
  final double height;
  final double curvature;
  final String expression;
  final double bottomPosition;
  final double leftPosition;
  final double rightPosition;

  MouthProperties({
    required this.width,
    required this.height,
    required this.curvature,
    required this.expression,
    required this.bottomPosition,
    required this.leftPosition,
    required this.rightPosition,
  });
}

class MouthWidget extends StatelessWidget {
  final double mouthWidth;
  final double mouthHeight;
  final double mouthCurvature;
  final Color mouthColor;
  final String mouthExpression;

  MouthWidget({
    required this.mouthWidth,
    required this.mouthHeight,
    required this.mouthCurvature,
    required this.mouthColor,
    required this.mouthExpression,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(mouthWidth, mouthHeight),
      painter: MouthPainter(
        mouthCurvature: mouthCurvature,
        mouthColor: mouthColor,
        mouthExpression: mouthExpression,
      ),
    );
  }
}

class MouthPainter extends CustomPainter {
  final double mouthCurvature;
  final Color mouthColor;
  final String mouthExpression;

  MouthPainter({
    required this.mouthCurvature,
    required this.mouthColor,
    required this.mouthExpression,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);

    switch (mouthExpression) {
      case 'bad':
        path.moveTo(0, size.height);
        path.quadraticBezierTo(
          center.dx,
          center.dy - (size.height * mouthCurvature),
          size.width,
          size.height,
        );
        break;
      case 'smile':
        path.moveTo(0, center.dy);
        path.quadraticBezierTo(
          center.dx,
          center.dy + (size.height * mouthCurvature),
          size.width,
          center.dy,
        );
        break;
    }

    final paint = Paint()
      ..color = mouthColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
