import 'package:flutter/material.dart';

class HaveAnAccountOrNotView extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLogin;

  const HaveAnAccountOrNotView(
      {Key? key, this.onPressed, required this.isLogin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: isLogin
                  ? 'Don\'t Have Account? '
                  : 'Already Have an account? ',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextSpan(
              text: !isLogin ? ' Login' : ' Register',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: const Color(0xff1E78FE),
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
