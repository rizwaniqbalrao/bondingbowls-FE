
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPinCodeField extends StatefulWidget {
  final void Function(String)? onCompleted;

  const CustomPinCodeField({Key? key, this.onCompleted}) : super(key: key);

  @override
  _CustomPinCodeFieldState createState() => _CustomPinCodeFieldState();
}

class _CustomPinCodeFieldState extends State<CustomPinCodeField> {
  final int pinLength = 6;
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(pinLength, (_) => FocusNode());
    _controllers = List.generate(pinLength, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < pinLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    if (_controllers.every((c) => c.text.isNotEmpty)) {
      final code = _controllers.map((c) => c.text).join();
      widget.onCompleted?.call(code);
    }
  }

  void _onKey(RawKeyEvent event, int index) {
    if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace) {
      if (_controllers[index].text.isEmpty && index > 0) {
        _focusNodes[index - 1].requestFocus();
        _controllers[index - 1].clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const blackColor = Color.fromARGB(255, 0, 0, 0);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pinLength, (index) {
        return Container(
          width: 40,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (event) => _onKey(event, index),
            child: TextFormField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              style: const TextStyle(fontSize: 20, color: Colors.black),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                counterText: '',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: blackColor, width: 3),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: blackColor, width: 5),
                ),
              ),
              onChanged: (value) => _onChanged(index, value),
              onTap: () {
                _controllers[index].selection = TextSelection(
                  baseOffset: 0,
                  extentOffset: _controllers[index].text.length,
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
