import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodzo/utils/colors.dart';
import 'package:foodzo/utils/dimensions.dart';
import 'package:foodzo/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool isTextHidden = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf, size: Dimensions.font16, color: AppColors.paraColor)
          : Column(
              children: [
                SmallText(
                  color: AppColors.paraColor,
                  height: 1.6,
                  text: isTextHidden ? (firstHalf + "...") : (firstHalf + secondHalf),
                  size: Dimensions.font16,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isTextHidden = !isTextHidden;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(text: isTextHidden ? "Show more" : "Show less", color: AppColors.mainColor),
                      Icon(isTextHidden ? Icons.arrow_drop_down : Icons.arrow_drop_up, color: AppColors.mainColor),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
