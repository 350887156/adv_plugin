import 'package:flutter/material.dart';
import 'package:advplugin/advplugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    init();
  }
  void init() async {
    Advplugin.initMessageHandler(callback: (value){
      print(value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MaterialButton(
                child: Center(
                  child: Text('开屏广告'),
                ),
                onPressed: () async {
                  final result = await Advplugin.splashAdLoadAndShow(
                      adAppId: '1105344611', placementId: '9040714184494018');
                  print(result ? '播放成功' : '播放失败');
                },
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                child: Center(
                  child: Text('激励广告'),
                ),
                onPressed: () async {
                  final result = await Advplugin.rewardVideoShow(
                      adAppId: '1105344611', placementId: '8020744212936426');
                  print(result ? '播放成功' : '播放失败');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
