import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center( // Tüm içeriği ortalamak için Center widget'ı kullanıldı
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Dikeyde ortalama
          crossAxisAlignment: CrossAxisAlignment.center, // Yatayda ortalama
          children: [
            // Logo
            Image.asset(
              'assets/logo.png',
              height: 120,
            ),
            SizedBox(height: 50),
            // Giriş Butonları
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[800],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/driverLogin');
                    },
                    child: Text("Sürücü Giriş"),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[800],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/dealerLogin');
                    },
                    child: Text("Bayi Giriş"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
