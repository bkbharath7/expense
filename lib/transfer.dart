import 'package:flutter/material.dart';
import 'package:money_app/home_page.dart';

class Transfer extends StatefulWidget {
  const Transfer({
    super.key,
  });

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 144, 228),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 144, 228),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Homepage())));
              setState(
                () {},
              );
            },
            icon: Icon(Icons.arrow_back)),
        title: const Padding(
          padding: EdgeInsets.only(left: 100),
          child: Text(
            'Transfer',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 300),
            child: Text(
              "How much?",
              style: TextStyle(fontSize: 20, color: Colors.white70),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: SizedBox(
              width: 410,
              height: 79,
              child: TextField(
                style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '\$0',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 62,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 132),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              width: double.infinity,
              height: 550,
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 46,
                        width: 190,
                        child: const TextField(
                          showCursor: false,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: 'Form',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Image.asset("assets/images/Transaction.png"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      height: 46,
                      width: 420,
                      child: const SizedBox(
                        height: 300,
                        child: TextField(
                          showCursor: false,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: 'Description',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.black,
                        ),
                        Text(
                          ' Add attachment',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          width: 370,
                          height: 70,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 71, 108, 189),
                              borderRadius: BorderRadius.circular(30)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
