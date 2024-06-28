
import 'package:cinebyte_network_application/firebase/feedback.dart';
import 'package:cinebyte_network_application/model/feedback_form_model.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class notifications_page extends StatefulWidget {
  const notifications_page({super.key});

  @override
  State<notifications_page> createState() => _notifications_pageState();
}

class _notifications_pageState extends State<notifications_page> {
  bool expansionicon = false;
  String? user = FirebaseAuth.instance.currentUser!.email;
  String? userid = FirebaseAuth.instance.currentUser!.uid;
  FeedbackService _feedbackservice = FeedbackService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  Custom_appbar_real(title: 'Notifications'),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<feedbackModel>>(
                  stream: _feedbackservice.getallFeedbacks(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Some error occured'),
                      );
                    }
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      List<feedbackModel> _feedback = snapshot.data ?? [];
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final _feedbacks = _feedback[index];
                          // final document = data[index];
                          // final email = document['email'] ?? 'No email';
                          // final feedbackDescription =
                          //     document['feedback_description'] ??
                          //         'No description';

                          return Container(
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    const Color.fromARGB(255, 229, 206, 177)),
                            child: IntrinsicHeight(
                              child: ExpansionTile(
                                title: Text('${_feedbacks.feedback_email}',
                                    style: GoogleFonts.fugazOne()),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                        style: GoogleFonts.fugazOne(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                        '${_feedbacks.feedback_description}'),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: _feedback.length,
                      );
                    }
                    return const Center(
                      child: Text(
                        'Something error occured',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
