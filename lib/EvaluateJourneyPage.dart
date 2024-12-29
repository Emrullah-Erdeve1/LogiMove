import 'package:flutter/material.dart';
class EvaluateJourneyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yolculuk Değerlendir"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bayi ile ilgili bir şikayetiniz var mı?",
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("EVET"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("HAYIR"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Değerlendirmenizi açıklayabilir misiniz?",
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Değerlendirmenizi buraya yazın...",
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text("Yolculuğu Bitir"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
