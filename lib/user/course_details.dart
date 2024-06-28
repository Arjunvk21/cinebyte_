import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class course_details_page extends StatelessWidget {
  const course_details_page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
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
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Terms & Conditions',
                      style: GoogleFonts.fugazOne(
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 46, 53, 62),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Text(
                          textAlign: TextAlign.justify,
                          softWrap: true,
                          '''Site - Pickup - Sitepickup will be from Chattarpur, New Delhi.
                                      For Delivery - You need to book the product 2 days prior, whereas Delivery Charges is extra based on your location from our location. Varies from Rs.200-400 including both Sides. 
                                      Actual Address of the site-pickup will be mentioned on the Invoice Received after booking
                                      Documents Required & ID Verification - 
                                      A copy of Passport / 2 ID's for Residential & Personal Verification.
                                      Valid Documents - 
                                      Voter Card
                                      Driving License 
                                      Passport (No Aadhar card required)
                                      Local Residence Proof
                                      Security Deposit -
                                      We have No Cash Security Policy, instead, we will take a cheque and a valid Govt ID.
                                      We will take a Post Dated Cheque of the Replacement Value of the Product and a Valid ID. 
                                      Security deposit does not include rent. It takes care of damages, loss or mishandling (if any). Post Dated Cheque will be handed over to you as soon as you return the product (without Damage).'''),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
