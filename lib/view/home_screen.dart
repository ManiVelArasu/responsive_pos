import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_design/Utils/routes.dart';
import 'package:responsive_design/providers/local_providers/local_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocaleProvider _localeProvider = Get.find();
  List<bool> _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: screenSize.width >= 600 ? buildAppBar() :AppBar(),
      drawer: screenSize.width < 600 ? buildDrawer() : null,
      body: Stack(
        children: [
          Container(
            height: size.height * 0.30,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/cts_logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Center(
            heightFactor: 1,
            child: Padding(
              padding: EdgeInsets.only(
                top: screenSize.height * 0.40,
                left: screenSize.width / 5,
                right: screenSize.width / 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('EXPLORE'),
      backgroundColor: Colors.blue,
      actions: [
        buildInkWell(index: 0, title: 'Discover'),
        const SizedBox(width: 10),
        buildInkWell(index: 1, title: 'Contact Us'),
        const SizedBox(width: 10),
        buildInkWell(index: 2, title: 'Sign Up', destinationScreen: AppRoutes.signupScreen),
        const SizedBox(width: 10),
        buildInkWell(index: 3, title: 'Login', destinationScreen: AppRoutes.loginScreen),
      ],
    );
  }


  Widget buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'EXPLORE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          buildDrawerItem(index: 0, title: 'Discover'),
          buildDrawerItem(index: 1, title: 'Contact Us'),
          buildDrawerItem(index: 2, title: 'Sign Up', destinationScreen: AppRoutes.signupScreen),
          buildDrawerItem(index: 3, title: 'Login', destinationScreen: AppRoutes.loginScreen),
        ],
      ),
    );
  }

  Widget buildDrawerItem({required int index, required String title, AppRoutes? destinationScreen}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: _isHovering[index] ? Colors.white : Colors.black),
      ),
      onTap: () {
        setState(() {
          _isHovering[index] = !_isHovering[index];
        });
        if (destinationScreen != null) {
          _localeProvider.navigate(destinationScreen);
        }
        Navigator.pop(context); // Close the drawer
      },
    );
  }

  Widget buildInkWell({required String title, required int index, AppRoutes? destinationScreen}) {
    return InkWell(
      onTap: () {
        setState(() {
          _isHovering[index] = !_isHovering[index];
        });
        if (destinationScreen != null) {
          _localeProvider.navigate(destinationScreen);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: _isHovering[index] ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}



