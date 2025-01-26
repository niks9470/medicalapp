import 'package:flutter/material.dart';
import 'package:mediapp/controllers/auth_controller.dart';

class Waitingscreen extends StatefulWidget {
  const Waitingscreen({super.key});

  @override
  State<Waitingscreen> createState() => _WaitingscreenState();
}

class _WaitingscreenState extends State<Waitingscreen> {

  @override
  void initState() {
    AuthController().isUserAlreadyLoggedIn();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(

      ),
    );
  }
}
