import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

User? get currentUser => auth.currentUser;

const usersCollection = 'users';
