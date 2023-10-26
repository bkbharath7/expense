// import 'dart:convert';
import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'function.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class Expense extends StatelessWidget {
  Expense({
    super.key,
  });

  String selecteditem = "Food";
  var items = ["Shopping", "Food", "Travel"];

  String selecedway = "Wallet";
  var ways = ["Wallet", "Gpay", "PayTM"];

  TextEditingController moneycontroller = TextEditingController();
  TextEditingController discriptioncontroller = TextEditingController();

  bool isswitched = false;

  @override
  Widget build(BuildContext context) {
    var transactionhistory = {};
    final prov = Provider.of<Functions>(context);
    void addexpense() {
      int add = int.parse(moneycontroller.text);
      prov.substraction(add);
    }

    void expensehistory() async {
      int expensemoney = int.parse(moneycontroller.text);
      String expensedis = discriptioncontroller.text;
      transactionhistory['Category'] = prov.selecteditem;
      transactionhistory['amount'] = expensemoney;
      transactionhistory['discription'] = expensedis;
      transactionhistory['type'] = 'expense';
      transactionhistory['time'] = DateFormat.jm().format(DateTime.now());
      var newlist = jsonEncode(transactionhistory);
      prov.transactions.add(newlist);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList("Historylist", prov.transactions);
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 253, 60, 74),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 253, 60, 74),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Expense",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
             const   SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const  Text( 
                      "How Much?",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                    TextField(
                      cursorColor: Colors.white,
                      showCursor: true,
                      style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      keyboardType: TextInputType.number,
                      controller: moneycontroller,
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: Colors.white,
                            size: 55,
                          ),
                          hintText: "0",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Container(
                height: 572.700,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                   const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 70,
                      width: 370,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:const Color.fromARGB(255, 221, 219, 219)),
                          borderRadius: BorderRadius.circular(20)),
                      child: DropdownButtonFormField(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 35,
                        ),
                        alignment: AlignmentDirectional.center,
                        value: prov.selecteditem,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text(
                                items,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                                selectionColor: Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          prov.operator3(newValue);
                          // setState(() {
                          //   selecteditem = newValue!;
                          // });
                        },
                      ),
                    ),
                  const  SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 370,
                      height: 70,
                      padding: const EdgeInsets.only(left: 25, top: 10),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color:const Color.fromARGB(255, 234, 237, 240)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        controller: discriptioncontroller,
                        cursorColor: Colors.black,
                        style: const  TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Description',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 150, 147, 147),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                 const   SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 70,
                      width: 370,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:const Color.fromARGB(255, 221, 219, 219)),
                          borderRadius: BorderRadius.circular(20)),
                      child: DropdownButtonFormField(
                        icon: const Padding(
                          padding:  EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 35,
                          ),
                        ),
                        alignment: AlignmentDirectional.center,
                        value: selecedway,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        items: ways.map((String ways) {
                          return DropdownMenuItem(
                            value: ways,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                ways,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                                selectionColor: Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newNum) {
                          // setState(() {
                          //   selecedway = newNum!;
                          // });
                        },
                      ),
                    ),
                 const   SizedBox(
                      height: 20,
                    ),
                    DottedBorder(
                      color:  const Color.fromARGB(255, 235, 235, 235),
                      strokeWidth: 2,
                      dashPattern:  [
                        5,
                        5,
                      ],
                      child: Container(
                        height: 70,
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.paperclip,
                              size: 32,
                              color: Color.fromARGB(255, 190, 190, 190),
                            ),
                            Text(
                              "  Add attachment ",
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color:
                                      const Color.fromARGB(255, 190, 190, 190)),
                            ),
                          ],
                        ),
                      ),
                    ),
                   const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                     const   Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Repeat",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text("Repeat Transactions"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Switch(
                            value: prov.isswitched,
                            onChanged: (value) {
                              prov.operator1(value);
                            },
                          ),
                        )
                      ],
                    ),
                  const  SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        addexpense();
                        expensehistory();
                        moneycontroller.clear();
                        discriptioncontroller.clear();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Homepage(),
                            ));
                      },
                      child: Container(
                        height: 70,
                        width: 370,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(20)),
                        child:const Center(
                            child:  Text(
                          "Continue",
                          style:  TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
