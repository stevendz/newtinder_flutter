import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User user = FirebaseAuth.instance.currentUser;
CollectionReference usersDb = FirebaseFirestore.instance.collection("users");
CollectionReference chatsDb = FirebaseFirestore.instance.collection('chats');
Color tinderRed = Color(0xfffa5168);
Color tinderGold = Color(0xffe09321);
Color tinderGoldLight = Color(0xfff2ca72);
