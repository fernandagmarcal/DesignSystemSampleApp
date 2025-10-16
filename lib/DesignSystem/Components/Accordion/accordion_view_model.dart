import 'package:flutter/material.dart';

class AccordionItemViewModel {
  final String title;
  final String? subtitle;
  final Widget content;
  final bool initiallyExpanded;

  AccordionItemViewModel({
    required this.title,
    required this.content,
    this.subtitle,
    this.initiallyExpanded = false,
  });
}
