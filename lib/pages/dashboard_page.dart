import 'package:banking_ui_flutter/data_json/balance_json.dart';
import 'package:banking_ui_flutter/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      leading: IconButton(
        icon: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://p16-sign-useast2a.tiktokcdn.com/tos-useast2a-avt-0068-giso/c938cb6bd41aa1da74709c61f94290af~c5_100x100.jpeg?x-expires=1686582000&x-signature=FGbEH8mPL7Kt2zTY0R83fcTxRJ8%3D'),
        ),
        onPressed: () => {},
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.25,
          width: size.width,
          decoration: BoxDecoration(color: primary),
          child: Column(children: [
            Container(
              width: size.width,
              height: 110,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(balanceLists.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        width: size.width * 0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  balanceLists[index]['currency'],
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: index == 0
                                          ? white
                                          : white.withOpacity(0.5)),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  balanceLists[index]['amount'],
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: index == 0
                                          ? white
                                          : white.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              balanceLists[index]['description'],
                              style: TextStyle(
                                  fontSize: 15, color: white.withOpacity(0.5)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Expanded(
                child: Container(
              width: size.width,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Flexible(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: secondary.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Add money',
                          style: TextStyle(
                              color: white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Flexible(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: secondary.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Exchange',
                          style: TextStyle(
                              color: white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ))
          ]),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
                color: white.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 25, bottom: 40, left: 20, right: 20),
              child: Column(
                children: [
                  getAccountSection(),
                  getCardsList(),
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }

  Widget getCardsList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cards',
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: black),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        color: secondary.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(Icons.add, size: 18, color: primary),
                          Text(
                            'ADD CARD',
                            style: TextStyle(color: primary, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 10)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: secondary.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Icon(Icons.wallet, size: 24, color: primary),
                  ),
                ),
                Text(
                  'EUR * 2330',
                  style: TextStyle(
                      fontSize: 14, color: black, fontWeight: FontWeight.w500),
                ),
                Text(
                  '8 199.24 EUR',
                  style: TextStyle(
                      fontSize: 14, color: black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget getAccountSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Accounts',
        style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: black),
      ),
      SizedBox(height: 15),
      Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: black.withOpacity(0.1), blurRadius: 15, spreadRadius: 10)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: secondary.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Icon(Icons.wallet, size: 24, color: primary),
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      '40832-810-5-70000-012345',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 24,
                      color: secondary,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: secondary.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Icon(Icons.euro, size: 24, color: primary),
                      ),
                    ),
                    const SizedBox(width: 25),
                    const Text(
                      '18199.24 EUR',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 25),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: secondary.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Icon(Icons.currency_pound,
                            size: 24, color: primary),
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      '36.67 GBP',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 25),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      const SizedBox(height: 15),
      Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: black.withOpacity(0.1), blurRadius: 15, spreadRadius: 10)
          ],
        ),
      )
    ]);
  }
}
