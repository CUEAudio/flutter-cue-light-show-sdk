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
        body: Column(
          children: <Widget>[
            TextButton(
              child: const Text('Fetch Theme'),
              onPressed: () async {
                try {
                  await FlutterCueLightShowSdk.fetchTheme();
                } catch (e) {
                  print(e);
                }
              },
            ),
            TextButton(
              child: const Text('Launch CUE'),
              onPressed: () async {
                try {
                  await FlutterCueLightShowSdk.launchCue();
                } catch (e) {
                  print(e);
                }
              },
            ),
            TextButton(
              child: const Text('Launch CUE V2'),
              onPressed: () async {
                try {
                  await FlutterCueLightShowSdk.launchCueV2(
                      'https://thelabs.testingdxp.com/?gameId=light-show');
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
