import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User user = FirebaseAuth.instance.currentUser;
CollectionReference usersDb = FirebaseFirestore.instance.collection("users");
CollectionReference chatsDb = FirebaseFirestore.instance.collection('chats');
const Color tinderRed = Color(0xfffa5168);
const Color tinderGold = Color(0xffe09321);
const Color tinderGoldLight = Color(0xfff2ca72);
const Color tinderOrange = Color(0xffFF7759);
