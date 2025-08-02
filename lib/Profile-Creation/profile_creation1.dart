import 'dart:developer';

import 'package:convo_hearts/Profile-Creation/profile_creation2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCreationController extends GetxController {
  void selectFoodDiscounts() {
    // Handle food discounts selection
    log("Food discounts selected");
    // You can navigate or perform other actions here
    // Get.toNamed('/food-discounts');
  }
  
  void selectDatingFriends() {
    // Handle dating/friends selection
    log("Dating & friends selected");
    Get.to(()=> ProfileCreation2(), transition: Transition.rightToLeftWithFade , duration: Duration(milliseconds: 800));
  }
}

class ProfileCreation extends StatelessWidget {
  const ProfileCreation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileCreationController());
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0 , vertical: 20),
                  child: Center(
                    child: Text(
                      "How would you like to use\nthe Bonding Bowls App?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff0087A7),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                // Text(
                //   "I'm just looking for Food discounts 🍔",
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                // ),

                    RichText(
                      text: TextSpan(
                        text: "I'm just looking for ",
                        style: const TextStyle(
                          color: Color(0xFF6C757D),
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "Food discounts 🤑",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 26, 26),
                              // decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                           
                          ),
                        ],
                      ),
                    ),


                Text(
                  "(free for all users without any further verification)",
                  style: TextStyle( fontStyle: FontStyle.italic,fontSize: 14, color: Colors.grey[700]),
                ),
                SizedBox(height: 18),
                Text("• Newsletter", style: TextStyle( color: Colors.grey[700])),
                Text("• Last minute food discounts from food vendors (notifications)", style: TextStyle( color: Colors.grey[700])),
                SizedBox(height: 23),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(370, 50),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: controller.selectFoodDiscounts,
                    child: Text(
                      "Just food discounts!",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(height: 72),
                // Text(
                //   "I'm looking for Dating/friends 🥰🕺",
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                // ),

                  RichText(
                      text: TextSpan(
                        text: "I'm looking for ",
                        style: const TextStyle(
                          color: Color(0xFF6C757D),
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "Dating/friends 🕺💃",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 26, 26),
                              // decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                           
                          ),
                        ],
                      ),
                    ),

                Text(
                  "(further verification needed after profile setup 🔐)",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                SizedBox(height: 14),
                Text("Try our unique dating feature which eliminates all toxicity from the local dating scene.",style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                SizedBox(height: 8),
                Text("We believe in matching people through their inner beauty, while ensuring every interaction is safe and secure.", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                SizedBox(height: 8),
                Text("Once you're in, you'll explore and connect through avatars, pseudonyms, and authentic conversations.", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                Text("Ready to get started?", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                SizedBox(height: 60),
                Center(
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffC672A5),
                      minimumSize: const Size(370, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: controller.selectDatingFriends,
                    child: Text(
                      "Dating & friends!",
                      style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w700,color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child:RichText(
                      text: TextSpan(
                        text: "P.S.",
                        style: const TextStyle(
                           fontStyle: FontStyle.italic,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        ),
                        children: [
                          TextSpan(
                            text: " Fear not, You can always change your mind later!",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              // decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w400,
                               fontStyle: FontStyle.italic,
                              fontSize: 16,
                            ),
                           
                          ),
                        ],
                      ),
                    ),
                  // Text(
                  //   "P.S. Fear not, You can always change your mind later!",
                  //   style: TextStyle(
                  //     fontStyle: FontStyle.italic,
                  //     fontSize: 16,
                  //     color: Colors.black,
                  //   ),
                  // ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}