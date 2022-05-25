import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String? text;
  const ExpandableText({Key? key, this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool hiddenText = true;

  late String firstView;
  late String secondView;

  double textHeight = 100;
  @override
  void initState() {
    super.initState();
    if (widget.text!.length > textHeight) {
      firstView = widget.text!.substring(0, textHeight.toInt());
      secondView =
          widget.text!.substring(textHeight.toInt() + 1, widget.text!.length);
    } else {
      firstView = widget.text!;
      secondView = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondView.isEmpty
          ? Text(firstView)
          : Column(
              children: [
                Text(hiddenText ? firstView + '...' : firstView + secondView),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Text('Show more'),
                )
              ],
            ),
    );
  }
}
