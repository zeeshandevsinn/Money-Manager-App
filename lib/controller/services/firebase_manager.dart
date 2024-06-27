// import 'dart:developer';

// import 'dart:io';

// // import 'dart:js_interop';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:kamino_app/utils/toast/zb_toast.dart';

// const USER_COLLECTION = "Client";
// const PRODUCT_COLLECTION = "Products";

// class FirebaseManager {
//   static final _auth = FirebaseAuth.instance;
//   static String verifyId = '';
//   static String code = '';
//   static addProduct(
//       {price,
//       age,
//       title,
//       description,
//       category,
//       uid,
//       subcategory,
//       location,
//       List<String>? urlImage,
//       isFree,
//       datetime}) async {
//     try {
//       var data = await FirebaseFirestore.instance.collection("Products").add({
//         "price": price,
//         "age": age,
//         "title": title,
//         "description": description,
//         "category": category,
//         "subcategory": subcategory,
//         "location": location,
//         "urlImage": urlImage,
//         "isFree": isFree,
//         "Time": datetime,
//         "uid": uid
//       });
//       return data;
//     } catch (e) {
//       debugger();
//       ZBotToast.showToastError(message: e.toString());
//     }
//   }

// //   static AddImages(List<File> selectedimages,
// //       {price,
// //       title,
// //       age,
// //       description,
// //       category,
// //       subcategory,
// //       location,
// //       uid,
// //       isFree,
// //       datetime}) async {
// //     try {
// //       List<String> urlImage = [];
// //       Future<void> uploadImages(List<File> selectedImages) async {
// //         for (var i = 0; i < selectedImages.length; i++) {
// //           String uniqueFileName =
// //               DateTime.now().millisecondsSinceEpoch.toString();
// //           Reference referenceRoot = FirebaseStorage.instance.ref();
// //           Reference referenceDirImages = referenceRoot.child('images');
// //           Reference referenceImageToUpload =
// //               referenceDirImages.child(uniqueFileName);
// //           await referenceImageToUpload.putFile(File(selectedImages[i].path));
// //           String downloadUrl = await referenceImageToUpload.getDownloadURL();
// //           urlImage.add(downloadUrl);
// //         }
// //       }

// // // Call the function with your selected images list
// //       await uploadImages(selectedimages);

// //       // List<String> urlImage = [];
// //       // Reference referenceRoot = FirebaseStorage.instance.ref();
// //       // // ignore: unused_local_variable
// //       // Reference referenceDirImages = referenceRoot.child('images');
// //       // for (var i = 0; i < selectedimages.length; i++) {
// //       //   String uniqueFileName =
// //       //       DateTime.now().millisecondsSinceEpoch.toString();
// //       //   Reference referenceRoot = FirebaseStorage.instance.ref();
// //       //   Reference referenceDirImages = referenceRoot.child('images');
// //       //   Reference referenceImageToUpload =
// //       //       referenceDirImages.child(uniqueFileName);
// //       //   referenceImageToUpload.putFile(File(selectedimages[i].path));
// //       //   urlImage.add(await referenceImageToUpload.getDownloadURL());
// //       // }
// //       await addProduct(
// //           urlImage: urlImage,
// //           price: price,
// //           age: age,
// //           title: title,
// //           description: description,
// //           category: category,
// //           subcategory: subcategory,
// //           location: location,
// //           uid: uid,
// //           isFree: isFree,
// //           datetime: datetime);
// //     } catch (e) {
// //       // ZBotToast.showToastError(message: e.toString());
// //       return null;
// //     }
// //   }

//   // static SignUpFirebaseStoreage(
//   //   context,
//   //   name,
//   //   email,
//   //   password,
//   //   uid,
//   // ) async {
//   //   try {
//   //     var data =
//   //         await FirebaseFirestore.instance.collection("Client").doc(uid).set({
//   //       "Name": name,
//   //       "Email": email,
//   //       "Password": password,
//   //       "UID": uid.toString(),
//   //     });
//   //     return data;
//   //   } catch (e) {
//   //     debugger();
//   //     ZBotToast.showToastError(message: e.toString());
//   //   }
//   // }

//   static PhoneNumberVerification(context, String phoneNo) async {
//     try {
//       await FirebaseAuth.instance.verifyPhoneNumber(
//           phoneNumber: phoneNo,
//           verificationCompleted: (PhoneAuthCredential credential) {},
//           verificationFailed: (FirebaseAuthException e) {},
//           codeSent: (String verificationId, int? resendToken) {
//             FirebaseManager.verifyId = verificationId;
//           },
//           codeAutoRetrievalTimeout: (String verificationId) {});
//     } catch (e) {
//       ZBotToast.showToastError(message: e.toString());
//     }
//     // await _auth.verifyPhoneNumber(
//     //   phoneNumber: phoneNo,
//     //   verificationCompleted: (credentials) async {
//     //     await _auth.signInWithCredential(credentials);
//     //   },
//     //   codeSent: (verificationId, resendToken) async {
//     //     verifyId = verificationId;
//     //   },
//     //   codeAutoRetrievalTimeout: (verificationId) {
//     //     verifyId = verificationId;
//     //   },
//     //   verificationFailed: (e) {
//     //     if (e.code == "invalid-phone-number") {
//     //       showSnack(
//     //           context: context,
//     //           text: "Error, The Provider phone number is not valid");
//     //     } else {
//     //       showSnack(context: context, text: "Something went wrong, Try Again!");
//     //     }
//     //   },
//     // );
//   }

//   // ignore: non_constant_identifier_names
//   static VerifyOTP(String verificationID, String OTP) async {
//     // try {
//     //   var credentials = await _auth.signInWithCredential(
//     //       PhoneAuthProvider.credential(
//     //           verificationId: verifyId, smsCode: code));
//     //   return credentials;
//     // } catch (e) {
//     //   print("Firebase Auth Error: $e");
//     // }
//     // debugger();
//     String otp = OTP.trim();
//     if (otp.isNotEmpty) {
//       try {
//         // Use the Firebase Auth instance to sign in with the OTP
//         AuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: verificationID,
//           smsCode: otp,
//         );

//         // If verification is successful, you can access the user information

//         return true;
//         // Now, you can navigate to the next screen or perform other actions
//       } catch (e) {
//         print('Error verifying OTP: $e');
//         // Handle the error, e.g., show an error message
//       }
//     } else {
//       // Display an error message for an empty OTP
//       print('Please enter the OTP');
//     }
//   }
// }
// // }
