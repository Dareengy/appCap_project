import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
  var interest;
  var total;

  //_controller1.text is Amount
  //_controller2.text is Interest Rate
  //_controller3.text is period

  void calculation() {
    final calineterestrate = (double.parse(_controller2.text) / 100 / 12) *
        int.parse(_controller3.text);
    final calinterest = calineterestrate * int.parse(_controller1.text);
    setState(() {
      interest = calinterest;
      total = int.parse(_controller1.text) + interest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        toolbarHeight: 30,
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Fix Deposit",
                      style: GoogleFonts.robotoMono(
                          fontSize: 35, color: Colors.white),
                    ),
                    Text(
                      "Calculator",
                      style: GoogleFonts.robotoMono(
                          fontSize: 35, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(43, 10, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                inputForm(
                    title: "Deposit Amount :",
                    controller: _controller1,
                    hinttext: "e.g 20000"),
                inputForm(
                    title: "Annual Interest rate(%) :",
                    controller: _controller2,
                    hinttext: "e.g 3"),
                inputForm(
                    title: "Period (in month) :",
                    controller: _controller3,
                    hinttext: "e.g 3"),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    calculation();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "CALCULATE",
                        style: GoogleFonts.robotoMono(
                            fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                interest != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Result :",
                            style: GoogleFonts.robotoMono(fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Interest: PHP " + interest.toStringAsFixed(2),
                              style: GoogleFonts.robotoMono(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Total: PHP " + total.toStringAsFixed(2),
                              style: GoogleFonts.robotoMono(fontSize: 20),
                            ),
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget inputForm(
      {required String title,
      required TextEditingController controller,
      required String hinttext}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hinttext),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
