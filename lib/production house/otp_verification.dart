import 'package:cinebyte_network_application/production%20house/register_account.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class otp_verification extends StatefulWidget {
  otp_verification({super.key});

  @override
  State<otp_verification> createState() => _otp_verificationState();
}

class _otp_verificationState extends State<otp_verification> {
  // int? otp_num1;
  String _otp = "";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Future<void> sendOtp() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate delay
    setState(() {
      _otp = "123456"; // Replace with actual OTP generation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  "CineByte Network!",
                  style: GoogleFonts.fugazOne(
                      color: Color.fromARGB(255, 238, 193, 141),
                      textStyle: TextStyle(fontSize: 24.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Text(
                  "OTP Verification",
                  style: GoogleFonts.fugazOne(
                      color: Color.fromARGB(255, 255, 255, 255),
                      textStyle: TextStyle(fontSize: 20.0)),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 50, bottom: 50, right: 50),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       SizedBox(
              //         height: 68,
              //         width: 50,
              //         child: TextField(

              //           onChanged: (value) {
              //             if (value.length == 1) {
              //               FocusScope.of(context).nextFocus();
              //             }
              //           },
              //           style: Theme.of(context).textTheme.headlineLarge,
              //           keyboardType: TextInputType.number,
              //           textAlign: TextAlign.center,
              //           inputFormatters: [
              //             LengthLimitingTextInputFormatter(1),
              //             FilteringTextInputFormatter.digitsOnly
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 68,
              //         width: 50,
              //         child: TextField(
              //           onChanged: (value) {
              //             if (value.length == 1) {
              //               FocusScope.of(context).nextFocus();
              //             }
              //           },
              //           style: Theme.of(context).textTheme.headlineLarge,
              //           keyboardType: TextInputType.number,
              //           textAlign: TextAlign.center,
              //           inputFormatters: [
              //             LengthLimitingTextInputFormatter(1),
              //             FilteringTextInputFormatter.digitsOnly
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 68,
              //         width: 50,
              //         child: TextField(
              //           onChanged: (value) {
              //             if (value.length == 1) {
              //               FocusScope.of(context).nextFocus();
              //             }
              //           },
              //           style: Theme.of(context).textTheme.headlineLarge,
              //           keyboardType: TextInputType.number,
              //           textAlign: TextAlign.center,
              //           inputFormatters: [
              //             LengthLimitingTextInputFormatter(1),
              //             FilteringTextInputFormatter.digitsOnly
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 68,
              //         width: 50,
              //         child: TextField(
              //           onChanged: (value) {
              //             if (value.length == 1) {
              //               FocusScope.of(context).nextFocus();
              //             }
              //           },
              //           style: Theme.of(context).textTheme.headlineLarge,
              //           keyboardType: TextInputType.number,
              //           textAlign: TextAlign.center,
              //           inputFormatters: [
              //             LengthLimitingTextInputFormatter(1),
              //             FilteringTextInputFormatter.digitsOnly
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false, // Set to true for hidden characters
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    borderRadius: BorderRadius.circular(5.0),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.grey[100],
                    inactiveFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  onCompleted: (code) {
                    if (code == _otp) {
                      // OTP Validated!
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('OTP Validated!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      // Navigate to next screen or perform actions
                    } else {
                      // OTP Invalid!
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid OTP'),
                          backgroundColor: Color.fromARGB(255, 255, 0, 0),
                        ),
                      );
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      _otp = value;
                    });
                  },
                  backgroundColor: Colors.transparent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => otp_verification(),
                      ));
                    },
                    child: Text('Resend OTP',
                        style: GoogleFonts.fugazOne(color: Colors.white70))),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 200),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => register_account()));
                  },
                  child: Text(
                    'Send OTP',
                    style: GoogleFonts.fugazOne(
                        color: Color.fromARGB(255, 19, 24, 26)),
                  ),
                  style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(300, 50)),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(95, 43, 160, 223)),
                      backgroundColor: MaterialStatePropertyAll(maintextcolor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
