// import 'package:flutter/material.dart';
// import 'input_text_view_model.dart';
//
// class StyledInputField extends StatefulWidget {
//   final InputTextViewModel viewModel;
//
//   const StyledInputField._({Key? key, required this.viewModel}) : super(key: key);
//
//   @override
//   StyledInputFieldState createState() => StyledInputFieldState();
//
//   static Widget instantiate({required InputTextViewModel viewModel}) {
//     return StyledInputField._(viewModel: viewModel);
//   }
// }
//
// class StyledInputFieldState extends State<StyledInputField> {
//   late bool obscureText;
//   String? errorMsg;
//
//   @override
//   void initState() {
//     super.initState();
//     obscureText = widget.viewModel.password;
//     widget.viewModel.controller.addListener(validateInput);
//   }
//
//   void validateInput() {
//     final errorText = widget.viewModel.validator?.call(widget.viewModel.controller.text);
//     setState(() {
//       errorMsg = errorText;
//     });
//   }
//
//   void togglePasswordVisibility() {
//     setState(() {
//       obscureText = !obscureText;
//     });
//   }
//
//   @override
//   void dispose() {
//     widget.viewModel.controller.removeListener(validateInput);
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     InputDecoration decoration = InputDecoration(
//       contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//       filled: true,
//       suffixIcon: widget.viewModel.password
//           ? IconButton(
//               icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
//               onPressed: togglePasswordVisibility,
//             )
//           : widget.viewModel.suffixIcon,
//       fillColor: widget.viewModel.isEnabled ? Colors.white : Colors.grey.shade400,
//       labelText: widget.viewModel.placeholder.isNotEmpty ? widget.viewModel.placeholder : null,
//       labelStyle: const TextStyle(color: Colors.black),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: const BorderSide(color: Colors.black),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: const BorderSide(color: Colors.red),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: const BorderSide(color: Colors.black),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: const BorderSide(color: Colors.black),
//       ),
//       disabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: const BorderSide(color: Colors.grey),
//       ),
//       errorText: errorMsg,
//     );
//
//     return TextFormField(
//       controller: widget.viewModel.controller,
//       obscureText: obscureText,
//       decoration: decoration,
//       style: const TextStyle(color: Colors.black),
//       enabled: widget.viewModel.isEnabled,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'input_text_view_model.dart';
import '../../shared/shared_colors.dart';   // ← usa as cores do DS HP

class StyledInputField extends StatefulWidget {
  final InputTextViewModel viewModel;

  const StyledInputField._({Key? key, required this.viewModel}) : super(key: key);

  static Widget instantiate({required InputTextViewModel viewModel}) {
    return StyledInputField._(viewModel: viewModel);
  }

  @override
  StyledInputFieldState createState() => StyledInputFieldState();
}

class StyledInputFieldState extends State<StyledInputField> {
  late bool obscureText;
  String? errorMsg;

  @override
  void initState() {
    super.initState();
    obscureText = widget.viewModel.password;
    widget.viewModel.controller.addListener(validateInput);
  }

  @override
  void dispose() {
    widget.viewModel.controller.removeListener(validateInput);
    super.dispose();
  }

  void validateInput() {
    final errorText = widget.viewModel.validator?.call(widget.viewModel.controller.text);
    setState(() => errorMsg = errorText);
  }

  void togglePasswordVisibility() {
    setState(() => obscureText = !obscureText);
  }

  @override
  Widget build(BuildContext context) {
    // Tokens visuais (HP)
    const double _radius = 10;
    const EdgeInsets _contentPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 14);

    final bool enabled = widget.viewModel.isEnabled;
    final Color baseBorder = enabled ? azulEscuro : cinzaClaro;
    final Color fill = enabled ? brancoPadrao : cinzaClaro.withOpacity(0.5);
    final Color textColor = azulEscuro;

    final suffix = widget.viewModel.password
        ? IconButton(
      onPressed: togglePasswordVisibility,
      icon: Icon(
        obscureText ? Icons.visibility : Icons.visibility_off,
        color: textColor,
      ),
    )
        : (widget.viewModel.suffixIcon != null
        ? IconTheme(
      data: IconThemeData(color: textColor),
      child: widget.viewModel.suffixIcon!,
    )
        : null);

    final InputDecoration decoration = InputDecoration(
      contentPadding: _contentPadding,
      filled: true,
      fillColor: fill,

      // Label / Placeholder
      labelText: widget.viewModel.placeholder.isNotEmpty ? widget.viewModel.placeholder : null,
      labelStyle: const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        color: azulEscuro,
      ),
      floatingLabelStyle: const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        color: marromClaro, // dourado quando focado
      ),
      hintStyle: const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        color: azulEscuro,
      ),

      // Ícones
      suffixIcon: suffix,

      // Bordas HP
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_radius),
        borderSide: BorderSide(color: baseBorder, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_radius),
        borderSide: const BorderSide(color: azulEscuro, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_radius),
        borderSide: const BorderSide(color: azulEscuro, width: 2.5),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_radius),
        borderSide: const BorderSide(color: cinzaClaro, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_radius),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_radius),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),

      errorText: errorMsg,
    );

    return TextFormField(
      controller: widget.viewModel.controller,
      obscureText: obscureText,
      enabled: enabled,
      decoration: decoration,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        color: azulEscuro,
      ),
      cursorColor: azulEscuro,
    );
  }
}

