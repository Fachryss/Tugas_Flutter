// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Image Widget"),
//         ),
//         body: Center(
//           child: Container(
//             width: 350,
//             height: 500,
//             color: Colors.amber,
//             child: const Image(
//               image: NetworkImage(
//                   "https://images.pexels.com/photos/3680219/pexels-photo-3680219.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(const LaLIGA());
}

class LaLIGA extends StatelessWidget {
  const LaLIGA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaLIGA'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'BERITA TERBARU'),
            Tab(text: 'PERTANDINGAN HARI INI'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const BeritaTerbaruTab(),
          PertandinganHariIniTab(),
        ],
      ),
    );
  }
}

class BeritaTerbaruTab extends StatelessWidget {
  const BeritaTerbaruTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Image(
                  image: AssetImage('assets/images/penaldo.png'),
                  width: 400,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Costa Mendekat Ke Palmeiras',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  color: Colors.purple,
                  child: Text(
                    'Transfer',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16),
                news(
                    'https://images.app.goo.gl/Q9ZXHvbKf1qz5vtw6',
                    'Pique Bilang Wasit Untungkan Madrid, Koeman Tepok Jidat',
                    'Barcelona Feb 13, 2021'),
                news(
                    'https://via.placeholder.com/300',
                    'Pique Bilang Wasit Untungkan Madrid, Koeman Tepok Jidat',
                    'Barcelona Feb 13, 2021'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget news(String imageUrl, String title, String subtitle) {
    return Card(
      child: ListTile(
        leading:
            Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

class PertandinganHariIniTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Belum ada pertandingan hari ini'),
    );
  }
}
