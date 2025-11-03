import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comics & Manga Home'),
        actions: [
          // Logout Button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Call Firebase to sign out the user
              FirebaseAuth.instance.signOut();
              // AuthWrapper handles redirection
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome, Comics & Manga Enthusiast!\n You are logged in!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}