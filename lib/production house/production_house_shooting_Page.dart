import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class production_house_shooting_page extends StatelessWidget {
  final List _shootings = ['shoot 1', 'shoot 2', 'shoot 3','shoot 4'];
   production_house_shooting_page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Center(
                child: Container(
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Color.fromARGB(255, 234, 210, 178),
              ),
              clipBehavior: Clip.hardEdge,
              child: Card(
                child: Image.network(
                  'https://assets-in.bmscdn.com/discovery-catalog/events/et00038685-nrtlwupzxk-landscape.jpg',
                  fit: BoxFit.cover,
                ),
                elevation: 10,
              ),
              width: width,
              height: 150,
            )),
          );
        },
        itemCount: _shootings.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 234, 210, 178),
        child: Icon(Icons.add),
      ),
    );
  }
}
