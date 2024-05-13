import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  static const List<Widget> WidgetOptions = <Widget>[
    Text('Dashboard Page'),
    Text('Transaksi Page'),
    Text('Pesanan Page'),
    Text('Profil Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToPage(String pageName) {
    switch (pageName) {
      case 'Dashboard':
        // Ganti 'DashboardPage' dengan nama halaman Dashboard Anda
        Navigator.pushNamed(context, '/dashboard');
        break;
      case 'Transaksi':
        // Ganti 'TransaksiPage' dengan nama halaman Transaksi Anda
        Navigator.pushNamed(context, '/transaksi');
        break;
      case 'Pesanan':
        // Ganti 'PesananPage' dengan nama halaman Pesanan Anda
        Navigator.pushNamed(context, '/pesanan');
        break;
      case 'Profil':
        // Ganti 'ProfilPage' dengan nama halaman Profil Anda
        Navigator.pushNamed(context, '/profil');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Dashboard',
              textAlign: TextAlign.center,
            ),
            Text(
              'Welcome to Surya Abadi net',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontFamily: 'Playball'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 100,
                alignment: Alignment.center,
                child: Text(
                  'Surya Abadi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Dashboard'),
                onTap: () {
                  _navigateToPage('Dashboard');
                },
                minLeadingWidth: 20,
              ),
              ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('Transaksi'),
                onTap: () {
                  _navigateToPage('Transaksi');
                },
                minLeadingWidth: 20,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Pesanan'),
                onTap: () {
                  _navigateToPage('Pesanan');
                },
                minLeadingWidth: 20,
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profil'),
                onTap: () {
                  _navigateToPage('Profil');
                },
                minLeadingWidth: 20,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return GridTile(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/wifi_image_$index.png', // Ganti dengan nama file gambar Anda
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle tombol "pesan sekarang" di sini
                      },
                      child: Text('Pesan Sekarang'),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
