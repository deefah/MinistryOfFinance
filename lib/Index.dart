import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Index extends StatefulWidget {
  const Index({Key? key});

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool isDrawerOpen = false;

  void openDrawer() {
    setState(() {
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 253, 253),
        // ... your other AppBar properties ...
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                if (isDrawerOpen) SizedBox(height: 200.0), // Space for the open drawer
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    onPageChanged: (index, reason) {
                      // Handle the page change event here
                    },
                  ),
                  items: [
                    Image.asset("lib/assets/wizara2.jpg"),
                    Image.asset("lib/assets/wizara3.jpg"),
                    Image.asset("lib/assets/wizara4.jpg"),
                    // Add more images as needed
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 900,
                  color: const Color.fromARGB(255, 15, 110, 161),
                  child: Column(
                    children: [
                      Container(
                        alignment:
                            Alignment.topCenter, // Align the image at the top
                        child: Image.asset(
                          "lib/assets/mwigulu.jpeg",
                          width: 300,
                          height: 600,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(
                            30.0), // Adjust padding as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              ' "Inclusive sustainable economic growth" ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24, // Adjust the font size as needed
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 184, 166, 94),
                                    offset: Offset(2, 2),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 8.0,
                            ), // Adjust the spacing between lines
                            Text(
                              'Hon. Dr. Mwigulu L. Nchemba',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 223, 195, 53),
                                  fontSize: 18, // Adjust the font size as needed
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Minister for Finance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18, // Adjust the font size as needed
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isDrawerOpen)
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  if (details.delta.dx > 0) {
                    // Swipe to the right, do nothing
                  } else if (details.delta.dx < 0) {
                    // Swipe to the left, close the drawer
                    closeDrawer();
                  }
                },
                child: Container(
                  width: 200, // Width of the drawer
                  color: Colors.white, // Color of the drawer
                  child: DrawerMenu(closeDrawer), // Pass closeDrawer method
                ),
              ),
            ),
          Align(
            alignment: Alignment.topLeft,
            child: Visibility(
              visible: !isDrawerOpen, // Hide when the menu is open
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  openDrawer(); // Open the drawer
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  final VoidCallback closeDrawer;

  DrawerMenu(this.closeDrawer);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
      
        ListTile(
       
          title: const Text('Home'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Home menu item tap
            // You can navigate or perform other actions here
          },
        ),
        ListTile(
       
          title: const Text('About Us'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Settings menu item tap
            // You can navigate or perform other actions here
          },
        ),
          ListTile(
         
          title: const Text('Publications'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Settings menu item tap
            // You can navigate or perform other actions here
          },
        ),
          ListTile(
         
          title: const Text('Media Center'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Settings menu item tap
            // You can navigate or perform other actions here
          },
        ),
          ListTile(
         
          title: const Text('Projects'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Settings menu item tap
            // You can navigate or perform other actions here
          },
        ),
          ListTile(
         
          title: const Text('Services'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Settings menu item tap
            // You can navigate or perform other actions here
          },
        ),
          ListTile(
         
          title: const Text('Reports'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Settings menu item tap
            // You can navigate or perform other actions here
          },
        ),
          ListTile(
         
          title: const Text('Contact us'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Settings menu item tap
            // You can navigate or perform other actions here
          },
        ),
          ListTile(
         
          title: const Text('FAQS'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Settings menu item tap
            // You can navigate or perform other actions here
          },
        ),
          ListTile(
         
          title: const Text('StaffMail'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Settings menu item tap
            // You can navigate or perform other actions here
          },
        ),
          ListTile(
         
          title: const Text('Salary Slip Portal'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Settings menu item tap
            // You can navigate or perform other actions here
          },
        ),
          ListTile(
        
          title: const Text('Tenders & Notices'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Settings menu item tap
            // You can navigate or perform other actions here
          },
        ),
      ],
    );
  }
}