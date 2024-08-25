import 'package:feedbackchallenge/providrState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sliderState = Provider.of<SliderState>(context);

    return GestureDetector(
      onTap: () {
        sliderState.toggleExpand();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(color: sliderState.getBigTextColor()),
          borderRadius: BorderRadius.circular(30),
          color: sliderState.getbuttomColor(),
        ),
        height: sliderState.isExpanded ? 150 : 54,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Visibility(
              visible: !sliderState.isExpanded,
              child: Text(
                "Add note",
                style: TextStyle(color: sliderState.getDarkColor()),
              ),
            ),
            Visibility(
              visible: sliderState.isExpanded,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Add note",
                      border: InputBorder.none,
                      fillColor: sliderState.getBigTextColor(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        // Action when submit is pressed
                      },
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
                              style: TextStyle(
                                  color: sliderState.getBackgroundColor()),
                            ),
                            Icon(Icons.arrow_forward,
                                size: 20,
                                color: sliderState.getBackgroundColor()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}