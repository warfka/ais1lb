import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConditionerPage extends StatefulWidget {
  const ConditionerPage({super.key, required this.title});

  final String title;

  @override
  State<ConditionerPage> createState() => _ConditionerPageState();
}

class _ConditionerPageState extends State<ConditionerPage> {

  late final TextEditingController _textEditingController =
  TextEditingController();

  String _textForEncryption = '';

  @override
  void initState(){
    super.initState();

    _textEditingController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _textForEncryption = _textEditingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              //MaterialButton(onPressed: (){encode();}),
              Expanded(
                child: Center(
                  child: SelectableText(
                    _textEditingController.text,
                    style: const TextStyle(fontSize: 23.0),
                  ),
                ),
              ),
              TextFormField(
                controller: _textEditingController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(28),
                ],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Текст для шифрования до 28 символов',
                  suffixIcon: IconButton(
                    onPressed: (){
                      // encode;
                      _textEditingController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}