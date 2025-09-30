import 'package:flutter/material.dart';
import 'card_detail.dart';
import 'recommendation.dart';
import 'package:dermaapp/pages/analysis/scan_condition.dart';
import 'package:dermaapp/pages/products/product_home.dart';
import 'package:dermaapp/pages/products/scan_product.dart';
import 'package:dermaapp/pages/color/color_detail.dart';
import 'package:dermaapp/pages/color/color.dart';
import 'package:dermaapp/pages/color/tone_detail.dart';
import 'package:dermaapp/pages/routines/routines_form.dart';
import 'package:dermaapp/pages/routines/routines_schedule.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    int _selectedIndex = 0;

    // Daftar halaman sesuai index
    final List<Widget> _pages = [Home(), ScanCondition(), ProductHome()];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.color_lens), label: 'Color'),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('images/logo_nouri.png', height: 40),
                IconButton(
                  icon: Icon(Icons.person, size: 36),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              child: Image.asset(
                'images/iklan.png',
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: screenHeight * 0.6,
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: Text(
                  'Konten bagian bawah',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
