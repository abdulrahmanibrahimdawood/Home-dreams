import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoSwitch extends StatelessWidget {
  const CustomCupertinoSwitch({super.key, this.onChanged});
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: Alignment.centerLeft,
      scale: 0.85,
      child: CupertinoSwitch(
        value: false,
        onChanged: onChanged,
        activeTrackColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
