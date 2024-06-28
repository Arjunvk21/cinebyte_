import 'package:cinebyte_network_application/firebase/rentalBookedService.dart';
import 'package:cinebyte_network_application/model/rentalBookedModel.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class rental_services_detail_page extends StatefulWidget {
  DocumentSnapshot? rentDetails;

  rental_services_detail_page({super.key, this.rentDetails});

  @override
  State<rental_services_detail_page> createState() =>
      _rental_services_detail_pageState();
}

class _rental_services_detail_pageState
    extends State<rental_services_detail_page> {
  DateTime? datetime = DateTime.now();
  int _quantity = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController dateTimeCOntroller = TextEditingController();
    double width = MediaQuery.of(context).size.width * 0.9;

    double height = MediaQuery.of(context).size.height * 0.7;
    incrementQuantity() {
      setState(() {
        _quantity++;
      });
    }

    decrementQuantity() {
      setState(() {
        _quantity--;
      });
    }

    Future<void> selectedDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != datetime) {
        setState(() {
          datetime = picked;
        });
      }
    }

    // void showdatepicker() {
    //   showDatePicker(
    //           context: context,
    //           firstDate: DateTime.now(),
    //           lastDate: DateTime(2050))
    //       .then((value) => setState(() {
    //             datetime = value!;
    //           }));
    // }

    dateTimeCOntroller.text = "${datetime!.toLocal()}".split(' ')[0];
    return Scaffold(
      appBar:  Custom_appbar_real(title: 'Rental services'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 50, right: 50),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  hintText: 'Search',
                  hintStyle: GoogleFonts.fugazOne(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(),
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 234, 210, 178),
            ),
            width: width,
            height: height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.rentDetails?['productName'],
                    style: GoogleFonts.fugazOne(
                      color: const Color.fromARGB(255, 46, 53, 62),
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(widget.rentDetails?['productImage']),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      widget.rentDetails?['productDecription'],
                      style: GoogleFonts.fugazOne(
                        color: const Color.fromARGB(255, 46, 53, 62),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        widget.rentDetails?['productratePerDay'],
                        style: GoogleFonts.fugazOne(
                          color: const Color.fromARGB(255, 46, 53, 62),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    IconButton(
                        onPressed: () {
                          incrementQuantity();
                        },
                        icon: const Icon(Icons.add)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        '$_quantity',
                        style: GoogleFonts.fugazOne(
                          color: const Color.fromARGB(255, 46, 53, 62),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          decrementQuantity();
                        },
                        icon: const Icon(Icons.minimize))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    children: [
                      Text(
                        datetime == null
                            ? 'No Date Selected'
                            : 'Selected Date : ${datetime!.toLocal()}'
                                .split(' ')[0],
                        style: GoogleFonts.fugazOne(
                          color: const Color.fromARGB(255, 46, 53, 62),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: TextFormField(
                    controller: dateTimeCOntroller,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              selectedDate(context);
                            },
                            icon: const Icon(Icons.calendar_month))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff2D3037)),
                            minimumSize: MaterialStatePropertyAll(
                              Size(200, 40),
                            )),
                        onPressed: () {
                          bookProduct();
                        },
                        child: Text(
                          "Book",
                          style: GoogleFonts.fugazOne(
                              color: Colors.white, fontSize: 14),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  bookProduct() {
    try {
      String userid = FirebaseAuth.instance.currentUser!.uid;
      var bookedProductId = Uuid().v1();
      rentalBookedModel rentmap = rentalBookedModel(
          rentalBookedId: bookedProductId,
          bookedUserId: userid,
          rentalProductId: widget.rentDetails?['rentalProductId'],
          rentalBookedDate: datetime,
          rentalProductQuantity: _quantity.toString());
      rentalBookedService rentService = rentalBookedService();
      rentService.createRentalBooked(rentmap);
      Fluttertoast.showToast(
        msg: "Product Booked Succesfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.of(context).pop();
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Booking Unsuccesfull",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
