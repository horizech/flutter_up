import 'package:flutter/material.dart';

class UpLoadingCard extends StatefulWidget {
  final String text;
  const UpLoadingCard({Key? key, required this.text}) : super(key: key);

  @override
  UpLoadingCardState createState() => UpLoadingCardState();
}

class UpLoadingCardState extends State<UpLoadingCard> {
  UpLoadingCardState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 256,
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 64,
                height: 64,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Text(widget.text)
            ],
          ),
        ),
      ),
    );
  }
}
