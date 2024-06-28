import 'package:cinebyte_network_application/firebase/databasemethods.dart';
import 'package:cinebyte_network_application/firebase/rentalBookedService.dart';
import 'package:cinebyte_network_application/firebase/rentalService.dart';
import 'package:cinebyte_network_application/production%20house/rental_servies_detail_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class rental_services_home_page extends StatefulWidget {
  const rental_services_home_page({super.key});

  @override
  State<rental_services_home_page> createState() =>
      _rental_services_home_pageState();
}

class _rental_services_home_pageState extends State<rental_services_home_page> {
  rentalService _service = rentalService();
  Stream? rentalstream;
  rentalBookedService _bookedService = rentalBookedService();

  getOnTheLoad() async {
    Stream RentalStream = await DatabaseMethods().getrentaldetails();
    rentalstream = RentalStream;
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar:  Custom_appbar_real(title: 'Rental services'),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Color.fromARGB(0, 255, 255, 255),
                indicator: BoxDecoration(
                    color: Color.fromARGB(255, 234, 210, 178),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                labelColor: Color(0xff2D3037),
                unselectedLabelColor: Color.fromARGB(255, 195, 192, 192),
                tabs: [
                  App_custom_tabbar(title: 'Book Product'),
                  App_custom_tabbar(title: "Booked Products"),
                ]),
            Expanded(
              child: TabBarView(children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.white),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            hintText: 'Search',
                            hintStyle:
                                GoogleFonts.fugazOne(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(),
                            )),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder(
                          stream: _service.getAllRentalDetails(),
                          builder: (context, snapshot) {
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                final ds = snapshot.data!.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          rental_services_detail_page(
                                        rentDetails: ds,
                                      ),
                                    )),
                                    child: Container(
                                      width: width,
                                      height: 300,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 229, 206, 177),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            ds['productratePerDay'],
                                            style: GoogleFonts.fugazOne(
                                              color: const Color.fromARGB(
                                                  255, 46, 53, 62),
                                              fontSize: 18,
                                            ),
                                          ),
                                          Image.network(
                                            ds['productImage'],
                                            scale: 1,
                                          ),
                                          Text(
                                            ds['productName'],
                                            style: GoogleFonts.fugazOne(
                                              color: const Color.fromARGB(
                                                  255, 46, 53, 62),
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            ds['productDecription'],
                                            style: GoogleFonts.fugazOne(
                                              color: const Color.fromARGB(
                                                  255, 46, 53, 62),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: snapshot.data!.docs.length,
                            );
                          }),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: StreamBuilder(
                          stream: _bookedService.getAllRentalBookedDetails(),
                          builder: (context, snapshot) {
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                final ds = snapshot.data!.docs[index];
                                final productId = ds['rentalProductId'];
                                DateTime rentalBookedDate;

                                    if (ds['rentalBookedDate'] is Timestamp) {
                                      rentalBookedDate = (ds['rentalBookedDate'] as Timestamp).toDate();
                                    } else {
                                      rentalBookedDate = DateTime.parse(ds['rentalBookedDate']);
                                    }

                                    var formattedDate = DateFormat('yyyy-MM-dd').format(rentalBookedDate);
                                return FutureBuilder(
                                    future: FirebaseFirestore.instance
                                        .collection('rentals')
                                        .doc(productId)
                                        .get(),
                                    builder: (context, productSnapshot) {
                                      if (productSnapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      var productData = productSnapshot.data!
                                          .data() as Map<String, dynamic>;
                                      return Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: GestureDetector(
                                          onTap: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                rental_services_detail_page(
                                              rentDetails: ds,
                                            ),
                                          )),
                                          child: Container(
                                            width: width,
                                            height: 300,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 229, 206, 177),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  productData['productName'],
                                                  style: GoogleFonts.fugazOne(
                                                    color: const Color.fromARGB(
                                                        255, 46, 53, 62),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Image.network(
                                                  productData['productImage'],
                                                  scale: 1,
                                                ),
                                                Text(
                                                  formattedDate,
                                                  style: GoogleFonts.fugazOne(
                                                    color: const Color.fromARGB(
                                                        255, 46, 53, 62),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  ds['rentalBookedDate'],
                                                  style: GoogleFonts.fugazOne(
                                                    color: const Color.fromARGB(
                                                        255, 46, 53, 62),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Text(
                                                  'Product Quantity :${ds['rentalProductQuantity']}',
                                                  style: GoogleFonts.fugazOne(
                                                    color: const Color.fromARGB(
                                                        255, 46, 53, 62),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              itemCount: snapshot.data!.docs.length,
                            );
                          }),
                    ),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
