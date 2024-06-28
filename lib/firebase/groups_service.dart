import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class groupsService {
  String? uid;
  groupsService({this.uid});
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference groupcollection =
      FirebaseFirestore.instance.collection('groups');

  getUserGroups(String uid) async {
    return usercollection.doc(uid).snapshots();
  }

  Future createGroup(String userName, String id, String groupName) async {
    // String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference groupDocumentReference = await groupcollection.add({
      'groupName': groupName,
      'groupIcon': '',
      'admin': '${id}_$userName',
      'members': [],
      'groupId': '',
      'recentMessage': '',
      'recentMessageSender': ''
    });
    //update the members
    await groupDocumentReference.update({
      'members': FieldValue.arrayUnion(['${uid}_$userName']),
      'groupId': groupDocumentReference.id,
    });
    DocumentReference userDocumentReference = usercollection.doc(uid);
    return await userDocumentReference.update({
      'userGroups':
          FieldValue.arrayUnion(['${groupDocumentReference.id}_$groupName'])
    });
  }

  getChats(groupId) async {
    return groupcollection
        .doc(groupId)
        .collection('messages')
        .orderBy('time')
        .snapshots();
  }

  Future getGroupAdmin(groupId) async {
    DocumentReference d = groupcollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await d.get();
    return documentSnapshot['admin'];
  }

  // Future<String> getGroupAdmin(String groupId) async {
  // DocumentReference docRef = groupcollection.doc(groupId);
  // DocumentSnapshot snapshot = await docRef.get();

//   if (snapshot.exists) {
//     String adminField =snapshot.data()['admin'];
//     return getNameFromAdminField(adminField);
//   } else {
//     return ''; // Handle if document does not exist
//   }
// }

// String getNameFromAdminField(String adminField) {
//   if (adminField.isEmpty || !adminField.contains('_')) return 'No Admin';

//   // Split by underscore and return the name part
//   List<String> parts = adminField.split('_');
//   if (parts.length > 1) {
//     return parts[1]; // Assuming the name is after the underscore
//   } else {
//     return 'No Admin'; // Handle unexpected format
//   }
// }

  getGroupMembers(groupId) async {
    return groupcollection.doc(groupId).snapshots();
  }

  Future<bool> isUserJoined(
      String groupName, String groupId, String userName) async {
    DocumentReference userDocumentReference = usercollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDocumentReference.get();

    List<dynamic> groups = await documentSnapshot['groups'];
    if (groups.contains("${groupId}_${groupName}")) {
      return true;
    } else {
      return false;
    }
  }

  Future toggleGroupJoin(
      String groupId, String groupName, String userName) async {
    DocumentReference userDocumentReference = usercollection.doc(uid);
    DocumentReference groupDocumentReference = groupcollection.doc(uid);

    DocumentSnapshot documentSnapshot = await userDocumentReference.get();
    List<dynamic> groups = await documentSnapshot['userGroups'];

    if (groups.contains('${groupId}_$groupName')) {
      await userDocumentReference.update({
        'userGroups': FieldValue.arrayRemove(['${groupId}_$groupName'])
      });
      await groupDocumentReference.update({
        'members':
            FieldValue.arrayRemove(['${groupDocumentReference.id}_$userName'])
      });
    } else {
      await userDocumentReference.update({
        'userGroups': FieldValue.arrayUnion(['${groupId}_$groupName'])
      });
      await groupDocumentReference.update({
        'members':
            FieldValue.arrayUnion(['${groupDocumentReference.id}_$userName'])
      });
    }
  }
}
