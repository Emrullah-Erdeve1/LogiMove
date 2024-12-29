import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sensors_plus/sensors_plus.dart';

class StartJourneyPage extends StatefulWidget {
  @override
  _StartJourneyPageState createState() => _StartJourneyPageState();
}

class _StartJourneyPageState extends State<StartJourneyPage> {
  final databaseReference = FirebaseDatabase.instance.reference(); // Firebase DB referansı
  double _acceleration = 0.0;
  double _speed = 0.0;
  bool _isTracking = false; // Yolculuk başlatılıp başlatılmadığını takip eder

  // Hız ve ivme verilerini almak için gerekli method
  void _getSensorData() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (_isTracking) { // Yolculuk başladıysa sensör verilerini al
        // Yalnızca x ve y eksenlerini kullanarak ivme büyüklüğünü hesapla
        double acceleration = sqrt(event.x * event.x + event.y * event.y);

        setState(() {
          _acceleration = acceleration;
          _speed = acceleration; // Basit hız hesaplaması (geliştirilebilir)
        });

        writeData(_acceleration, _speed); // Firebase'e veri yaz
      }
    });
  }

  // Firebase'e veri yazma methodu
  void writeData(double acceleration, double speed) {
    databaseReference.child("sensorData").push().set({
      'acceleration': acceleration,
      'speed': speed,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  @override
  void initState() {
    super.initState();
    _getSensorData(); // Sensör dinleme işlemini başlat
  }

  // Yolculuğu durdurduktan sonra EvaluateJourneyPage sayfasına git
  void _navigateToEvaluationPage(BuildContext context) {
    Navigator.pushNamed(context, '/evaluateJourney');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yolculuğu Başlat")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('İvme: $_acceleration m/s²'),
            Text('Hız: $_speed m/s'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isTracking = !_isTracking; // Yolculuk durumunu değiştir
                });
              },
              child: Text(_isTracking ? "Yolculuğu Durdur" : "Yolculuğu Başlat"),
            ),
            if (_isTracking == false) // Yolculuk durdurulmuşsa "Yolculuğu Bitir" butonunu göster
              ElevatedButton(
                onPressed: () {
                  _navigateToEvaluationPage(context); // Sayfaya yönlendir
                },
                child: Text("Yolculuğu Bitir"),
              ),
          ],
        ),
      ),
    );
  }
}
