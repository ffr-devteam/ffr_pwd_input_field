# ffr_pwd_input_field

Password Input Field Package created with flutter.

The source code is **100% Dart and Flutter**, and all necessary files are located in the [/lib](https://github.com/ffr-devteam/ffr_pwd_input_field/tree/main/lib) folder

## Installation 

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
ffr_pwd_input_field: <latest_version>
```

Import in your project:
```dart
import 'package:ffr_pwd_input_field/ffr_pwd_input_field.dart';
```

## Basic Ussage

```dart
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FocusNode _testNode = FocusNode();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _testKey = GlobalKey<FormFieldState<String>>();
  bool isError = false;
  String text = '';

  @override
  void dispose() {
    _testNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState.validate()) {
      if (isError == false) {
        setState(() {
          text = _testKey.currentState.value;
        });
        _testKey.currentState.reset();
      } else {
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text('A value must be entered')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: FFRPwdInputField(
                      autofocus: true,
                      focusNode: _testNode,
                      onFieldSubmitted: (term) {
                        _testNode.unfocus();
                      },
                      hintText: 'I am a hint',
                      backgroundColor: Colors.lightGreen,
                      icon: Icon(Icons.lock),
                      fieldKey: _testKey,
                      isError: isError,
                      validate: (String newValue) {
                        if (newValue.isEmpty) {
                          setState(() {
                            isError = true;
                          });
                        } else {
                          setState(() {
                            isError = false;
                          });
                        }
                      },
                      textStyle: TextStyle(color: Colors.black, fontSize: 20),
                      errorColor: Colors.red,
                      hidePwd: Icon(Icons.visibility_off),
                      showPwd: Icon(Icons.visibility),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _saveForm,
                    child: Text('Press me'),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            text == '' ? Container() : Text(text),
          ],
        ),
      ),
    );
  }
}
```