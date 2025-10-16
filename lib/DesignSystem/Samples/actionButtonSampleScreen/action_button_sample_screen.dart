import 'package:flutter/material.dart';
import '../../Components/Buttons/ActionButton/action_button_gallery.dart';

class ActionButtonPage extends StatelessWidget {
  const ActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Action Buttons Showcase'),
        centerTitle: true,
      ),
      body: const ActionButtonGallery(),
    );
  }
}
