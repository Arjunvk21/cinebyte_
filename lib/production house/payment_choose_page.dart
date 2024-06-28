import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class payment_choose_page extends StatelessWidget {
  const payment_choose_page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.7;
    return Scaffold(
      appBar: Custom_appbar_real(title: 'Rental services'),
      body: Center(
        child: Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 210, 178),
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Your Order :     2000',
                          style: GoogleFonts.fugazOne(
                            color: Color.fromARGB(255, 46, 53, 62),
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 234, 210, 178),
                ),
                width: width,
                height: height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Payment method',
                        style: GoogleFonts.fugazOne(
                          decoration: TextDecoration.underline,
                          color: Color.fromARGB(255, 46, 53, 62),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: Container(
                        height: 50,
                        width: width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 210, 178),
                          boxShadow: [
                            new BoxShadow(
                              color: Color.fromARGB(157, 118, 116, 116),
                              blurRadius: 5.0,
                            ),
                          ],
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: ListTile(
                                leading: Icon(Icons.credit_card),
                                title: Text(
                                  'Debit / Credit card',
                                  style: GoogleFonts.fugazOne(
                                    color: Color.fromARGB(255, 46, 53, 62),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: Container(
                        height: 50,
                        width: width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 210, 178),
                          boxShadow: [
                            new BoxShadow(
                              color: Color.fromARGB(157, 118, 116, 116),
                              blurRadius: 5.0,
                            ),
                          ],
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: ListTile(
                                leading: Icon(Icons.credit_card),
                                title: Text(
                                  'Netbanking',
                                  style: GoogleFonts.fugazOne(
                                    color: Color.fromARGB(255, 46, 53, 62),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: Container(
                        height: 50,
                        width: width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 210, 178),
                          boxShadow: [
                            new BoxShadow(
                              color: Color.fromARGB(157, 118, 116, 116),
                              blurRadius: 5.0,
                            ),
                          ],
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: ListTile(
                                leading: Icon(Icons.credit_card),
                                title: Text(
                                  'UPI',
                                  style: GoogleFonts.fugazOne(
                                    color: Color.fromARGB(255, 46, 53, 62),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: Container(
                        height: 50,
                        width: width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 210, 178),
                          boxShadow: [
                            new BoxShadow(
                              color: Color.fromARGB(157, 118, 116, 116),
                              blurRadius: 5.0,
                            ),
                          ],
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: ListTile(
                                leading: Icon(Icons.credit_card),
                                title: Text(
                                  'Cash on delivery',
                                  style: GoogleFonts.fugazOne(
                                    color: Color.fromARGB(255, 46, 53, 62),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
