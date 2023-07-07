// import 'package:firebase_auth/firebase_auth.dart';

// Future<void> verifyPhoneNumber(String phoneNumber) async {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   try {
//     String phoneNumber = '+923092771719';
//     FirebaseAuth auth = await FirebaseAuth.instance;
//     auth.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       verificationCompleted: (phoneAuthCredential) {},
//       verificationFailed: (verificationFailed) {},
//       codeSent: (verificationId, forceResendingToken) {},
//       codeAutoRetrievalTimeout: (verificationId) {},
//     );

//     // await _auth.verifyPhoneNumber(
//     //   phoneNumber: phoneNumber,
//     //   timeout: const Duration(seconds: 60),
//     //   verificationCompleted: verificationCompleted,
//     //   verificationFailed: verificationFailed,
//     //   codeSent: codeSent,
//     //   codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//     // );
//   } catch (error) {
//     print('Phone verification failed: $error');
//   }
// }

// Future<void> signInWithPhoneNumber(
//     String smsCode, String verificationId) async {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   try {
//     final credential = PhoneAuthProvider.credential(
//       verificationId: verificationId,
//       smsCode: smsCode,
//     );

//     final userCredential = await _auth.signInWithCredential(credential);
//     final user = userCredential.user;
//     if (user != null) {
//       // User signed in successfully
//     } else {
//       // User did not sign in successfully
//     }
//   } catch (error) {
//     print('Phone authentication failed: $error');
//   }
// }
