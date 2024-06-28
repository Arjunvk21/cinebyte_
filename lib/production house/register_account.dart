import 'package:cinebyte_network_application/firebase/_auth_service.dart';
import 'package:cinebyte_network_application/firebase/firestore.dart';
import 'package:cinebyte_network_application/model/user_model.dart';
import 'package:cinebyte_network_application/production%20house/production_house_home_page.dart';
import 'package:cinebyte_network_application/production%20house/sign_in.dart';
import 'package:cinebyte_network_application/user/bottomnav.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';

class register_account extends StatefulWidget {
  register_account({super.key});

  @override
  State<register_account> createState() => _register_accountState();
}

class _register_accountState extends State<register_account> {
  UserModel _usermodel = UserModel();
  AuthService _authservice = AuthService();
  // String? _name;
  bool _issecurepassword = true;
  String email = "", password = "";
  bool isloading = false;
  TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // Future<void> addfirebase(
  //     Map<String, dynamic> registereduserinfomap, String userid) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('Users')
  //         .doc(userid)
  //         .set(registereduserinfomap);
  //   } catch (e) {
  //     print('Error adding document: $e');
  //     throw e; // Rethrow the error so the caller can handle it
  //   }
  // }

  registration() async {
    setState(() {
      isloading = true;
    });

    _usermodel = UserModel(
        email: _emailcontroller.text,
        name: usernamecontroller.text,
        password: _passwordcontroller.text,
        experience: '',
        skill: '',
        image: '',
        userLocation: '',
        userGroup: []);

    try {
      setState(() {
        isloading = true;
      });
      final userdata = await _authservice.registerUser(_usermodel);
      if (userdata != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful')));
        Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(
              builder: (context) => const custombottomnavigationbar(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = false;
      });
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Weak password'),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xffF4D193),
          content: Text('Email is already in use',
              style: GoogleFonts.fugazOne(
                color: const Color.fromARGB(255, 46, 53, 62),
              )),
        ));
      }
    }

    // if (password != null) {
    //   try {
    //     setState(() {
    //       isloading = true;
    //     });
    //     UserCredential usercredential = await FirebaseAuth.instance
    //         .createUserWithEmailAndPassword(email: email, password: password);
    //     // ignore: use_build_context_synchronously
    //     ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text('Registration successful')));
    //     Navigator.pushReplacement(
    //         // ignore: use_build_context_synchronously
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const custombottomnavigationbar(),
    //         ));
    //     setState(() {
    //       isloading = false;
    //     });
    //     // String registered_user_id = randomString(10);
    //     // Map<String, dynamic> registereduserinfomap = {
    //     //   "name": usernamecontroller.text,
    //     //   'email': _emailcontroller.text,
    //     //   "password": _passwordcontroller.text,
    //     //   "id": registered_user_id,
    //     // };
    //     String registeredUserId = FirebaseAuth.instance.currentUser!.uid;

    //     Map<String, dynamic> registeredUserInfoMap = {
    //       "name": usernamecontroller.text,
    //       'email': _emailcontroller.text,
    //       "password": _passwordcontroller.text,
    //       "id": registeredUserId,
    //       "image": '',
    //       "skill": '',
    //       "experience": '',
    //     };
    //     await addfirebase(registeredUserInfoMap, registeredUserId);
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //       content:
    //           Text('Registration successful. User details added successfully.'),
    //     ));
    //   } on FirebaseAuthException catch (e) {
    //     setState(() {
    //       isloading = false;
    //     });
    //     if (e.code == 'weak-password') {
    //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //         content: Text('Weak password'),
    //       ));
    //     } else if (e.code == 'email-already-in-use') {
    //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //         content: Text('Email is already in use'),
    //       ));
    //     }
    //   }
    // }
  }

  String? _validateemail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid Email';
    }
    return null;
  }

  String? _validate_password(value) {
    if (value!.isEmpty) {
      return 'Enter a password';
    }
    RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Please enter a valid password';
    }
  }

  String? _validate_confirm_password(value) {
    if (value!.isEmpty) {
      return 'Enter a password';
    }
    RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Please enter a valid password';
    }
    if ((_passwordcontroller.text != _confirmpassword.text)) {
      return 'Password do not match';
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 60, right: 60),
        child: Center(
          child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Register Here',
                          style: App_custom_heading_textStyle.style),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: usernamecontroller,
                      style: GoogleFonts.fugazOne(color: maintextcolor),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid username';
                        }
                        return null;
                      },
                      // onSaved: (name) {
                      //   _name = name;
                      // },
                      decoration: InputDecoration(
                          label: Text(
                            'Username',
                            style: GoogleFonts.fugazOne(
                                color:
                                    const Color.fromARGB(142, 158, 158, 158)),
                          ),
                          prefixIcon: const Icon(Icons.account_circle_rounded,
                              color: Color.fromARGB(142, 158, 158, 158))),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      style: GoogleFonts.fugazOne(color: maintextcolor),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: _validateemail,
                      controller: _emailcontroller,
                      // onSaved: (email) {
                      //   _emailcontroller = email;
                      // },
                      decoration: InputDecoration(
                          label: Text(
                            'Email',
                            style: GoogleFonts.fugazOne(
                                color:
                                    const Color.fromARGB(142, 158, 158, 158)),
                          ),
                          prefixIcon: const Icon(Icons.email_rounded,
                              color: Color.fromARGB(142, 158, 158, 158))),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: GoogleFonts.fugazOne(color: maintextcolor),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: _validate_password,
                      onSaved: (password) {
                        _passwordcontroller = password as TextEditingController;
                      },
                      controller: _passwordcontroller,
                      obscureText: _issecurepassword,
                      decoration: InputDecoration(
                          label: Text(
                            'Password',
                            style: GoogleFonts.fugazOne(
                                color:
                                    const Color.fromARGB(142, 158, 158, 158)),
                          ),
                          prefixIcon: const Icon(Icons.lock_rounded,
                              color: Color.fromARGB(142, 158, 158, 158)),
                          suffixIcon: togglepassword()),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      style: GoogleFonts.fugazOne(color: maintextcolor),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: _validate_confirm_password,
                      controller: _confirmpassword,
                      obscureText: _issecurepassword,
                      decoration: InputDecoration(
                          label: Text(
                            'Confirm Password',
                            style: GoogleFonts.fugazOne(
                                color:
                                    const Color.fromARGB(142, 158, 158, 158)),
                          ),
                          prefixIcon: const Icon(Icons.lock_rounded,
                              color: Color.fromARGB(142, 158, 158, 158)),
                          suffixIcon: togglepassword()),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.fugazOne(
                              color: Colors.white, fontSize: 12),
                        ),
                        // const SizedBox(width: 10),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Sign_in_page(),
                              ));
                            },
                            child: Text(
                              'Login here',
                              style: GoogleFonts.fugazOne(
                                  color: maintextcolor, fontSize: 17),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(maintextcolor),
                            minimumSize: MaterialStatePropertyAll(
                              Size(width, 50),
                            )),
                        onPressed: () async {
                          setState(() {
                            isloading = true;
                          });
                          if (_formkey.currentState!.validate()) {
                            registration();
                          }
                        },
                        child: isloading
                            ? const Center(child: CircularProgressIndicator())
                            : Text(
                                "Register",
                                style: GoogleFonts.fugazOne(
                                    color:
                                        const Color.fromARGB(255, 46, 53, 62),
                                    fontSize: 18),
                              )),

                    //   ClipRRect(
                    //     borderRadius: BorderRadius.circular(10),
                    //     child: Stack(
                    //       children: [
                    //         Positioned.fill(
                    //             child: Container(
                    //           decoration: BoxDecoration(
                    //               gradient: LinearGradient(colors: [Color(0xffE7B588),
                    //               Color(0xffE5C8AE),
                    //               Color(0xffFFEFE1)])),
                    //         )),
                    //         ElevatedButton(onPressed: (){}, child: Text('Register',style: GoogleFonts.fugazOne(color:const Color.fromARGB(255, 57, 61, 68)),))
                    //       ],
                    //     ),
                    //   )
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Center(
                    //     child: Text('Or login with',
                    //         style: GoogleFonts.fugazOne(color: Colors.white))),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Center(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       IconButton(
                    //           onPressed: () {},
                    //           icon: const Icon(
                    //             Icons.mail,
                    //             color: Colors.white,
                    //           )),
                    //       IconButton(
                    //           onPressed: () {},
                    //           icon: const Icon(
                    //             Icons.facebook_rounded,
                    //             color: Colors.white,
                    //           )),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget togglepassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _issecurepassword = !_issecurepassword;
        });
      },
      icon: _issecurepassword
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}
