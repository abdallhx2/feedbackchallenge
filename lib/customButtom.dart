import 'package:feedbackchallenge/providrState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderState = Provider.of<SliderState>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 54,
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(color: sliderState.getBigTextColor()),
                borderRadius: BorderRadius.circular(30),
                color: sliderState.getBigTextColor(),
              ),
              child: Text(
                "Add note",
                style: TextStyle(color: sliderState.getDarkColor()),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 54,
              width: 115,
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: sliderState.getDarkColor(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Submit",
                    style: TextStyle(color: sliderState.getBackgroundColor()),
                  ),
                  Icon(Icons.arrow_forward,
                      size: 20, color: sliderState.getBackgroundColor()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:feedbackchallenge/providrState.dart';
// import 'package:flutter/material.dart';
// import 'package:animations/animations.dart';
// import 'package:provider/provider.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final sliderState = Provider.of<SliderState>(context);

//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//       child: Stack(
//         alignment: Alignment.centerRight,
//         children: [
//           OpenContainer(
//             transitionType: ContainerTransitionType.fadeThrough,
//             openBuilder: (context, openContainer) {
//               return NoteEditor();
//             },
//             closedBuilder: (context, closeContainer) {
//               return InkWell(
//                 onTap: closeContainer,
//                 child: Container(
//                   height: 54,
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   alignment: Alignment.centerLeft,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: sliderState.getBigTextColor()),
//                     borderRadius: BorderRadius.circular(30),
//                     color: sliderState.getBigTextColor(),
//                   ),
//                   child: Text(
//                     "Add note",
//                     style: TextStyle(color: sliderState.getDarkColor()),
//                   ),
//                 ),
//               );
//             },
//             closedElevation: 0,
//             closedShape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),
//           OpenContainer(
//             transitionType: ContainerTransitionType.fadeThrough,
//             openBuilder: (context, openContainer) {
//               return NoteEditor();
//             },
//             closedBuilder: (context, closeContainer) {
//               return InkWell(
//                 onTap: closeContainer,
//                 child: Container(
//                   height: 54,
//                   width: 115,
//                   padding: EdgeInsets.all(15),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(40),
//                     color: sliderState.getDarkColor(),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         "Submit",
//                         style:
//                             TextStyle(color: sliderState.getBackgroundColor()),
//                       ),
//                       Icon(Icons.arrow_forward,
//                           size: 20, color: sliderState.getBackgroundColor()),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             closedElevation: 0,
//             closedShape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(40),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NoteEditor extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final sliderState = Provider.of<SliderState>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add a note'),
//         backgroundColor: sliderState.getBigTextColor(),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: TextField(
//           maxLines: null,
//           decoration: InputDecoration(
//             hintText: 'Enter your note here...',
//             border: OutlineInputBorder(),
//           ),
//         ),
//       ),
//     );
//   }
// }
