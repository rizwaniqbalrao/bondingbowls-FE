
import 'package:convo_hearts/login/controller/verify_email_controller.dart';
import 'package:convo_hearts/widgets/Custom_PIn_Code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyEmailController verifyController = Get.put(VerifyEmailController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/image_splash2.jpg',
                  // height: ,
                  width: 700,
                ),
                const SizedBox(height: 24),
            
                // Title
                const Text(
                  "Verify your Email",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
            
                // Subtext
                Text(
                  "Please enter the 6 digit code sent to your\nemail : ${verifyController.getMaskedEmail()}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 32),
            
                // Custom PIN Code Input
                // CustomPinCodeField(
                //   onCompleted: controller.onPinCompleted,
                // ),
            

CustomPinCodeField(
  onCompleted: (pin) {
    // ✅ Just store the value, don't verify yet
    verifyController.pinCode.value = pin;
  },
),

                const SizedBox(height: 32),
            
                // Verify Button
                ElevatedButton(
                  onPressed: () {
                    // Use the current pin code value for verification
                    if (verifyController.pinCode.value.length == 6) {
                      verifyController.verifyPin(verifyController.pinCode.value);
                    } else {
                      Get.snackbar(
                        "Error", 
                        "Please enter the verification code",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffEB953A),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(284, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontWeight: FontWeight.w700,  
                  fontSize: 24),
                  ),
                ),
            
                const SizedBox(height: 24),
            
                const Text(
                  "Haven't received your code?",
                  style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w700, color: Colors.black),
                ),
            
                const SizedBox(height: 18),
            
                // Timer + Resend
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Text(
                      verifyController.formattedTime,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    )),
                    const SizedBox(height: 16),
                    Obx(() => GestureDetector(
                      onTap: verifyController.canResend.value ? verifyController.resendCode : null,
                      child: Text(
                        "Resend!",
                        style: TextStyle(
                          fontSize: 15,
                          color: verifyController.canResend.value ? Color(0xff0900FF) : Colors.grey,
                          fontWeight: FontWeight.w700,
                        decorationColor: verifyController.canResend.value ? Color(0xff0900FF) : Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}