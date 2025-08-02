import 'package:convo_hearts/login/controller/signup_controller.dart';
import 'package:convo_hearts/widgets/Custom_TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              // Enhanced scrolling physics for smooth experience
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              // Scroll behavior configuration
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              // Consistent padding
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo/Image with constrained size
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                      maxWidth: 300,
                    ),
                    child: Image.asset(
                      'assets/images/image_splash2.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Email Field
                  CustomTextField(
                    controller: controller.emailController,
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    validator: controller.validateEmail,
                    prefixIcon: SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset("assets/icon/svg/login_person.svg"),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Password Field
                  Obx(() => CustomTextField(
                    controller: controller.passwordController,
                    hintText: "Type your Password",
                    obscureText: controller.obscurePassword.value,
                    validator: controller.validatePassword,
                    prefixIcon: SizedBox(
                      height: 20,
                      width: 20,
                      child: SvgPicture.asset("assets/icon/svg/lock.svg"),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: controller.togglePasswordVisibility,
                      child: Icon(
                        controller.obscurePassword.value ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  )),
                  const SizedBox(height: 24),

                  // Confirm Password Field
                  Obx(() => CustomTextField(
                    controller: controller.confirmPasswordController,
                    hintText: "Re-Type your Password",
                    obscureText: controller.obscureConfirmPassword.value,
                    validator: controller.validateConfirmPassword,
                    onChanged: (value) {
                      // Trigger validation for confirm password when password changes
                      if (controller.formKey.currentState != null) {
                        controller.formKey.currentState!.validate();
                      }
                    },
                    prefixIcon: SizedBox(
                      height: 20,
                      width: 20,
                      child: SvgPicture.asset("assets/icon/svg/lock.svg"),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: controller.toggleConfirmPasswordVisibility,
                      child: Icon(
                        controller.obscureConfirmPassword.value ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  )),

                  const SizedBox(height: 20),

                  // Password Requirements Card
                   const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Create passwords with at least 12\ncharacters, including a mix of:",
                    style: TextStyle(fontSize: 12, color: Color.fromARGB(221, 179, 179, 179)),
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("        • Uppercase and lowercase letters", 
                    style: TextStyle(fontSize: 12, color: Color.fromARGB(221, 179, 179, 179)),
                        

                        ),
                        Text("        • Numbers",
                        
                    style: TextStyle(fontSize: 12, color: Color.fromARGB(221, 179, 179, 179)),
                        ),
                        Text("        • Special characters (e.g., ! @ # \$ %)",
                        
                    style: TextStyle(fontSize: 12, color: Color.fromARGB(221, 179, 179, 179)),
                        ),
                      ],
                    ),
                  ),
                ),

                  // OR Divider
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          color: Color(0xFFE9ECEF),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "or sign up with",
                          style: TextStyle(
                            fontSize: 12, 
                            color: Color(0xFF6C757D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xFFE9ECEF),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Social Sign Up Buttons
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google Sign Up Button
                      Container(
        
                        child: IconButton(
                          icon: controller.isLoading.value 
                              ? const SizedBox(
                                  width: 30, 
                                  height: 30, 
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Color(0xFF6C757D),
                                  ),
                                )
                              : SvgPicture.asset(
                                  "assets/icon/svg/Google_icon.svg",
                                  width: 24,
                                  height: 24,
                                ),
                          onPressed: controller.isLoading.value ? null : controller.onGoogleSignUp,
                          padding: const EdgeInsets.all(12),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Apple Sign Up Button
                      Container(
            
                        child: IconButton(
                          icon: controller.isLoading.value 
                              ? const SizedBox(
                                  width: 20, 
                                  height: 20, 
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Color(0xFF6C757D),
                                  ),
                                )
                              : SvgPicture.asset(
                                  "assets/icon/svg/Apple.svg",
                                  width: 24,
                                  height: 24,
                                ),
                          onPressed: controller.isLoading.value ? null : controller.onAppleSignUp,
                          padding: const EdgeInsets.all(12),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(height: 32),

                  // Terms and Policy
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "By Signing up, I have read, understood and\n accepted the ",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6C757D),
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text: "Terms of Service",
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = controller.onTermsOfServiceTap,
                        ),
                        const TextSpan(text: " and the "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = controller.onPrivacyPolicyTap,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Sign Up Button
                  Obx(() => Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value ? null : controller.onEmailSignUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 2,
                        shadowColor: Colors.orange.withOpacity(0.3),
                      ),
                      child: controller.isLoading.value
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  )),
                  const SizedBox(height: 24),

                  // Already have account
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: const TextStyle(
                          color: Color(0xFF6C757D),
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign In!",
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = controller.navigateToLogin,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom padding for better scroll experience
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}