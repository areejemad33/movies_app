
import 'package:flutter/material.dart';

class TabItem extends Tab {
  const TabItem({
    required Widget icon,
    required String label,
  }) : super(
    icon: icon,
    text: label,
  );
}