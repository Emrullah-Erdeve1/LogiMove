import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'SplashScreen.dart';
import 'DriverReadyPage.dart';
import 'StartJourneyPage.dart';
import 'EvaluateJourneyPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase başlatılıyor
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LogiMove',
      initialRoute: '/', // İlk açılacak ekran
      routes: {
        '/': (context) => SplashScreen(), // Splash ekranı
        '/driverLogin': (context) => DriverReadyPage(), // Sürücü hazır ekranı
        '/startJourney': (context) => StartJourneyPage(), // Yolculuk başlatma ekranı
        '/evaluateJourney': (context) => EvaluateJourneyPage(), // Yolculuk değerlendirme ekranı
      },
    );
  }
}
