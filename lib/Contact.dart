import 'package:flutter/material.dart';
import 'package:mof_tanzania/Index.dart';
import 'package:mof_tanzania/MOFstructure.dart';
import 'package:mof_tanzania/StrategicPlan.dart';
import 'package:mof_tanzania/StrategicPlan2.dart';
import 'package:mof_tanzania/Vision.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool isDrawerOpen = false;
  bool isAboutUsSubMenuOpen = false; // Track submenu state
  bool isMediaCenterSubMenuOpen = false;
  bool isProjectsSubMenuOpen = false;
  bool isServicesSubMenuOpen = false;
  bool isReportsSubMenuOpen = false;
  bool isAdministrationSubMenuOpen = false;

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

  void toggleAboutUsSubMenu() {
    setState(() {
      isAboutUsSubMenuOpen = !isAboutUsSubMenuOpen;
    });
  }

  void toggleMediaCenterSubMenu() {
    setState(() {
      isMediaCenterSubMenuOpen = !isMediaCenterSubMenuOpen;
    });
  }

  void toggleProjectsSubMenu() {
    setState(() {
      isProjectsSubMenuOpen = !isProjectsSubMenuOpen;
    });
  }

  void toggleServicesSubMenu() {
    setState(() {
      isServicesSubMenuOpen = !isServicesSubMenuOpen;
    });
  }

  void toggleReportsSubMenu() {
    setState(() {
      isReportsSubMenuOpen = !isReportsSubMenuOpen;
    });
  }

  void toggleAdministrationSubMenu() {
    setState(() {
      isAdministrationSubMenuOpen = !isAdministrationSubMenuOpen;
    });
  }

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
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Positioned(
                top: isDrawerOpen
                    ? 90.0
                    : 0.0, // Adjust the top margin as needed
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 60.0), // Adjust the top padding as needed
                  child: Container(
                    width: double.infinity,
                    height: 500, // Adjust the height as needed

                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 18.0), // Adjust the right padding as needed
                          child: SizedBox(
                            height: 35.0,
                            child: Text(
                              'Contact Us',
                              style: TextStyle(
                                color: Color.fromARGB(255, 15, 110, 161),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right, // Align to the left
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16.0,
                              right: 16.0), // Adjust the left padding as needed
                          child: Divider(
                            color: Color.fromARGB(255, 15, 110, 161),
                            thickness: 2,
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        Text(
                          'Postal Address:\n'
                          'The United Republic of Tanzania\n'
                          'Ministry of Finance\n'
                          'Treasury Square Building 18 Jakaya Kikwete Road\n'
                          'P.O.BOX 2802, 40468 Dodoma\n'
                          'Email Address:\n'
                          'info@hazina.go.tz\n'
                          'Phone:\n'
                          '+255 26 2160000',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
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
                  child: DrawerMenu(
                    closeDrawer,
                    toggleAboutUsSubMenu,
                    isAboutUsSubMenuOpen,
                    toggleMediaCenterSubMenu, // Provide the toggleMediaCenterSubMenu function
                    isMediaCenterSubMenuOpen,
                    toggleProjectsSubMenu,
                    isProjectsSubMenuOpen,
                    toggleServicesSubMenu,
                    isServicesSubMenuOpen,
                    toggleReportsSubMenu,
                    isReportsSubMenuOpen,
                    toggleAdministrationSubMenu,
                    isAdministrationSubMenuOpen,
                  ), // Pass closeDrawer and submenu state
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
  final VoidCallback toggleAboutUsSubMenu;
  final bool isAboutUsSubMenuOpen;

  final VoidCallback toggleMediaCenterSubMenu;
  final bool isMediaCenterSubMenuOpen;

  final VoidCallback toggleProjectsSubMenu;
  final bool isProjectsSubMenuOpen;

  final VoidCallback toggleServicesSubMenu;
  final bool isServicesSubMenuOpen;

  final VoidCallback toggleReportsSubMenu;
  final bool isReportsSubMenuOpen;

  final VoidCallback toggleAdministrationSubMenu;
  final bool isAdministrationSubMenuOpen;

  DrawerMenu(
    this.closeDrawer,
    this.toggleAboutUsSubMenu,
    this.isAboutUsSubMenuOpen,
    this.toggleMediaCenterSubMenu,
    this.isMediaCenterSubMenuOpen,
    this.toggleProjectsSubMenu, // Provide the toggleProjectsSubMenu function
    this.isProjectsSubMenuOpen,
    this.toggleServicesSubMenu,
    this.isServicesSubMenuOpen,
    this.toggleReportsSubMenu,
    this.isReportsSubMenuOpen,
    this.toggleAdministrationSubMenu,
    this.isAdministrationSubMenuOpen,
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context); // Close the submenu
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Index(),
                ));
            closeDrawer(); // Close the drawer
            // Handle the Home menu item tap
            // You can navigate or perform other actions here
          },
        ),
        ExpansionTile(
          title: const Text('About Us'),
          trailing: isAboutUsSubMenuOpen
              ? const IconTheme(
                  data: IconThemeData(size: 15.0), // Adjust the size as needed
                  child: Icon(Icons.remove),
                )
              : const IconTheme(
                  data: IconThemeData(size: 15.0), // Adjust the size as needed
                  child: Icon(Icons.add),
                ),
          onExpansionChanged: (value) {
            toggleAboutUsSubMenu(); // Toggle the submenu
          },
          children: [
            ListTile(
              title: const Text('Vision and Mission'),
              onTap: () {
                Navigator.pop(context); // Close the submenu
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Vision(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Roles and Values'),
              onTap: () {
                Navigator.pop(context); // Close the submenu
                // Handle 'Roles and Values' tap
              },
            ),
            ExpansionTile(
              title: const Text('Administration'),
              trailing: isAdministrationSubMenuOpen
                  ? const IconTheme(
                      data: IconThemeData(
                          size: 15.0), // Adjust the size as needed
                      child: Icon(Icons.remove),
                    )
                  : const IconTheme(
                      data: IconThemeData(
                          size: 15.0), // Adjust the size as needed
                      child: Icon(Icons.add),
                    ),
              onExpansionChanged: (value) {
                toggleAdministrationSubMenu(); // Toggle the submenu
              },
              children: [
                ListTile(
                  title: const Text('MOF Structure'),
                  onTap: () {
                    Navigator.pop(context); // Close the submenu
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MOFstructure(),
                        ));
                  },
                ),
                ListTile(
                  title: const Text('Minister and Management Team'),
                  onTap: () {
                    Navigator.pop(context); // Close the submenu
                    // Handle 'Minister and Management Team' tap
                  },
                ),
                ListTile(
                  title: const Text('Previous Ministers'),
                  onTap: () {
                    Navigator.pop(context); // Close the submenu
                    // Handle 'Previous Ministers' tap
                  },
                ),
                ListTile(
                  title: const Text('Divisions'),
                  onTap: () {
                    Navigator.pop(context); // Close the submenu
                    // Handle 'Divisions' tap
                  },
                ),
                ListTile(
                  title: const Text('Units'),
                  onTap: () {
                    Navigator.pop(context); // Close the submenu
                    // Handle 'Units' tap
                  },
                ),
                ListTile(
                  title: const Text('Subsidiary Institutions'),
                  onTap: () {
                    Navigator.pop(context); // Close the submenu
                    // Handle 'Subsidiary Institutions' tap
                  },
                ),
              ],
            ),
            ListTile(
              title: const Text('MOF Strategic Plan'),
              onTap: () {
                Navigator.pop(context); // Close the submenu
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StrategicPlan(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Client Service Charter'),
              onTap: () {
                Navigator.pop(context); // Close the submenu
                // Handle 'Client Service Charter' tap
              },
            ),
            ListTile(
              title: const Text('Historical Background'),
              onTap: () {
                Navigator.pop(context); // Close the submenu
                // Handle 'Historical Background' tap
              },
            ),
          ],
        ),
        ListTile(
          title: const Text('Publications'),
          onTap: () {
            closeDrawer(); // Close the drawer
            // Handle the Publications menu item tap
            // You can navigate or perform other actions here
          },
        ),
        ExpansionTile(
          title: const Text('Media Center'),
          trailing: isMediaCenterSubMenuOpen
              ? const IconTheme(
                  data: IconThemeData(size: 15.0),
                  child: Icon(Icons.remove),
                )
              : const IconTheme(
                  data: IconThemeData(size: 15.0),
                  child: Icon(Icons.add),
                ),
          onExpansionChanged: (value) {
            toggleMediaCenterSubMenu(); // Toggle the submenu
          },
          children: [
            ListTile(
              title: const Text('News'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'News' tap
              },
            ),
            ListTile(
              title: const Text('Press Releases'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Press Releases' tap
              },
            ),
            ListTile(
              title: const Text('Speeches'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Speeches' tap
              },
            ),
            ListTile(
              title: const Text('Announcement'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Announcement' tap
              },
            ),
            ListTile(
              title: const Text('Events'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Events' tap
              },
            ),
            ListTile(
              title: const Text('Photo Gallery'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Photo Gallery' tap
              },
            ),
            ListTile(
              title: const Text('Video Gallery'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Video Gallery' tap
              },
            ),
          ],
        ),
        ExpansionTile(
          // Add this ExpansionTile for "Projects"
          title: const Text('Projects'),
          trailing: isProjectsSubMenuOpen
              ? const IconTheme(
                  data: IconThemeData(size: 15.0),
                  child: Icon(Icons.remove),
                )
              : const IconTheme(
                  data: IconThemeData(size: 15.0),
                  child: Icon(Icons.add),
                ),
          onExpansionChanged: (value) {
            toggleProjectsSubMenu();
          },
          children: [
            ListTile(
              title: const Text('National Flagship Project'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'National Flagship Project' tap
              },
            ),
            ListTile(
              title: const Text('MOF Projects and Programs'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'MOF Projects and Programs' tap
              },
            ),
            // Add more submenu items for Projects
          ],
        ),
        ExpansionTile(
          title: const Text('Services'),
          trailing: isServicesSubMenuOpen
              ? const IconTheme(
                  data: IconThemeData(size: 15.0),
                  child: Icon(Icons.remove),
                )
              : const IconTheme(
                  data: IconThemeData(size: 15.0),
                  child: Icon(Icons.add),
                ),
          onExpansionChanged: (value) {
            toggleServicesSubMenu();
          },
          children: [
            ListTile(
              title: const Text('Prepare National Budget'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Prepare National Budget' tap
              },
            ),
            ListTile(
              title: const Text('Prepare National Plans'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Prepare National Plans' tap
              },
            ),
            ListTile(
              title: const Text('Monitor Implementation of Plans'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Monitor Implementation of Plans' tap
              },
            ),
            ListTile(
              title: const Text('Fiscal Policies Management'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Fiscal Policies Management' tap
              },
            ),
            ListTile(
              title: const Text('Financial Information System Management'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Financial Information System Management' tap
              },
            ),
            ListTile(
              title: const Text('Government Assets Management'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Government Assets Management' tap
              },
            ),
            ListTile(
              title: const Text('Government Payment System Management'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Government Payment System Management' tap
              },
            ),
            ListTile(
              title: const Text('Government Internal Auditing'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Government Internal Auditing' tap
              },
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('Reports'),
          trailing: isReportsSubMenuOpen
              ? const IconTheme(
                  data: IconThemeData(size: 15.0),
                  child: Icon(Icons.remove),
                )
              : const IconTheme(
                  data: IconThemeData(size: 15.0),
                  child: Icon(Icons.add),
                ),
          onExpansionChanged: (value) {
            toggleReportsSubMenu();
          },
          children: [
            ListTile(
              title: const Text('Summary of Uploaded Contracts'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Summary of Uploaded Contracts' tap
              },
            ),
            ListTile(
              title: const Text('Contract 1 '),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 1 - Contract 8' tap
              },
            ),
            ListTile(
              title: const Text('Contract 2 '),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 1 - Contract 8' tap
              },
            ),
            ListTile(
              title: const Text('Contract 3 '),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 1 - Contract 8' tap
              },
            ),
            ListTile(
              title: const Text('Contract 4 '),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 1 - Contract 8' tap
              },
            ),
            ListTile(
              title: const Text('Contract 5 '),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 1 - Contract 8' tap
              },
            ),
            ListTile(
              title: const Text('Contract 6 '),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 1 - Contract 8' tap
              },
            ),
            ListTile(
              title: const Text('Contract 7 '),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 1 - Contract 8' tap
              },
            ),
            ListTile(
              title: const Text('Contract 8 '),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 1 - Contract 8' tap
              },
            ),
            ListTile(
              title: const Text('Contract 8.1'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 8.1' tap
              },
            ),
            ListTile(
              title: const Text('Contract 8.0.3'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 8.0.3' tap
              },
            ),
            ListTile(
              title: const Text('Contract 8.0.4'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 8.0.4' tap
              },
            ),
            ListTile(
              title: const Text('Contract 8.2'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 8.2' tap
              },
            ),
            ListTile(
              title: const Text('Contract 9'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 9' tap
              },
            ),
            ListTile(
              title: const Text('Contract 10'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Contract 10' tap
              },
            ),
            ListTile(
              title: const Text('Zanzibar Contracts'),
              onTap: () {
                Navigator.pop(context);
                // Handle 'Zanzibar Contracts' tap
              },
            ),
          ],
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
          title: const Text('Staff Mail'),
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
