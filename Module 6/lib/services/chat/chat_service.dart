import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:module_6_assignment/models/message.dart';

class ChatService
{
  //get messages
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("User").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return {
          "email": user["email"],
          "uid": user["uid"],
        };
      }).toList();
    });
  }


  //send message
  // Future<void> sendMessage(String receiverID, message) async
  // {
  //
  //   //get current user info
  //   final String currentUserID = _auth.currentUser!.uid;
  //   final String currentUserEmail = _auth.currentUser!.email;
  //   final Timestamp timestamp = Timestamp.now();
  //
  //   //create a new message
  //   Message newMassage = Message(
  //       senderID: currentUserID,
  //       senderEmail: currentUserEmail,
  //       receiverID: receiverID,
  //       message: message,
  //       timestamp: timestamp,
  //   );
  //
  //   // constuct chat room ID for the two user(sorted to ensure uniquenness)
  //   List<String> ids = [currentUserID, receiverID];
  //   ids.sort();//sort the ids( this ensure the classroomID is the same for any two people
  //   String chatRoomID = ids.join('_');
  //
  //   //add message to database
  //   await _firestore
  //     .collection("chats_rooms")
  //     .doc(chatRoomID)
  //     .collection("messages")
  //     .add(newMassage.toMap());
  // }
  Future<void> sendMessage(String receiverID, String message) async {
    try {
      // Get current user info
      final String? currentUserID = _auth.currentUser?.uid;
      final String? currentUserEmail = _auth.currentUser?.email;

      if (currentUserID == null || currentUserEmail == null) {
        throw Exception("Current user is not signed in.");
      }

      // Convert Timestamp to a String
      final String formattedTimestamp = Timestamp.now().toDate().toIso8601String();

      // Create a new message
      Message newMessage = Message(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timestamp: formattedTimestamp, // Pass as a String
      );

      // Construct chat room ID for the two users
      List<String> ids = [currentUserID, receiverID];
      ids.sort(); // Ensure uniqueness
      String chatRoomID = ids.join('_');

      // Add message to Firestore
      await _firestore
          .collection("chat_rooms")
          .doc(chatRoomID)
          .collection("messages")
          .add(newMessage.toMap());
    } catch (e) {
      print("Error sending message: $e");
    }
  }




  //get message
  Stream<QuerySnapshot> getMessages(String userID, otherUserID)
  {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}