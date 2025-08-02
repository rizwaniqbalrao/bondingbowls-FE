import 'package:convo_hearts/login/controller/login_controller.dart';
import 'package:convo_hearts/widgets/Custom_TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final LoginController controller = Get.put(LoginController());
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            // Enhanced smooth scrolling like signup screen
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            // Keyboard dismiss behavior like signup screen
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            // Consistent padding like signup screen
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo/Image with constrained size like signup screen
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

                // Email/Mobile TextField (no animation like signup)
                CustomTextField(
                  controller: controller.emailController,
                  hintText: "Email or Mobile Number",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset("assets/icon/svg/login_person.svg"),
                  ),
                ),
        
                const SizedBox(height: 24),

                // Password TextField with reactive visibility (simplified like signup)
                Obx(() => CustomTextField(
                  controller: controller.passwordController,
                  hintText: "Type your Password",
                  obscureText: controller.obscurePassword.value,
                  prefixIcon: SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset("assets/icon/svg/lock.svg"),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: controller.togglePasswordVisibility,
                    child: Icon(
                      controller.obscurePassword.value 
                          ? Icons.visibility_off 
                          : Icons.visibility,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                )),

                const SizedBox(height: 20),

                // Forgot Password (simplified like signup)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: controller.navigateToForgotPassword,
                    style: TextButton.styleFrom(
                      splashFactory: InkRipple.splashFactory,
                      overlayColor: Colors.orange.withOpacity(0.1),
                    ),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
        
                // Log In Button with loading state (simplified like signup)
                Obx(() => Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value 
                        ? null 
                        : controller.handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.isLoading.value 
                          ? Colors.orange.withOpacity(0.7)
                          : Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: controller.isLoading.value ? 0 : 2,
                      shadowColor: Colors.orange.withOpacity(0.3),
                    ),
                    child: controller.isLoading.value
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                  ),
                )),
                
                const SizedBox(height: 32),
        
                // OR Divider (matching signup style exactly)
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
                        "or log in with",
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
        
                // Social Login Buttons (matching signup style exactly)
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Login Button
                    Container(
                      child: IconButton(
                        icon: controller.isLoading.value 
                            ? const SizedBox(
                                width: 24, 
                                height: 24, 
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
                        onPressed: controller.isLoading.value ? null : controller.handleGoogleLogin,
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Apple Login Button
                    Container(
                      child: IconButton(
                        icon: controller.isLoading.value 
                            ? const SizedBox(
                                width: 24, 
                                height: 24, 
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
                        onPressed: controller.isLoading.value ? null : controller.handleAppleLogin,
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                  ],
                )),
                
                const SizedBox(height: 32),
        
                // Sign Up Prompt (simplified like signup)
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(
                        color: Color(0xFF6C757D),
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up!",
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = controller.navigateToSignUp,
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
        
                // Terms & Privacy (matching signup style exactly)
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "I have read, understood and accepted the\n",
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
                          ..onTap = controller.navigateToTermsOfService,
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
                          ..onTap = controller.navigateToPrivacyPolicy,
                      ),
                    ],
                  ),
                ),
                
                // Bottom padding for better scroll experience
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}