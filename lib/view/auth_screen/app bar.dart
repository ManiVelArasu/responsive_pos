import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromRGBO(20, 52, 82, 1.0),
      title: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          bool isDesktop = Platform.isWindows;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo and company name
              Container(
                height: isDesktop ? size.height * 0.08 : size.height * 0.04,
                width: isDesktop ? size.height * 0.08 : size.height * 0.04,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/appLogo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Cananda Tools Supplies(CTS Bs)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isDesktop
                          ? size.width * 0.03
                          : (size.height + size.width) / 2 * 0.03 / 2,
                    ),
                  ),
                  Text(
                    'Tuesday, 23 January 2024, 12:00:00',
                    style: TextStyle(
                      color: Colors.white,

                      fontSize: isDesktop
                          ? size.width * 0.02
                          : (size.height + size.width) / 2 * 0.02 / 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
               SizedBox(width: size.width * 0.01),
              Row(
                children: [
                  const Icon(Icons.person, color: Colors.white),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isDesktop
                          ? size.width * 0.03
                          : (size.height + size.width) / 2 * 0.03 / 2,
                    ),
                  ),
                ],
              ),
              // Responsive Search bar
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.grey),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.lock, color: Colors.white),
                onPressed: () {
                  // Handle lock icon functionality
                },
              ),
            ],
          );
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          onPressed: () {
            // Handle settings icon functionality
          },
        ),
        Text(
          'Hi Arun',
          style: TextStyle(
            color: Colors.white,
            fontSize: (size.height + size.width) / 2 * 0.03 / 2,
          ),
        ),
         SizedBox(width: size.width * 0.01),
        const Icon(Icons.person, color: Colors.white),
      ],
    );
  }
}
