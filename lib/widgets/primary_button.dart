import 'package:kamino_app/utils/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton(
      {Key? key,
      this.maximumSize = const Size(double.infinity, 60),
      required this.text,
      this.grediantColor = blueGrediantColor,
      required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;
  final List<Color> grediantColor;
  final String text;
  final Size maximumSize;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: widget.grediantColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          minimumSize: widget.maximumSize,
          maximumSize: widget.maximumSize,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          widget.text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
