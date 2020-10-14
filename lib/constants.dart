import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

User user = FirebaseAuth.instance.currentUser;
CollectionReference usersDb = FirebaseFirestore.instance.collection("users");
CollectionReference chatsDb = FirebaseFirestore.instance.collection('chats');
