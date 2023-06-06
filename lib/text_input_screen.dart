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
  final myTextFormFieldController = TextEditingController();
  final myTextController = TextEditingController(text: '0.0');

  double userInput = 0.0;

  double textFieldVar = 0;
  String? myInitialValue = '0';
  double textFormFieldVar = 0.0;

  void _printOutputValueTextField(String value) {
    setState(() {
      textFieldVar = double.parse(value);
      print('the textFieldVar - $textFieldVar');
    });
  }

  void _printOutputValueTextFormField(String value) {
    setState(() {
      textFormFieldVar = double.parse(value);
      print('the textFormFieldVar - $textFormFieldVar');
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
    // myTextFormFieldController.clear();
    textFieldVar = 0;
    textFormFieldVar = 0.0;
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
              ('output textFieldVar - $textFieldVar'),
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
                decoration: InputDecoration(
                  hintText: 'Enter a value',
                  suffixIcon: IconButton(
                    onPressed: () {
                      myTextFormFieldController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            Text(
              ('output textFormField - $textFormFieldVar'),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: clearText,
              child: const Text('Reset to 0'),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                userInput.toString(),
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
