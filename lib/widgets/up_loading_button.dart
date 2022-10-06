import 'package:flutter/material.dart';

class UpLoadingButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final Function onPress;

  const UpLoadingButton(
      {Key? key,
      required this.text,
      required this.isLoading,
      required this.isSuccess,
      required this.isError,
      required this.onPress})
      : super(key: key);

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
                        child: ElevatedButton(
                          onPressed: () {
                            onPress();
                          },
                          child: Text(text),
                        ),
                      ),
      ),
    );
  }
}
