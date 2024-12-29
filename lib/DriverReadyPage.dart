import 'package:flutter/material.dart';
class DriverReadyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LogiMove"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Kullanıcı Bilgileri
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Adınız: Emrullah Erdeve"),
                subtitle: Text("ID: 10100055201"),
              ),
            ),
            SizedBox(height: 20),
            // Lokasyon Bilgisi
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text("Yükleme Noktası"),
                subtitle: Text("Adres: Marşal Adnan Bulvarı"),
              ),
            ),
            SizedBox(height: 30),
            // "Sürücü Hazır" Butonu
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/startJourney');
              },
              child: Text("Sürücü Hazır"),
            ),
          ],
        ),
      ),
    );
  }
}
