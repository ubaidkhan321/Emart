
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User?   currentuser = auth.currentUser;

const usercollection = "User";
const productcollection = "products";
const cartcollection = "addcart";
const chatcollection = "chat";
const messagecollection = "message";
const ordercollection = "order";
const vendorcollection = "vendor";