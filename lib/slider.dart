import 'package:feedbackchallenge/providrState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderState = Provider.of<SliderState>(context);
    final List<String> labels = ["Bad", "Not Bad", "Good"];

    return GestureDetector(
      onTapDown: (details) {
        final width = MediaQuery.of(context).size.width - 20;
        final tapPosition = details.localPosition.dx;
        final selectedIndex = (tapPosition / (width / 3)).floor();
        sliderState.updateIndex(selectedIndex);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 7,
                    color: sliderState.getBigTextColor(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (index) {
                      final isSelected = sliderState.selectedIndex == index;
                      return SizedBox(
                        child: AnimatedContainer(
                          height: isSelected ? 50 : 17,
                          width: 50,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? sliderState.getDarkColor()
                                : sliderState.getBigTextColor(),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: isSelected
                                ? Transform.rotate(
                                    angle: index == 2 ? 1.57 : 4.71,
                                    child: Text(
                                      ")",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: sliderState.getBigTextColor()),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (index) {
                return Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: sliderState.selectedIndex == index
                        ? sliderState.getDarkColor()
                        : sliderState.getBigTextColor(),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
