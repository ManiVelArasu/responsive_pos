import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:responsive_design/pallete.dart';
import 'package:responsive_design/providers/home_screen_provider.dart';
import 'package:responsive_design/providers/local_providers/app_local_provider.dart';
import 'package:responsive_design/providers/local_providers/local_provider.dart';
import '../../Utils/style.dart';
import '../../widget/button_widget.dart';
import '../../widget/first_container_text.dart';
import '../../widget/reusable_text_lastcontainer.dart';
import '../../widget/right_container.dart';
import '../../widget/text_widget.dart';
import '../../widget/user_info.dart';
import 'app bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LocaleProvider _localeProvider = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double borderWidth = (height + width) / 2 * 0.001;

    List<IconTextData> dummyIconTextList = [
      IconTextData(icon: Icons.info, text: 'Additional info'),
      IconTextData(icon: Icons.lock, text: 'Department'),
      IconTextData(icon: Icons.shortcut, text: 'Shortcut'),
      IconTextData(icon: Icons.compare_arrows, text: 'Transaction'),
      IconTextData(icon: Icons.playlist_play_sharp, text: 'Hold/Resume'),
      IconTextData(icon: Icons.reset_tv_sharp, text: 'Return'),
      IconTextData(icon: Icons.print, text: 'Last Print'),
    ];

    return AppLocalProviders(
      child: (context, localProvider, snapshot) {
        return ChangeNotifierProvider(
          create: (_) => HomeScreenProvider(),
          builder: (context, provider) => Consumer<HomeScreenProvider>(
            builder: (context, provider, child) {
              Get.replace(provider);
              var screenHeight = size.height -
                  (height * 0.05 + height * 0.60 + size.height * 0.01 + 92);
              var searchContainerWidth =
                  ((MediaQuery.of(context).size.width / 5) * 2) - 10;
              return Scaffold(
                backgroundColor: Pallete.whiteColor,
                resizeToAvoidBottomInset: false,
                appBar: const CustomAppBar(),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: height * 0.05,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: width,
                            height: height * 0.60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width * 0.9,
                                  height: height * 0.60,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: width * 0.09,
                                  height: height * 0.60,
                                  child: ListView.builder(
                                    itemCount: dummyIconTextList.length,
                                    itemBuilder: (context, index) {
                                      return BuildTextFieldContainer(
                                        width: width,
                                        height: height,
                                        iconTextData: dummyIconTextList[index],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.01,
                      color: Colors.grey,

                    ),
                    Container(
                      width: size.width,
                      height: screenHeight,
                      color: Colors.grey,
                      child: Row(
                        children: [
                          ReusableContainer(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  10), // Add border radius here
                            ),
                            width: (size.width / 5) - 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenHeight / 4,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width * 0.05,
                                            height: height * 0.05,
                                            child: CircleAvatar(
                                              backgroundColor: profileBackColor,
                                            ),
                                          ),
                                          Text(
                                            'Keran berg'.i18n(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: (height * 0.065 +
                                                      size.width) /
                                                  2 *
                                                  0.030 /
                                                  2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                              width: width * 0.03,
                                              height: height * 0.05,
                                              child: Icon(
                                                Icons.phone,
                                                color: Colors.blueAccent,
                                                size:
                                                    (size.height + size.width) /
                                                        2 *
                                                        0.04 /
                                                        2,
                                              )),
                                          Icon(
                                            Icons.message,
                                            color: Colors.blue,
                                            size: (size.height + size.width) /
                                                2 *
                                                0.04 /
                                                2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                TwoTextsRow(
                                  firstText: 'Credit Limit',
                                  secondText: '\${1000}',
                                ),
                                TwoTextsRow(
                                  firstText: 'Available Credit',
                                  secondText: '\${1000}',
                                ),
                                TwoTextsRow(
                                  firstText: 'Balance',
                                  secondText: '\${1000}',
                                ),
                                TwoTextsRow(
                                  firstText: 'Aging',
                                  secondText: '_',
                                ),
                                TwoTextsRow(
                                  firstText: 'Alert',
                                  secondText: '_',
                                )
                              ],
                            ),
                          ),

                          ///<----------------------------------------------------->
                          ReusableContainer(
                              width: searchContainerWidth,


                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    10), // Add border radius here
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: (searchContainerWidth -
                                        searchContainerWidth / 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                left: 10,
                                              ),
                                              padding: const EdgeInsets.only(
                                                right: 8,
                                                top: 8,
                                                bottom: 8,
                                              ),
                                              width: ((searchContainerWidth -
                                                          searchContainerWidth /
                                                              5) -
                                                      (searchContainerWidth -
                                                              searchContainerWidth /
                                                                  5) /
                                                          10) -
                                                  10,
                                              //color: Colors.red,
                                              height: size.height*0.08,
                                              child: const TextField(
                                                decoration: InputDecoration(
                                                    hintText: 'Search',
                                                    prefixIcon:
                                                        Icon(Icons.search),
                                                    border:
                                                        OutlineInputBorder(),
                                                    contentPadding:
                                                        EdgeInsets.zero),
                                              ),
                                            ),
                                            Container(
                                              width: ((searchContainerWidth - searchContainerWidth / 5) /10)-5,
                                              height: size.height*0.030,
                                              margin: const EdgeInsets.only(right: 5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1,
                                                  )),
                                              child: const Icon(Icons.add,size: 18,),
                                            )
                                          ],
                                        ),

                                        Padding(
                                          padding:  EdgeInsets.only(left: size.height*0.008),
                                          child: Row(
                                            children: [
                                              const Text("Carry in service",textAlign: TextAlign.start,),
                                              Container(
                                                  width: size.width * 0.07,
                                                  height: size.height * 0.04,
                                                  margin: const EdgeInsets.symmetric(
                                                      horizontal: 2, vertical: 2),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                      width: borderWidth,
                                                      // Add borderColor property to IconTextData class
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(4),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "\$100",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: (height * 0.065 +
                                                              size.width) /
                                                              2 *
                                                              0.030 /
                                                              2,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: searchContainerWidth / 5,
                                    padding:  EdgeInsets.only(top: size.height*0.006),
                                    child: Column(
                                      children: [
                                        Container(
                                            width: size.width * 0.07,
                                            height: size.height * 0.09,
                                            margin:  EdgeInsets.symmetric(
                                                horizontal: size.height*0.002, vertical:size.height*0.002),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              border: Border.all(
                                                width: borderWidth,
                                                // Add borderColor property to IconTextData class
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(4),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  size: (height * 0.065 +
                                                      size.width) /
                                                      2 *
                                                      0.030 /
                                                      2,
                                                ),
                                                Text(
                                                  "Clear All",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: (height * 0.065 +
                                                        size.width) /
                                                        2 *
                                                        0.030 /
                                                        2,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Container(
                                            width: size.width * 0.07,
                                            height: size.height * 0.09,
                                            margin:  EdgeInsets.symmetric(
                                                horizontal: size.height*0.002, vertical:size.height*0.002),
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              border: Border.all(
                                                width: borderWidth,
                                                // Add borderColor property to IconTextData class
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(4),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Pay",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: (height * 0.065 +
                                                        size.width) /
                                                        2 *
                                                        0.030 /
                                                        2,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              )),

                          ///<----------------------------------------------------->
                          ReusableContainer(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            
                            width: (size.width / 5) - 10,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  10), // Add border radius here
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                 height: screenHeight / 5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal:14,vertical: 3),
                                            child: Text(
                                              'item'.i18n(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: (height * 0.065 +
                                                        size.width) /
                                                    2 *
                                                    0.030 /
                                                    2,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal:14,vertical: 3),
                                            child: Text(
                                              'weight'.i18n(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: (height * 0.065 +
                                                        size.width) /
                                                    2 *
                                                    0.030 /
                                                    2,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.03,
                                            child: Text(
                                              '100kg'.i18n(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: (height * 0.065 +
                                                        size.width) /
                                                    2 *
                                                    0.030 /
                                                    2,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                TwoTextsRow(
                                  firstText: 'Credit Limit',
                                  secondText: '\${1000}',
                                ),
                                TwoTextsRow(
                                  firstText: 'Sub Total',
                                  secondText: '\${1000}',
                                ),
                                TwoTextsRow(
                                  firstText: 'Savings',
                                  secondText: '\${1000}',
                                ),
                                TwoTextsRow(
                                  firstText: 'Shipping Charge',
                                  secondText: '\${1000}',
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal:14,vertical: 3),
                                          child: Text(
                                            'weight'.i18n(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: (height * 0.065 +
                                                  width*0.9) /
                                                  2 *
                                                  0.030 /
                                                  2,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: (height * 0.50) * 0.11,
                                          width: (width * 0.40) * 0.18,

                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                4,
                                              ),
                                              color: Colors.white),
                                          child: DropdownButton(
                                            isExpanded: true,
                                            underline: const SizedBox(),
                                            onTap: () {},
                                            value: "HtuT(13%)",
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              size:
                                                  (height + width) / 2 * 0.02,
                                            ),
                                            items: [
                                              'HST(13%)',
                                              'HtuT(13%)',
                                              'GST(15%)',
                                              'RST(13%)',
                                              'Test(80%)',
                                            ].map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(
                                                  items,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        (height * 0.065 +
                                                                size.width) /
                                                            2 *
                                                            0.030 /
                                                            2,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'weight'.i18n(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: (height * 0.065 +
                                                  width*0.9) /
                                                  2 *
                                                  0.030 /
                                                  2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          ///<----------------------------------------------------->
                          ReusableContainer(
                              width: (size.width / 5),
                              padding:  EdgeInsets.only(
                                top: size.height*0.015,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    10), // Add border radius here
                              ),
                              color: Colors.red,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: size.width * 0.09,
                                          height: size.height * 0.08,
                                          margin:  EdgeInsets.symmetric(
                                              horizontal: size.width*0.002, vertical: size.height*0.002),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: borderWidth,
                                              // Add borderColor property to IconTextData class
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.padding,
                                                size: (height * 0.065 +
                                                        size.width) /
                                                    2 *
                                                    0.030 /
                                                    2,
                                              ),
                                              Text(
                                                "data",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: (height * 0.065 +
                                                          size.width) /
                                                      2 *
                                                      0.030 /
                                                      2,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Container(
                                          width: size.width * 0.09,
                                          height: size.height * 0.08,
                                          margin:  EdgeInsets.symmetric(
                                              horizontal: size.width*0.002, vertical: size.height*0.002),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: borderWidth,
                                              // Add borderColor property to IconTextData class
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.padding,
                                                size: (height * 0.065 +
                                                        size.width) /
                                                    2 *
                                                    0.030 /
                                                    2,
                                              ),
                                              Text(
                                                "data",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: (height * 0.065 +
                                                          size.width) /
                                                      2 *
                                                      0.030 /
                                                      2,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: size.width * 0.058,
                                          height: size.height * 0.08,
                                          margin:  EdgeInsets.symmetric(
                                              horizontal: size.width*0.002, vertical: size.height*0.002),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: borderWidth,
                                              // Add borderColor property to IconTextData class
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.padding,
                                                size: (height * 0.065 +
                                                        size.width) /
                                                    2 *
                                                    0.030 /
                                                    2,
                                              ),
                                              Text(
                                                "data",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: (height * 0.065 +
                                                          size.width) /
                                                      2 *
                                                      0.030 /
                                                      2,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Container(
                                          width: size.width * 0.058,
                                          height: size.height * 0.08,
                                          margin:  EdgeInsets.symmetric(
                                              horizontal: size.width*0.002, vertical: size.height*0.002),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: borderWidth,
                                              // Add borderColor property to IconTextData class
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.padding,
                                                size: (height * 0.065 +
                                                        size.width) /
                                                    2 *
                                                    0.030 /
                                                    2,
                                              ),
                                              Text(
                                                "data",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: (height * 0.065 +
                                                          size.width) /
                                                      2 *
                                                      0.030 /
                                                      2,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Container(
                                          width: size.width * 0.058,
                                          height: size.height * 0.08,
                                          margin:  EdgeInsets.symmetric(
                                              horizontal: size.width*0.002, vertical: size.height*0.002),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: borderWidth,
                                              // Add borderColor property to IconTextData class
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.padding,
                                                size: (height * 0.065 +
                                                        size.width) /
                                                    2 *
                                                    0.030 /
                                                    2,
                                              ),
                                              Text(
                                                "data",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: (height * 0.065 +
                                                          size.width) /
                                                      2 *
                                                      0.030 /
                                                      2,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),

                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

/*Expanded(
child: Row(
children: [
Expanded(
child: Container(
color: Colors.cyan,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// First Row (Aligned to the start)
Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
Container(
color: Colors.cyanAccent,
child: Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
SizedBox(
width: ((size.height + size.width) / 2) * 0.04,
child: CircleAvatar(
backgroundColor: profileBackColor,
radius: 46,
),
),
Text(
'Keran berg'.i18n(),
style: const TextStyle(color: Colors.white),
),
],
),
),
const Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [
Icon(Icons.phone),
Icon(Icons.message),
],
),


],
),
// Second Row (Aligned to the end)

],
),
),
),
Expanded(
child: Container(
color: Colors.blue,
child: const Center(
child: Text(
'Container 2',
style: TextStyle(color: Colors.white),
),
),
),
),
Expanded(
child: Container(
color: Colors.green,
child: const Center(
child: Text(
'Container 3',
style: TextStyle(color: Colors.white),
),
),
),
),
Expanded(
child: Container(
color: Colors.orange,
child: const Center(
child: Text(
'Container 4',
style: TextStyle(color: Colors.white),
),
),
),
),
],
),
),*/
