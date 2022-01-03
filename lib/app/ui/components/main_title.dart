import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  final String? title;

  const MainTitle({Key? key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(left: 28.0, top: 40.0),
      child: Text(
        title!,
        style: theme.headline2,
      ),
    );
  }
}
