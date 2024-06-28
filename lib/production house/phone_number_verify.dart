import 'package:cinebyte_network_application/production%20house/register_account.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:cinebyte_network_application/production%20house/otp_verification.dart';

class phone_number_verify extends StatefulWidget {
  phone_number_verify({super.key});

  @override
  State<phone_number_verify> createState() => _phone_number_verifyState();
}

class _phone_number_verifyState extends State<phone_number_verify> {
  final List user_category = ['Production House', 'Artist'];
  String? values;
  // String? _phone_number;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CineByte Network!",
                style: GoogleFonts.fugazOne(
                    color: Color.fromARGB(255, 238, 193, 141),
                    textStyle: TextStyle(fontSize: 24.0)),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: DropdownButtonFormField(
                  validator: (value) =>
                      value == null ? 'Please select a category' : null,
                  isExpanded: true,
                  icon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Color(0xff36393F),
                  ),
                  hint: Text(
                    'Select who you are?',
                    style: GoogleFonts.fugazOne(
                        color: const Color.fromARGB(255, 99, 99, 99),
                        fontSize: 20),
                  ),
                  value: values,
                  onChanged: (newvalue) {
                    setState(() {
                      values = newvalue as String?;
                    });
                  },
                  items: user_category.map((valueitem) {
                    return DropdownMenuItem(
                      value: valueitem,
                      child: Text(
                        valueitem,
                        style: GoogleFonts.fugazOne(
                          color: Color.fromARGB(255, 238, 193, 141),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => register_account(),
                    ));
                  } else {
                    null;
                  }
                },
                child: Text(
                  'Go',
                  style: GoogleFonts.fugazOne(
                      fontSize: 18, color: Color(0xff2D3037)),
                ),
                style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                    foregroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(95, 43, 160, 223)),
                    backgroundColor: MaterialStatePropertyAll(maintextcolor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
