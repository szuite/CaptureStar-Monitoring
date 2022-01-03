import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SegmentedSelector extends StatelessWidget {
  const SegmentedSelector(
      {Key? key, required this.menuOptions,
        required this.selectedOption,
        required this.onValueChanged}) : super(key: key);

  final List<dynamic> menuOptions;
  final String selectedOption;
  final void Function(dynamic) onValueChanged;

  @override
  Widget build(BuildContext context) {
    //if (Platform.isIOS) {}

    return CupertinoSlidingSegmentedControl(
      //thumbColor: Theme.of(context).primaryColor,
        groupValue: selectedOption,
        children: { for (var option in menuOptions) option.key : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(option.icon),
              const SizedBox(width: 6),
              Text(option.value),
            ],
          ) },
        onValueChanged: onValueChanged);
  }
}