import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_authentication/password/password.controller.dart';

class PasswordView extends GetResponsiveView<PasswordController> {
  PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(95, 25, 1, 59),
      body: body(),
    );
  }

  body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text("Login",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 35)),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Authenticate using your fingerprint instyead of your password",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: InkWell(
            onTap: () {
              Get.put(PasswordController());
              controller.checkAuthentication();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(25)),
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text("Authenticate",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}
