import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';

class casting_calls_clicked_page extends StatelessWidget {
  const casting_calls_clicked_page({super.key});

  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: Custom_appbar_real(title: 'casting call'),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 650,
              width: width,
              decoration: BoxDecoration(color:  Color.fromARGB(255, 229, 206, 177), 
              borderRadius: BorderRadius.circular(25)),clipBehavior: Clip.hardEdge,
              child: Image.network('https://m.media-amazon.com/images/M/MV5BMGM4NGMyN2QtYTE4NS00N2I2LThjZWYtYTQ0ZGRjNTYwN2RlXkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_.jpg',fit: BoxFit.cover,),
            ),
          )
        ],
      ),
    );
  }
}