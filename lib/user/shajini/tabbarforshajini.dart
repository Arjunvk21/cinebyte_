import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class shajini extends StatelessWidget {
  const shajini({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: 20,
                ),
                CircleAvatar(
                  radius: 40,
                ),
              ],
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromARGB(255, 33, 33, 33),
              ),
              child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Color.fromARGB(0, 255, 255, 255),
                  indicator: BoxDecoration(
                      color: Color.fromARGB(255, 25, 106, 152),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  labelColor: Color.fromARGB(255, 255, 254, 254),
                  unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                  tabs: [Text('User'), Text('Mechanic')]),
            ),
            Expanded(
              child: TabBarView(children: [
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      height: 150,
                      width: 200,
                      color: Colors.white,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            radius: 30,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Arjun',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'Arjun',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'Arjun',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 5,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
