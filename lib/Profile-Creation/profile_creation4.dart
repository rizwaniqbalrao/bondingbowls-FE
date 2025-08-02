import 'dart:developer';

import 'package:convo_hearts/verify-dating-profile/dating_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileCreation4 extends StatelessWidget {
  
  var selectedLocation = 'Location'.obs;

   ProfileCreation4({Key? key}) : super(key: key);

  
  void updateLocation(String value) => selectedLocation.value = value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics() ,
          child: Column(
            children: [
              // Custom Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    // Back Button
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset("assets/icon/svg/back_arrow.svg")
                      ),
                    ),
                    
                    // Title
                    const Expanded(
                      child: Text(
                        'AI avatar creation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    
                    // Spacer for alignment
                    const SizedBox(width: 40),
                  ],
                ),
              ),
               SizedBox(height: 20,),
              // Instruction Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, ),
                child: Text(
                  'By proceeding, you acknowledge and accept that the outcome of this image generation may vary.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    height: 1.4,
                  ),
                ),
              ),
               SizedBox(height: 20,),

              _buildDropdown("Art Style 1", selectedLocation,  "assets/icon/svg/paint.svg"),
               SizedBox(height: 20,),

              
              // Main Content Area - Removed Expanded widget
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  // ?  Image Container
                    Container(
                      width: double.infinity,
                      height: 480,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Avatar Image
                            Image.asset(
                              'assets/images/camer_avatar.jpg', // Replace with your image
                              fit: BoxFit.cover,
                            ),
                            
                            // Subtle gradient overlay for better contrast
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.1),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    


                    Text("*Do note that first AI avatar creation is complimentary, future changes will require bowls",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Color(0xffBC0072)
                    ),),



                    const SizedBox(height: 40),

                   Row(
                    children: [
                      
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        log("upload Picture ");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffF66B6B),
                        minimumSize: Size(280, 50),
                        // side: BorderSide(color: Color(0xffFA6D8C)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ), child:  Text("Retry",style: TextStyle(fontSize: 16, color: Colors.white),),),
                  ),

                  SizedBox(width: 20,),
                  
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        log("upload Picture ");
                        Get.to(()=> Verification_DatingScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFFA445),
                        minimumSize: Size(280, 50),
                        // side: BorderSide(color: Color(0xffFA6D8C)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ), child:  Text("Proceed",style: TextStyle(fontSize: 16, color: Colors.white),),),
                  )
                  

                    ],
                   ) ,
            
                    
                    const SizedBox(height: 16),
                    
                    // Camera Label
                    const Text(
                      'By proceeding, you agree to the Terms of Use of third-party AI services.',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Colors .black,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),

            ],
          ),
        ),
      ),
    );
  }



Widget _buildDropdown(String hintlabel, RxString selectedValue, String iconPath) {
  return Obx(() => Container(
    width: 270,
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xffFA6D8C)),
      borderRadius: BorderRadius.circular(16),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedValue.value == hintlabel ? null : selectedValue.value,
        hint: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 10),
            Text(
              hintlabel,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
          ],
        ),
        icon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: SvgPicture.asset("assets/icon/svg/dropdown_arrow.svg"),
        ),
        isExpanded: true,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical:0),
        items: _getDropdownItems(hintlabel, iconPath),
        onChanged: (String? newValue) {
          if (newValue != null) {
            selectedValue.value = newValue;
          }
        },
      ),
    ),
  ));
}

// Helper method to get dropdown items based on the hint label
List<DropdownMenuItem<String>> _getDropdownItems(String hintLabel, String iconPath) {
  List<String> items = [];
  
  if (hintLabel == 'Location') {
    items = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix']; // Add your location options
  } else if (hintLabel == 'Religion') {
    items = ['Christianity', 'Islam', 'Judaism', 'Hinduism', 'Buddhism', 'Other']; // Add your religion options
  }
  
  return items.map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }).toList();
}



}