import 'package:cinebyte_network_application/production%20house/production_house_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpValidation extends StatefulWidget {
  const OtpValidation({Key? key}) : super(key: key);

  @override
  _OtpValidationState createState() => _OtpValidationState();
}

class _OtpValidationState extends State<OtpValidation> {
  String _otp = "";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // Simulate OTP sent to user (replace with your backend logic)
  Future<void> sendOtp() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate delay
    setState(() {
      _otp = "123456"; // Replace with actual OTP generation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              PinCodeTextField(
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
                        backgroundColor: Colors.red,
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
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => sendOtp(),
                child: const Text('Send OTP'),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => production_house_home_page(),
                      ));
                    } else {
                      null;
                    }
                  },
                  child: Text('Submit')),
              Expanded(
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    
                    child: Text(
                      '''sdbasjdbasbdsnbdsa
                asdasd
                sadscsxc
                x
                cx
                c
                xzc
                xz
                c
                xc
                xzc
                xc
                xc
                xz
                czx
                c
                xzc
                xzc
                xzcxz
                cx
                c
                xcscdsf
                dfdsfds
                f
                dfdfdsf
                dsfsdfds
                fsdfsdf
                dsad
                sadsadsadsadasd
                sad
                asd
                sad
                asd
                sad''',
                      style: TextStyle(fontSize: 50),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
