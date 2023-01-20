import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/widgets/up_button.dart';

class UpLoadingButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final Function onPress;
  final UpColorType? colorType;
  final bool? isButtonDisable;
  final bool isRounded;
  final double roundedBorderRadius;
  final Color borderColor;
  final double borderWidth;

  const UpLoadingButton({
    Key? key,
    required this.text,
    this.isLoading = false,
    this.isSuccess = false,
    this.isError = false,
    required this.onPress,
    this.colorType,
    this.isButtonDisable = false,
    this.isRounded = false,
    this.roundedBorderRadius = 18,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSuccess
              ? Colors.green
              : isError
                  ? Colors.red
                  : Colors.black),
      child: Center(
        child: isSuccess
            ? const Icon(Icons.done, size: 50, color: Colors.white)
            : isError
                ? const Icon(Icons.error, size: 50, color: Colors.white)
                : isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : SizedBox(
                        width: 200,
                        child: UpButton(
                          onPressed: () {
                            onPress();
                          },
                          text: text,
                        ),
                      ),
      ),
    );
  }
}
