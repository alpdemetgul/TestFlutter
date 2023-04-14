import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colarx/autofill.dart';
import 'package:flutter_colarx/biometrics.dart';
import 'package:flutter_colarx/file_uploader.dart';
import 'package:flutter_colarx/geo_location.dart';
import 'package:flutter_colarx/login_screen.dart';
import 'package:flutter_colarx/microphone.dart';
import 'package:flutter_colarx/notification.dart';
import 'package:flutter_colarx/orientation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'CameraPage.dart';
import 'package:flutter_colarx/share.dart';
import 'voice_record.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  static const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          'This channel is used for important notifications.',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  void localNotification() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', notificationDetails,
        payload: 'item x');
  }

  void notification() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: android.smallIcon,
              ),
            ));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    notification();
  }

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
        title: Text(widget.title),
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text('Login'),
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
                          builder: (context) => const NotificationPage()));
                },
                child: const Text('Notification'),
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
