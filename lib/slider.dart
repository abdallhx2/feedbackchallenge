import 'package:feedbackchallenge/providrState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sliderState = Provider.of<SliderState>(context);
    final List<String> labels = ["Bad", "Not Bad", "Good"];

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 7,
                color: sliderState.getBigTextColor(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) {
                  return ButtonSlider(
                    index: index,
                    isSelected: sliderState.selectedIndex == index,
                    onPressed: (int index) {
                      sliderState.updateIndex(index);
                    },
                    lineColor: sliderState.getDarkColor(),
                    pointColor: sliderState.getBigTextColor(),
                  );
                }),
              ),
            ],
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
    );
  }
}

class ButtonSlider extends StatelessWidget {
  final int index;
  final bool isSelected;
  final Function(int) onPressed;
  final Color lineColor;
  final Color pointColor;

  const ButtonSlider({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onPressed,
    required this.lineColor,
    required this.pointColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => onPressed(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isSelected ? 50 : 17,
        width: isSelected ? 50 : 17,
        decoration: BoxDecoration(
          color: isSelected ? lineColor : pointColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: isSelected
              ? ImageIcon(
                  AssetImage("assets/images/smile.png"),
                  size: 20,
                )

                
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
