import 'package:flutter/material.dart';
import 'package:flutter_bloc_lab/core/network.dart';
import 'package:flutter_bloc_lab/core/repository/user_repo.dart';
import 'package:flutter_bloc_lab/page/challenge_page.dart';
import 'package:flutter_bloc_lab/page/test_page.dart';
import 'package:flutter_bloc_lab/page/user_page.dart';
import 'package:http/http.dart' as http;

// void main() 
// {
//   final UserRepository userRepository = UserRepository
//   (
//     userApiClient: UserApiClient
//     (
//       httpClient: http.Client()
//     )
//   );

//   runApp
//   (
//     MainApp
//     (
//       userRepository: userRepository,
//     )
//   );
// }

// class MainApp extends StatelessWidget 
// {
//   const MainApp({super.key, required this.userRepository});
//   final UserRepository userRepository;

//   @override
//   Widget build(BuildContext context) 
//   {
//     return MaterialApp
//     (
//       // home: Scaffold
//       // (
//       //   body: Center
//       //   (
//       //     child: Text('Hello World!'),
//       //   ),
//       // ),
//       // home: UserPage
//       // (
//       //   userRepository: userRepository
//       // ),

//       home: ChallengePage
//       (
//         userRepository: userRepository,
//       )
//     );
//   }
// }

void main() 
{
  runApp
  (
    MainApp
    ()
  );
}

class MainApp extends StatelessWidget 
{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      home: TestPage()
    );
  }
}
