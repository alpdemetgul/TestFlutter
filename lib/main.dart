import 'package:flutter/material.dart';
import 'package:flutter_colarx/autofill.dart';
import 'package:flutter_colarx/biometrics.dart';
import 'package:flutter_colarx/file_uploader.dart';
import 'package:flutter_colarx/geo_location.dart';
import 'package:flutter_colarx/microphone.dart';
import 'package:flutter_colarx/orientation.dart';
import 'CameraPage.dart';
import 'package:flutter_colarx/share.dart';
import 'voice_record.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'ColarX Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.blue,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CameraApp()));
                },
                child: const Text('Camera'),
              ),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GeoLocation()));
                },
                child: const Text('GeoLocation'),
              ),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Biometrics()));
                },
                child: const Text('Remind me'),
              ),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Microphone()));
                },
                child: const Text('Microfone'),
              ),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FileUpload()));
                },
                child: const Text('File Select'),
              ),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AutoFill()));
                },
                child: const Text('AutoFill'),
              ),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrientationScreen()));
                },
                child: const Text('Orientation'),
              ),
              TextButton(
                style: flatButtonStyle,
                onPressed: null,
                child: const Text('Test'),
              ),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShareWidget()));
                },
                child: const Text('Share'),
              ),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VoiceRecordWidget()));
                },
                child: const Text('VoiceRecord'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
