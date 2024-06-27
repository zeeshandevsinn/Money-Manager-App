import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kamino_app/page/auth/components/auth_custom_appbar.dart';
import 'package:kamino_app/page/routes.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/input_format/dollar_input.dart';
import 'package:kamino_app/utils/k_images.dart';
import 'package:kamino_app/utils/toast/flutter_toast.dart';
import 'package:kamino_app/utils/toast/showsnack.dart';
import 'package:kamino_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({Key? key}) : super(key: key);

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceComtroller = TextEditingController(text: '\$');
  TextEditingController expenseComtroller = TextEditingController(text: '\$');
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AuthCustomAppBar(isDropDownShow: false)),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Setup your Account',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                      ),
                ),
                const SizedBox(height: 36),
                Text(
                  'Profile picture',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: captionColor,
                      ),
                ),
                const SizedBox(height: 36),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    profileImage == null
                        ? Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              color: const Color(0xffC4C4C4),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          )
                        : Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: Image.file(profileImage!).image),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                    Positioned(
                      bottom: -25,
                      left: 20,
                      child: GestureDetector(
                        onTap: () async {
                          await getImage();
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                yellowColor,
                                orangeYellowColor,
                              ],
                            ),
                          ),
                          child: Center(
                              child: SvgPicture.asset(Kimages.cameraIcon)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                TextFormField(
                  autofillHints: const [AutofillHints.name],
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    hintText: 'Name',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: balanceComtroller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DollarInputFormatter(),
                  ],
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    labelText: 'Current Balance',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: expenseComtroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    labelText: 'Monthly Limit',
                  ),
                ),
                const SizedBox(height: 50),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : PrimaryButton(
                        text: 'Profile Complete',
                        onPressed: () async {
                          if (nameController.text.trim().isEmpty) {
                            showSnack(
                                context: context,
                                text: "Please Enter Your Name");
                          } else if (balanceComtroller.text.trim().isEmpty) {
                            showSnack(
                                context: context,
                                text: "Please Enter Your Balance");
                          } else if (expenseComtroller.text.trim().isEmpty) {
                            showSnack(
                                context: context,
                                text: "Please Enter Your Expenses");
                          } else {
                            final balance = balanceComtroller.text
                                .replaceAll(RegExp(r'[^\d]'), '');
                            final balance_value = int.tryParse(balance) ?? 0;
                            final expense = expenseComtroller.text
                                .replaceAll(RegExp(r'[^\d]'), '');
                            final expense_value = int.tryParse(expense) ?? 0;
                            setState(() {
                              isLoading = true;
                            });
                            profileImageUrl = await addData(profileImage!);

                            await FirebaseDataStore(nameController.text.trim(),
                                balance_value, expense_value, profileImageUrl);
                            ToastUtil.showSuccessToast(
                                "Successfully Stored Data");
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushReplacementNamed(
                                context, Routes.homeScreen);
                          }
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  File? profileImage;
  String profileImageUrl = "";
  final ImagePicker imgpicker = ImagePicker();
  Future getImage() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
      XFile xfilePick = pickedFile!;
      setState(() {
        if (xfilePick != null) {
          File selected = File(xfilePick.path);
          profileImage = selected;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      });
    } catch (e) {
      print("error while picking image.");
    }
  }

  FirebaseDataStore(name, balance, expense, imgUrl) async {
    String uid = FirebaseAuth.instance.currentUser!.uid.toString();
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        "Name": name,
        "Balance": balance,
        "ProfileImg": imgUrl,
        "Limit": expense,
        "Expense": 0,
      });
    } catch (e) {
      print("Data Error: $e");
    }
  }

  addData(File image) async {
    try {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('user_profile');
      Reference referenceImageToUpload =
          referenceDirImages.child('$uniqueFileName.jpg');

      // Ensure image is not null and exists
      if (image == null) {
        print('Error: Image file is null.');
        return;
      } else {
        UploadTask uploadTask = referenceImageToUpload.putFile(image);

        await uploadTask.whenComplete(() => null);

        // Get download URL
        String downloadUrl = await referenceImageToUpload.getDownloadURL();

        // Update UI with download URL
        ToastUtil.showSuccessToast('Image uploaded successfully');
        return downloadUrl;
      }

      // Uploading image to Firebase Storage
    } catch (e) {
      ToastUtil.showErrorToast(e.toString());
      print("Error uploading image: $e");
    }
  }
}
