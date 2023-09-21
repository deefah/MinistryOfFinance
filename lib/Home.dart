import 'package:flutter/material.dart';
import 'package:mof_tanzania/Index.dart';
import 'package:mof_tanzania/LatestNews.dart';
import 'package:mof_tanzania/StrategicPlan.dart';
import 'package:mof_tanzania/Vision.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 110, 161),
        title: const Row(
          children: [
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'THE UNITED REPUBLIC OF TANZANIA',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  '           MINISTRY OF FINANCE',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(width: 10),
          ],
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: const [
          // You can add more IconButton widgets for additional actions
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 100),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 27,
            crossAxisSpacing: 20,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: _buildCard(
                  context,
                  'lib/assets/mof 1.jpg',
                  'MOF Website',
                  Index(), // Replace with your website URL
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: _buildCard(
                  context,
                  'lib/assets/NEWS2.png',
                  'Latest News',
                  LatestNews(),
                ),
              ),
              _buildCard(
                context,
                'lib/assets/maliyoun.jpg',
                'Strategic Plan',
                StrategicPlan(),
              ),
              _buildCard(
                context,
                'lib/assets/open data.jpg',
                'Open Data',
                Vision(),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            _buildDrawerItem(context, 'lib/assets/mof 1.jpg', 'Home', Index()),
            _buildDrawerItem(
                context, 'lib/assets/NEWS2.png', 'Latest News', LatestNews()),
            _buildDrawerItem(context, 'lib/assets/maliyoun.jpg',
                'Strategic Plan', StrategicPlan()),
            _buildDrawerItem(
                context, 'lib/assets/open data.jpg', 'Open Data', Vision()),
            // Add more drawer items with respective page navigation here
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    String imagePath,
    String imageName,
    dynamic pageToNavigate, // Accepts either a Widget or a URL
  ) {
    return GestureDetector(
      onTap: () async {
        if (pageToNavigate is Widget) {
          // If it's a Widget, navigate to the specified page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pageToNavigate,
            ),
          );
        } else if (pageToNavigate is String) {
          // If it's a String (URL), launch the URL
          if (await canLaunch(pageToNavigate)) {
            await launch(pageToNavigate);
          } else {
            // Handle error, e.g., if the URL is not valid
            print('Error: Could not launch URL');
          }
        }
      },
      child: Card(
        elevation: 5,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
                imagePath,
                width: 80,
                height: 80,
              ),
              SizedBox(height: 8),
              Text(
                imageName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String imagePath,
      String itemName, Widget pageToNavigate) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 50,
        height: 50,
      ),
      title: Text(
        itemName,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pageToNavigate,
          ),
        );
      },
    );
  }
}
