import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConversionScreen extends StatefulWidget {
  const ConversionScreen({
    super.key,
  });

  @override
  State<ConversionScreen> createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  final myTextFieldController = TextEditingController();
  final myTextFormFieldController = TextEditingController(text: '0');

  double doubleVar = 0;
  String? myInitialValue = '0';
  double inputValue = 1.0;

  void _printOutputValueTextField(String value) {
    setState(() {
      doubleVar = double.parse(value);
      print('the doubleVar - $doubleVar');
    });
  }

  void _printOutputValueTextFormField(String value) {
    setState(() {
      inputValue = double.parse(value);
      print('the doubleVar - $inputValue');
    });
  }

  @override
  dispose() {
    myTextFieldController.dispose();
    myTextFormFieldController.dispose();
    super.dispose();
  }

  void clearText() {
    myTextFieldController.clear();
    myTextFormFieldController.clear();
    doubleVar = 0;
    inputValue = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                maxLength: 6,
                onChanged: _printOutputValueTextField,
                // inputFormatter allows only numbers and .
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
                ],
                controller: myTextFieldController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  hintText: 'Enter a value',
                ),
              ),
            ),
            Text(
              ('output text - $doubleVar'),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                onChanged: _printOutputValueTextFormField,
                controller: myTextFormFieldController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  hintText: 'Enter a value',
                ),
              ),
            ),
            Text(
              ('TextFormField - $inputValue'),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: clearText,
              child: const Text('Reset to 0'),
            ),
          ],
        ),
      ),
    );
  }
}
