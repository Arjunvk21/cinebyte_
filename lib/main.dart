// import 'package:cinebyte_network_application/firstpage.dart';
// import 'package:cinebyte_network_application/get_started_page.dart';
// import 'package:cinebyte_network_application/otp_verification.dart';
// import 'package:cinebyte_network_application/password_changed.dart';
// import 'package:cinebyte_network_application/phone_number_verify.dart';
// import 'package:cinebyte_network_application/production_house_home_page.dart';
// import 'package:cinebyte_network_application/production_house_menu_page.dart';
// import 'package:cinebyte_network_application/production_house_schedules_page.dart';
// import 'package:cinebyte_network_application/create_schedules_page.dart';
// import 'package:cinebyte_network_application/feedback_submitted_succesfully_page.dart';
// import 'package:cinebyte_network_application/production_house_feedback_page.dart';
// import 'package:cinebyte_network_application/production_house_script_download.dart';
// import 'package:cinebyte_network_application/production_house_scripts_page.dart';
// import 'package:cinebyte_network_application/production_house_settings_page.dart';
// import 'package:cinebyte_network_application/production_house_user_profile.dart';
// import 'package:cinebyte_network_application/scripts_approve_or_reject_page.dart';
// import 'package:cinebyte_network_application/register_account.dart';
// import 'package:cinebyte_network_application/reset_password.dart';
// import 'package:cinebyte_network_application/sample.dart';
// import 'package:cinebyte_network_application/sign_in.dart';
// import 'package:cinebyte_network_application/casting_call_clicked_page.dart';
// import 'package:cinebyte_network_application/create_casting_calls.dart';
// import 'package:cinebyte_network_application/payment_choose_page.dart';
// import 'package:cinebyte_network_application/production_house_castings_home_page.dart';
// import 'package:cinebyte_network_application/create_schedules_page.dart';
// import 'package:cinebyte_network_application/group_chat_page.dart';
// import 'package:cinebyte_network_application/groups_view_page.dart';
// import 'package:cinebyte_network_application/production_hhouse_scripts_page.dart';
// import 'package:cinebyte_network_application/production_house_castings_home_page.dart';
// import 'package:cinebyte_network_application/production_house_home_page.dart';
// import 'package:cinebyte_network_application/production_house_scripts_page.dart';
// import 'package:cinebyte_network_application/rental%20_sevice_terms_and_conditions.dart';
// import 'package:cinebyte_network_application/rental_services_home_page.dart';
// import 'package:cinebyte_network_application/rental_servies_detail_page.dart';
// import 'package:cinebyte_network_application/scripts_approve_or_reject_page.dart';

import 'package:cinebyte_network_application/business_logic/firebase_options.dart';
import 'package:cinebyte_network_application/production%20house/firstpage.dart';
import 'package:cinebyte_network_application/production%20house/production_house_home_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_schedules_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_settings_page.dart';
import 'package:cinebyte_network_application/production%20house/register_account.dart';
import 'package:cinebyte_network_application/production%20house/sign_in.dart';
// import 'package:cinebyte_network_application/production%20house/firstpage.dart';
// import 'package:cinebyte_network_application/production%20house/get_started_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_home_page.dart';
import 'package:cinebyte_network_application/user/bottomnav.dart';
import 'package:cinebyte_network_application/user/gallery_page.dart';
import 'package:cinebyte_network_application/user/shajini/tabbarforshajini.dart';
// import 'package:cinebyte_network_application/production%20house/register_account.dart';
import 'package:cinebyte_network_application/user/user_home_page.dart';
import 'package:cinebyte_network_application/user/user_menu_page.dart';
import 'package:cinebyte_network_application/user/user_schedules_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 33, 33, 33),
        useMaterial3: true,
      ),
      home:  const firstPage(),
    );
  }
}

// class bottomnavbar extends StatefulWidget {
//   const bottomnavbar({super.key});

//   @override
//   State<bottomnavbar> createState() => _bottomnavbarState();
// }

// class _bottomnavbarState extends State<bottomnavbar> {
//   int _currentindex = 0;
//   List<Widget> body = [
//     const user_home_page(),
//     const user_page_menu_page(),
//     const gallery_page(),
//     user_schedule_page(),
//     const production_house_settings_page(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: body[_currentindex],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentindex,
//         onTap: (newindex) {
//           setState(() {
//             _currentindex = newindex;
//           });
//         },
//         items: const [BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'Menu'),
//         BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined),label: 'Gallery'),
//         BottomNavigationBarItem(icon: Icon(Icons.event_note),label: 'Schedules'),
//         BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings')],
//       ),
//     );
//   }
// }
