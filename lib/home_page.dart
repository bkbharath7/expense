import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:money_app/login.dart';
import 'package:money_app/transfer.dart';
import 'package:provider/provider.dart';
import 'expenses.dart';
import 'function.dart';
import 'graph.dart';
import 'income.dart';

// ignore: must_be_immutable
class Homepage extends StatelessWidget {
  Homepage({
    super.key,
  });

  String selectedvalue = "January";

  var items = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Functions>(context);
    prov.getdata();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            elevation: 0,
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/05.png"),
              ),
            ),
            centerTitle: true,
            title: SizedBox(
              width: 300,
              child: DropdownButtonFormField(
                iconSize: 0,
                alignment: AlignmentDirectional.center,
                value: prov.selectedvalue,
                decoration: InputDecoration(
                  prefixIcon: Image.asset("assets/images/arrow.png"),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      selectionColor: Colors.black,
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  prov.operator5(newValue);
                },
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    prov.erasedata();
                  },
                  child: const Icon(
                    Icons.notifications,
                    color: Color.fromARGB(
                      255,
                      170,
                      3,
                      248,
                    ),
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
          body: Consumer<Functions>(
            builder: (context, value, child) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: Column(
                        children: [
                          const Center(
                              child: Text(
                            "Account Balance",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          )),
                          const SizedBox(height: 2),
                          Center(
                              child: Text(
                            "\$${value.balance}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 45),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 95,
                                width: 190,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 1, 169, 107),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/income.png"))),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Income",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text("\$${value.income}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Container(
                                height: 95,
                                width: 190,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 249, 62, 72),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/expense.png"))),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Expences",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          Text("\$${value.expence}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                  child: Padding(
                        padding:   const EdgeInsets.only(left: 14),
                        child: Text(
                          "Spend Frequency",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      height: 210,
                      width: MediaQuery.of(context).size.width,
                      child: MyGraph(),
                    ),
                    TabBar(
                      splashBorderRadius: BorderRadius.zero,
                      labelColor: Colors.orange,
                      indicatorWeight: 1,
                      unselectedLabelColor:
                          const Color.fromARGB(255, 172, 159, 159),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 235, 230, 184)),
                      tabs: const [
                        Tab(
                          text: "Today",
                        ),
                        Tab(
                          text: "Week",
                        ),
                        Tab(
                          text: "Month",
                        ),
                        Tab(
                          text: "Year",
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Recent Transaction",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 233, 236, 247)),
                              child: const Text("See All"))
                        ],
                      ),
                    ),
                    ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: value.transactions.length,
                        itemBuilder: (context, index) {
                          var transactions =
                              jsonDecode(value.transactions[index]);

                          return ListTile(
                            title: Text(transactions['Category'].toString()),
                            subtitle:
                                Text(transactions['discription'].toString()),
                            leading: Image.asset(
                                'assets/images/${transactions["Category"].toString()}.jpg'),
                            trailing: Column(
                              children: [
                                transactions["type"] == "income"
                                    ? Text(
                                        '+${transactions["amount"]}',
                                        style: const TextStyle(
                                            color: Colors.green, fontSize: 18),
                                      )
                                    : Text(
                                        '-${transactions["amount"]}',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 18,
                                        ),
                                      ),
                                Text(transactions["time"])
                              ],
                            ),
                          );
                        })
                  ],
                ),
              );
            },
          ),
          floatingActionButton: FabCircularMenuPlus(
            fabCloseIcon: const Icon(
              Icons.close,
              size: 30,
              color: Colors.white,
            ),
            fabOpenIcon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
            fabColor: const Color.fromRGBO(127, 61, 255, 1),
            children: [
              InkWell(
                onTap: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Income()));
                },
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                      color: Colors.green,
                    ),
                    child: Image.asset("assets/images/icon1.png")),
              ),
              InkWell(
                onTap: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Transfer(),
                      ));
                },
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                      color: Colors.blue,
                    ),
                    child: Image.asset("assets/images/icon2.png")),
              ),
              InkWell(
                onTap: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Expense()));
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    color: Colors.red,
                  ),
                  child: Image.asset("assets/images/icon3.png"),
                ),
              ),
            ],
            alignment: Alignment.bottomCenter,
            ringColor: Colors.white.withAlpha(25),
            ringDiameter: 450.0,
            ringWidth: 190.0,
            fabSize: 65,
            fabElevation: 8.0,
            fabIconBorder: const CircleBorder(),
            animationDuration: Duration(milliseconds: 900),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.home_filled,
                      color: Colors.grey,
                      size: 35,
                    ),
                    Text("Home")
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.compare_arrows_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
                    Text("Transaction")
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.pie_chart,
                      color: Colors.grey,
                      size: 35,
                    ),
                    Text("Budjet")
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 35,
                    ),
                    Text("Profile")
                  ],
                )
              ],
            ),
          )),
    );
  }
}
