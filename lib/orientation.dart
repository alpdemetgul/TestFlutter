import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrientationScreen extends StatelessWidget {
  const OrientationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Orientation'),
            ElevatedButton(
              onPressed: () {
                SystemChrome.setPreferredOrientations(
                    [DeviceOrientation.landscapeLeft]);
              },
              child: const Text(
                'Landscape Left',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                SystemChrome.setPreferredOrientations(
                    [DeviceOrientation.portraitUp]);
              },
              child: const Text(
                'Portrait Up',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
