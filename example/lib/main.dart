import 'package:flutter/material.dart';
import 'package:flutter_cue_light_show_sdk/flutter_cue_light_show_sdk.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CUE Plugin'),
        ),
        body: Center(
          child: TextButton(
            child: const Text('Launch CUE Light Show'),
            onPressed: () async {
              try {
                await FlutterCueLightShowSdk.launchCue(
                    'https://thelabs.testingdxp.com/?gameId=light-show');
              } catch (e) {
                print(e);
              }
            },
          ),
        ),
      ),
    );
  }
}
