import 'package:flutter/material.dart';
import 'order_page.dart'; 
import 'login_page.dart'; 

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/logo.png', width: 40, height: 40), 
            SizedBox(width: 10), 
            Text('BJ WASIDI', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)), 
          ],
        ),
        backgroundColor: Colors.deepPurple, 
        elevation: 0, 
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple.shade300, Colors.deepPurple.shade800],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/banner_makanan.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20), 
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildMenuItem(
                    context,
                    image: 'assets/mie_ayam.png',
                    title: 'Mie Ayam',
                    price: 11000,
                  ),
                  _buildMenuItem(
                    context,
                    image: 'assets/nasi_goreng.png',
                    title: 'Nasi Goreng',
                    price: 15000,
                  ),
                  _buildMenuItem(
                    context,
                    image: 'assets/sate.png',
                    title: 'Sate Ayam',
                    price: 20000,
                  ),
                  _buildMenuItem(
                    context,
                    image: 'assets/es_teh.png',
                    title: 'Es Teh',
                    price: 5000,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Logout', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), 
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, {required String image, required String title, required int price}) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
        ),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
        subtitle: Text('Rp $price', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderPage(item: title, price: price)),
            );
          },
          child: Text('Pesan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple.shade700, 
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), 
            ),
          ),
        ),
      ),
    );
  }
}