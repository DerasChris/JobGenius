import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class NotifyNewJob {
  // Instancia del plugin de notificaciones locales
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Instancia de Firebase Messaging
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Canal de notificación para Android
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.max,
    description: 'Canal para notificaciones importantes',
  );

  Future<void> initialize() async {
    // Inicializar Firebase
    await Firebase.initializeApp();

    // Solicitar permisos para iOS
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Configurar canal de notificaciones para Android
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    // Manejar notificaciones cuando la app está en segundo plano
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    // Manejar notificaciones cuando la app está en primer plano
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Obtener el token de FCM
    String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');
  }

  Future<void> _handleMessage(RemoteMessage message) async {
    if (message.notification != null) {
      print('Notification Message: ${message.notification?.title}');
      // Aquí puedes implementar la navegación o lógica específica
      // cuando el usuario toca la notificación
    }
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      await _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            icon: android.smallIcon,
          ),
          iOS: const DarwinNotificationDetails(),
        ),
      );
    }
  }

  // Método para suscribirse a un tema específico
  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  // Método para desuscribirse de un tema
  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }
}

// Ejemplo de uso en tu aplicación
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotifyNewJob _notifyNewJob = NotifyNewJob();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    await _notifyNewJob.initialize();
    // Suscribirse a un tema específico si es necesario
    await _notifyNewJob.subscribeToTopic('noticias');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Notificaciones Push Firebase')),
        body: const Center(
          child: Text('App con notificaciones push configuradas'),
        ),
      ),
    );
  }
}