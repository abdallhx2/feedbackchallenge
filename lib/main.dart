import 'package:feedbackchallenge/body.dart';
import 'package:feedbackchallenge/providrState.dart';
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

// class FeedbackScreen extends StatefulWidget {
//   @override
//   State<FeedbackScreen> createState() => _FeedbackScreenState();
// }

// class _FeedbackScreenState extends State<FeedbackScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final sliderState = Provider.of<SliderState>(context);

//     return AnimatedContainer(
//       curve: Curves.easeInOut,
//       duration: Duration(milliseconds: 300),
//       color: sliderState.getBackgroundColor(),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: ListView(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.close, color: Colors.black),
//                       onPressed: () {},
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.info_outline, color: Colors.black),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   height: !sliderState.isExpanded ? 20 : 0,
//                   curve: Curves.easeInOut,
//                   child: Container(),
//                 ),
//                 AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 300),
//                   child: !sliderState.isExpanded
//                       ? Text(
//                           sliderState.getFeeedbackText().isEmpty
//                               ? 'How was your shopping experience?'
//                               : 'Thank you for feedback',
//                           key: ValueKey(sliderState.getFeeedbackText().isEmpty
//                               ? 'question'
//                               : 'thankYou'),
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 24,
//                             color: sliderState.getDarkColor(),
//                           ),
//                         )
//                       : SizedBox.shrink(),
//                 ),
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   height: !sliderState.isExpanded ? 40 : 0,
//                   curve: Curves.easeInOut,
//                   child: Container(),
//                 ),
//                 const Faces(),
//                 AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 300),
//                   child: !sliderState.isExpanded
//                       ? Text(
//                           sliderState.getText(),
//                           key: ValueKey(2),
//                           style: TextStyle(
//                             fontSize: 60,
//                             fontWeight: FontWeight.w900,
//                             color: sliderState.getBigTextColor(),
//                           ),
//                         )
//                       : SizedBox.shrink(),
//                 ),
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   height: !sliderState.isExpanded ? 20 : 0,
//                   curve: Curves.easeInOut,
//                   child: Container(),
//                 ),
//                 AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 300),
//                   child: !sliderState.isExpanded
//                       ? CustomSlider(
//                           key: ValueKey(3),
//                         )
//                       : Container(),
//                 ),
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   height: !sliderState.isExpanded ? 20 : 0,
//                   curve: Curves.easeInOut,
//                   child: Container(),
//                 ),
//                 AnimatedSwitcher(
//                   duration: Duration(milliseconds: 300),
//                   child: CustomButton(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
