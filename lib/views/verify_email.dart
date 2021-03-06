import 'package:flutter/material.dart';
import 'package:mijini_tech/constants/routes.dart';
import 'package:mijini_tech/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify email'),
      ),
      body: Column(
        children: [
          const Text("We've already sent you a verification email"),
          const Text(
              "If you haven't received the email. Press the button below to recieve a new verificaton email"),
          TextButton(
            onPressed: (() async {
              await AuthService.firebase().sendEmailVerification();
            }),
            child: const Text("Send Email Veirfication"),
          ),
          TextButton(
            onPressed: () async{ 
              await AuthService.firebase().logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route) => false);
            },
            child: const Text(
              "Restart",
            ),
          )
        ],
      ),
    );
  }
}
