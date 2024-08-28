import 'package:feedbackchallenge/providrState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatefulWidget {
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sliderState = context.watch<SliderState>();

    return GestureDetector(
      onTap: () {
        if (sliderState.getWidgetState() == WidgetSt.initial) {
          sliderState.toggleExpand();
          sliderState.setWidgetState(WidgetSt.feedback);
        } else if (sliderState.getWidgetState() == WidgetSt.feedback) {
          sliderState.toggleExpand();
          sliderState.setWidgetState(WidgetSt.initial);
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          border: Border.all(color: sliderState.getDarkColor()),
          borderRadius: BorderRadius.circular(30),
          color: sliderState.getborderColor(),
        ),
        height: sliderState.isExpanded ? 150 : 56,
        child: sliderState.isExpanded
            ? Stack(
                children: [
                  TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Add note",
                      hintStyle: TextStyle(
                        color: sliderState.getBigTextColor(),
                      ),
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: ButtonSubmit(
                      darckColor: sliderState.getDarkColor(),
                      backColor: sliderState.getBackgroundColor(),
                      controller: _controller,
                      onSubmit: () {
                        if (_controller.text.isNotEmpty) {
                          setState(() {
                            sliderState.setFeeedbackText(_controller.text);
                            sliderState.toggleExpand();
                            sliderState.setWidgetState(WidgetSt.thankYou);
                          });
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("No Feedback"),
                                content: Text(
                                    "Please enter some feedback before submitting."),
                                actions: [
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add note",
                    style: TextStyle(
                      color: sliderState.getDarkColor(),
                    ),
                  ),
                  ButtonSubmit(
                    darckColor: sliderState.getDarkColor(),
                    backColor: sliderState.getBackgroundColor(),
                    controller: _controller,
                    onSubmit: () {
                      if (_controller.text.isNotEmpty) {
                        setState(() {
                          sliderState.toggleExpand();

                          sliderState.setFeeedbackText(_controller.text);
                        });
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("No Feedback"),
                              content: Text(
                                  "Please enter some feedback before submitting."),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
      ),
    );
  }
}

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({
    Key? key,
    required this.darckColor,
    required this.backColor,
    required this.controller,
    required this.onSubmit,
  }) : super(key: key);

  final Color darckColor;
  final Color backColor;
  final TextEditingController controller;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSubmit,
      child: Container(
        height: 54,
        width: 115,
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: darckColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Submit",
              style: TextStyle(color: backColor, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_forward, size: 20, color: backColor),
          ],
        ),
      ),
    );
  }
}

class ButtonContinue extends StatelessWidget {
  const ButtonContinue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sliderState = context.watch<SliderState>();

    return InkWell(
      onTap: () {
        sliderState.setWidgetState(WidgetSt.initial);
      },
      child: Container(
        height: 54,
        width: 115,
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: sliderState.getDarkColor(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Countinue my shopping",
              style: TextStyle(
                  color: sliderState.getBackgroundColor(),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.arrow_forward,
                size: 20, color: sliderState.getBackgroundColor()),
          ],
        ),
      ),
    );
  }
}
