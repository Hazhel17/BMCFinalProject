import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core [cite: 739]
import 'package:flutter_native_splash/flutter_native_splash.dart'; // Import Splash Package [cite: 603]
import 'firebase_options.dart'; // Import auto-generated options [cite: 739]
import 'package:my_ecommerce_app/screens/auth_wrapper.dart'; // Import the AuthWrapper [cite: 324]

void main() async {
  // 1. Ensure Flutter is ready and preserve the binding [cite: 607, 749]
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // 2. Preserve the splash screen until we manually remove it [cite: 608, 620]
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 3. Initialize Firebase [cite: 610, 751]
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Use generated options [cite: 612, 754]
  );

  // 4. Run the application [cite: 614, 756]
  runApp(const MyApp());

  // 5. Remove the splash screen after the app is ready [cite: 616, 621]
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes debug banner [cite: 771]
      title: 'Manga & Comics App', // App Title [cite: 772]
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        primarySwatch: Colors.green, // App Theme [cite: 775]
        primaryColor: Colors.green,
        useMaterial3: true,
      ),
      // Set the AuthWrapper as the home screen [cite: 334]
      home: const AuthWrapper(),
    );
  }
}