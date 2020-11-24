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
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool like = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FFR Custom Switch Example'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FFRCustomSwitch(
                thumbColor: Colors.
                lable: 'Do you like this package?',
                inactiveColor: Colors.red,
                activeColor: Colors.green,
                value: like,
                onChanged: (newValue) {
                    setState(){
                        like = newValue;
                    }
                },
            );
          ],
        ),
    );
  }
}
```