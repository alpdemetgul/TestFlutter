// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';

// class Microphone extends StatefulWidget {
//   const Microphone({super.key});

//   @override
//   State<Microphone> createState() => _MicrophoneState();
// }

// class _MicrophoneState extends State<Microphone> {
//   FlutterSoundRecorder _myRecorder = FlutterSoundRecorder();
//   bool _mRecorderIsInited = false;

//   @override
//   void initState() {
//     super.initState();
//     _myRecorder.openAudioSession().then((value) {
//       setState(() {
//         _mRecorderIsInited = true;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _myRecorder.closeRecorder();
//     // _myRecorder = null;
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Text('Microphone'),
//             ElevatedButton(onPressed: record, child: Text('Record')),
//             ElevatedButton(onPressed: stopRecorder, child: Text('Stop')),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> record() async {
//     await _myRecorder.startRecorder(
//       toFile: '/sdcard/download/recorded.aac',
//       codec: Codec.aacADTS,
//     );
//   }

//   Future<void> stopRecorder() async {
//     await _myRecorder.stopRecorder();
//   }
// }
