import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Firebase Demo')),
        body: Center(child: Text('Hello, World!')),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:votes_app/presentation/screens/auth/login_screen.dart';
// import 'package:votes_app/presentation/screens/candidates_list.dart';
// import 'package:votes_app/presentation/screens/home_screen.dart';
// import 'package:votes_app/presentation/screens/signature_screen.dart';
// import 'package:votes_app/presentation/screens/splash_screen.dart';
// import 'package:votes_app/presentation/screens/voting_card_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// void main() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const SplashScreen(),
//         '/login': (context) => const LoginScreen(),
//         '/home': (context) => const HomeScreen(),
//         '/candidates-list': (context) => const CandidatesList(),
//         '/signature': (context) => const SignatureScreen(),
//         '/voting-card': (context) => const VotingCardScreen()
//       },
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.white,
//           centerTitle: false,
//         ),
//         scaffoldBackgroundColor: Colors.white,
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ButtonStyle(
//             foregroundColor: WidgetStateProperty.all(
//               Colors.white,
//             ),
//             backgroundColor: WidgetStateProperty.resolveWith<Color>(
//               (Set<WidgetState> states) {
//                 if (states.contains(WidgetState.disabled)) {
//                   return Colors.grey;
//                 }
//                 return Colors.black;
//               },
//             ),
//             padding: WidgetStateProperty.all<EdgeInsets>(
//               const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
//             ),
//             shape: WidgetStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
