import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kamino_app/widgets/primary_button.dart';
// import 'package:url_launcher/url_launcher.dart';
// ignore: unused_import

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// ignore: use_key_in_widget_constructors
class SecondDashboard extends StatefulWidget {
  @override
  State<SecondDashboard> createState() => _SecondDashboardState();
}

class _SecondDashboardState extends State<SecondDashboard> {
  Map<String, dynamic>? Data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('secon_dashboard')
          .doc('second')
          .get();
      setState(() {
        Data = doc.data() as Map<String, dynamic>;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching profile data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size * 1;
    return SafeArea(
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Scaffold(
              backgroundColor: Color(Data!['background_color'] ?? 0xfaffffff),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatarWithNetworkImage(
                        imageUrl: Data!['imgUrl'] ?? "", radius: 40),
                    const SizedBox(height: 20),
                    Text(
                      Data!['appTitle'] ?? "App Title",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        Data!['appText'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: PrimaryButton(
                        text: "Launch App",
                        maximumSize: Size(size.width * .60, 60),
                        onPressed: () {
                          print(Data!['urlButton']);
                          Navigator.push(
                              context,
                              CupertinoDialogRoute(
                                  builder: (_) => WebViewScreen(
                                        url: Data!['urlButton'],
                                        color: Data!['background_color'],
                                      ),
                                  context: context));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  // void _launchURL(String webUrl) async {
  //   var url = webUrl; // Replace with your URL
  //   if (url != null) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}

class CircleAvatarWithNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double radius;

  CircleAvatarWithNetworkImage({
    required this.imageUrl,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey[200], // Placeholder background color
      child: ClipOval(
        child: Image.network(
          imageUrl,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Icon(
              Icons.account_circle,
              size: radius * 2,
              color: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  final String url;
  final int color;

  WebViewScreen({required this.url, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color),
        title: Text(
          "Welcome Here",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(url)),
        onWebViewCreated: (controller) {
          print("WebView created");
        },
        onLoadStart: (controller, url) {
          print("Started loading: $url");
        },
        onLoadStop: (controller, url) async {
          print("Finished loading: $url");
        },
        onLoadError: (controller, url, code, message) {
          print("Error loading: $url, Code: $code, Message: $message");
        },
      ),
    );
  }
}
