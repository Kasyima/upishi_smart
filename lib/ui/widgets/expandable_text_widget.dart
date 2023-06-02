import 'package:flutter/material.dart';
import 'package:recipes/ui/widgets/colors.dart';
import 'package:recipes/ui/widgets/small_text_widget.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = 150;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(
        0,
        textHeight.toInt(),
      );
      secondHalf = widget.text.substring(
        textHeight.toInt() + 1,
        widget.text.length,
      );
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              children: [
                SmallText(
                  color: Color.fromARGB(255, 19, 18, 18),
                  size: 18,
                  height: 1.5,
                  text: hiddenText
                      ? (firstHalf + "....")
                      : (firstHalf + secondHalf),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        size: 17,
                        text: hiddenText ? 'Show more' : 'Show less',
                        color: Color.fromARGB(255, 12, 12, 12),
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Color.fromARGB(255, 16, 15, 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
