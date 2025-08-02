// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // Controller for managing states
// class MatchmakingController extends GetxController {
//   var ageRange = const RangeValues(25, 28).obs;
//   var selectedGender = ''.obs;
//   var selectedIntention = ''.obs;
//   var selectedFriendType = ''.obs;
//   var selectedNationality = ''.obs;
//   var selectedReligion = ''.obs;
// }

// class MatchmakingScreen extends StatelessWidget {
//   final controller = Get.put(MatchmakingController());

//   MatchmakingScreen({super.key});

//   Widget sectionLabel(String text) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
//       );

//   Widget optionButton(String label, RxString groupValue) {
//     return Obx(() {
//       bool isSelected = groupValue.value == label;
//       return ChoiceChip(
//         label: Text(label),
//         selected: isSelected,
//         onSelected: (_) => groupValue.value = label,
//         selectedColor: Colors.black,
//         backgroundColor: Colors.grey.shade300,
//         labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFCEEDD),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: const BackButton(color: Colors.black),
//         title: const Text("Matchmaking", style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(16),
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(16),
//           color: Colors.white,
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text("Adjust your main matchmaking filters"),
//               sectionLabel("Age (25-40)"),
//               Obx(() => RangeSlider(
//                     values: controller.ageRange.value,
//                     min: 25,
//                     max: 40,
//                     divisions: 15,
//                     labels: RangeLabels(
//                       '${controller.ageRange.value.start.round()}',
//                       '${controller.ageRange.value.end.round()}',
//                     ),
//                     onChanged: (value) => controller.ageRange.value = value,
//                   )),
//               sectionLabel("Gender"),
//               Wrap(
//                 spacing: 8,
//                 children: [
//                   optionButton("Male", controller.selectedGender),
//                   optionButton("Female", controller.selectedGender),
//                 ],
//               ),
//               sectionLabel("Dating intentions"),
//               Wrap(
//                 spacing: 8,
//                 children: [
//                   optionButton("Any", controller.selectedIntention),
//                   optionButton("Serious", controller.selectedIntention),
//                   optionButton("Friends", controller.selectedFriendType),
//                   optionButton("Casual", controller.selectedFriendType),
//                 ],
//               ),
//               sectionLabel("Nationality"),
//               Wrap(
//                 spacing: 8,
//                 children: [
//                   optionButton("SG/PR", controller.selectedNationality),
//                   optionButton("Others", controller.selectedNationality),
//                 ],
//               ),
//               sectionLabel("Religion"),
//               Wrap(
//                 spacing: 8,
//                 children: [
//                   optionButton("Any", controller.selectedReligion),
//                   optionButton("Atheist", controller.selectedReligion),
//                   optionButton("Buddhism", controller.selectedReligion),
//                   optionButton("Christianity", controller.selectedReligion),
//                   optionButton("Islam", controller.selectedReligion),
//                   optionButton("Taoism", controller.selectedReligion),
//                   optionButton("Hinduism", controller.selectedReligion),
//                   optionButton("Others", controller.selectedReligion),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Save logic
//                     Get.snackbar("Saved", "Your preferences have been saved.");
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     side: const BorderSide(color: Colors.blue),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                   ),
//                   child: const Text(
//                     "Save",
//                     style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }













// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// // Controller for managing states
// class MatchmakingController extends GetxController {
//   var ageRange = const RangeValues(25, 28).obs;
//   var selectedGender = ''.obs;
//   var selectedIntention = ''.obs;
//   var selectedFriendType = ''.obs;
//   var selectedNationality = ''.obs;
//   var selectedReligion = ''.obs;
// }

// class MatchmakingScreen extends StatelessWidget {
//   final controller = Get.put(MatchmakingController());

//   MatchmakingScreen({super.key});

//   Widget sectionLabel(String text) => Padding(
//         padding: const EdgeInsets.only(top: 20, bottom: 8),
//         child: Text(
//           text,
//           style: const TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 16,
//             color: Colors.black87,
//           ),
//         ),
//       );

//   Widget optionButton(String label, RxString groupValue, {bool isSmall = false}) {
//     return Obx(() {
//       bool isSelected = groupValue.value == label;
//       return GestureDetector(
//         onTap: () => groupValue.value = label,
//         child: Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: isSmall ? 12 : 16,
//             vertical: isSmall ? 6 : 8,
//           ),
//           margin: const EdgeInsets.only(right: 8, bottom: 8),
//           decoration: BoxDecoration(
//             color: isSelected ? Colors.black : Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(
//               color: isSelected ? Colors.black : Colors.grey.shade300,
//               width: 1,
//             ),
//           ),
//           child: Text(
//             label,
//             style: TextStyle(
//               color: isSelected ? Colors.white : Colors.black87,
//               fontSize: isSmall ? 13 : 14,
//               fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFCEEDD),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
            
//            IconButton(onPressed: (){
//                 Get.back();
//               }, icon: SvgPicture.asset("assets/icon/svg/back_arrow.svg")),

//             Text("Matchmaking", style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700),),    
//             Container(
//             margin: const EdgeInsets.all(16),
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 10,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
                
//                 const Text(
//                   textAlign: TextAlign.center,
//                   "Adjust your main matchmaking filters",
//                   style: TextStyle(
//                     fontStyle: FontStyle.italic,
//                     fontSize: 14,
//                     color: Color.fromARGB(255, 0, 0, 0),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
                
//                 sectionLabel("Age  (25-40)"),
//                 Obx(() => Column(
//                       children: [
//                         RangeSlider(
//                           values: controller.ageRange.value,
//                           min: 25,
//                           max: 40,
//                           divisions: 100,
//                           activeColor: Colors.black,
//                           inactiveColor: Color(0xffD9D9D9),
//                           labels: RangeLabels(
//                             '${controller.ageRange.value.start.round()}',
//                             '${controller.ageRange.value.end.round()}',
//                           ),
//                           onChanged: (value) => controller.ageRange.value = value,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 24),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 '${controller.ageRange.value.start.round()}',
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               Text(
//                                 '${controller.ageRange.value.end.round()}',
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     )),
                  
//           Row(
//             children: [
//                     sectionLabel("Gender"),
//                     SizedBox(width: 50,),
//                    optionButton("Male", controller.selectedGender),
//                     optionButton("Female", controller.selectedGender),
          
//             ],
//           ),
                  
//                 sectionLabel("Dating intentions"),
//                 Wrap(
//                   children: [
//                     optionButton("Any", controller.selectedIntention),
//                     optionButton("Serious", controller.selectedIntention),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Wrap(
//                   children: [
//                     optionButton("Friends", controller.selectedFriendType),
//                     optionButton("Casual", controller.selectedFriendType),
//                   ],
//                 ),
                  
//                 sectionLabel("Nationality"),
//                 Wrap(
//                   children: [
//                     optionButton("SG/PR", controller.selectedNationality),
//                     optionButton("Others", controller.selectedNationality),
//                   ],
//                 ),
                  
//                 sectionLabel("Religion"),
//                 Wrap(
//                   children: [
//                     optionButton("Any", controller.selectedReligion, isSmall: true),
//                     optionButton("Atheist", controller.selectedReligion, isSmall: true),
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//                 Wrap(
//                   children: [
//                     optionButton("Buddhism", controller.selectedReligion, isSmall: true),
//                     optionButton("Christianity", controller.selectedReligion, isSmall: true),
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//                 Wrap(
//                   children: [
//                     optionButton("Islam", controller.selectedReligion, isSmall: true),
//                     optionButton("Taoism", controller.selectedReligion, isSmall: true),
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//                 Wrap(
//                   children: [
//                     optionButton("Hinduism", controller.selectedReligion, isSmall: true),
//                     optionButton("Others", controller.selectedReligion, isSmall: true),
//                   ],
//                 ),
                  
//                 const SizedBox(height: 32),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Save logic
//                       Get.snackbar(
//                         "Saved",
//                         "Your preferences have been saved.",
//                         backgroundColor: Colors.green.shade100,
//                         colorText: Colors.green.shade800,
//                         margin: const EdgeInsets.all(16),
//                         borderRadius: 12,
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.blue,
//                       side: const BorderSide(color: Colors.blue, width: 1.5),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       elevation: 0,
//                     ),
//                     child: const Text(
//                       "Save",
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//               ],
//             ),
//           )
//         ],
//         ),
//       ),
//     );
//   }
// }












import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller for managing states
class MatchmakingController extends GetxController {
  var ageRange = const RangeValues(25, 28).obs;
  var selectedGender = ''.obs;
  var selectedIntention = ''.obs;
  var selectedNationality = ''.obs;
  var selectedReligion = ''.obs;
  
  void selectIntention(String intention) {
    selectedIntention.value = intention;
  }
}

class MatchmakingScreen extends StatelessWidget {
  final controller = Get.put(MatchmakingController());

  MatchmakingScreen({super.key});

  Widget sectionLabel(String text) => Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 12),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
      );

  Widget optionButton(String label, RxString groupValue, {bool isSmall = false}) {
    return Obx(() {
      bool isSelected = groupValue.value == label;
      return GestureDetector(
        onTap: () => groupValue.value = label,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isSmall ? 12 : 16,
            vertical: isSmall ? 6 : 8,
          ),
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? Colors.black : Colors.grey.shade300,
              width: 2,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontSize: isSmall ? 13 : 14,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ),
      );
    });
  }

  Widget intentionButton(String label) {
    return Obx(() {
      bool isSelected = controller.selectedIntention.value == label;
      return GestureDetector(
        onTap: () => controller.selectIntention(label),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? const Color(0xff000000B2) : Colors.grey.shade300,
              width: 2,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEEDD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom App Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Matchmaking",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // Balance the back button
                  ],
                ),
              ),

              // Main Container
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Adjust your main matchmaking filters",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Age Section
                    sectionLabel("Age (25-40)"),
                    Obx(() => Column(
                          children: [
                            RangeSlider(
                              values: controller.ageRange.value,
                              min: 25,
                              max: 40,
                              divisions: 15,
                              activeColor: Colors.black,
                              inactiveColor: const Color(0xffD9D9D9),
                              labels: RangeLabels(
                                '${controller.ageRange.value.start.round()}',
                                '${controller.ageRange.value.end.round()}',
                              ),
                              onChanged: (value) => controller.ageRange.value = value,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${controller.ageRange.value.start.round()}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '${controller.ageRange.value.end.round()}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),

                    // Gender Section
                    sectionLabel("Gender"),
                    Wrap(
                      spacing: 8,
                      children: [
                        optionButton("Male", controller.selectedGender),
                        optionButton("Female", controller.selectedGender),
                      ],
                    ),

                    // Dating Intentions Section
                    sectionLabel("Dating intentions"),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        intentionButton("Any"),
                        intentionButton("Serious"),
                        intentionButton("Friends"),
                        intentionButton("Casual"),
                      ],
                    ),

                    // Nationality Section
                    sectionLabel("Nationality"),
                    Wrap(
                      spacing: 8,
                      children: [
                        optionButton("SG/PR", controller.selectedNationality),
                        optionButton("Others", controller.selectedNationality),
                      ],
                    ),

                    // Religion Section
                    sectionLabel("Religion"),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        optionButton("Any", controller.selectedReligion, isSmall: true),
                        optionButton("Atheist", controller.selectedReligion, isSmall: true),
                        optionButton("Buddhism", controller.selectedReligion, isSmall: true),
                        optionButton("Christianity", controller.selectedReligion, isSmall: true),
                        optionButton("Islam", controller.selectedReligion, isSmall: true),
                        optionButton("Taoism", controller.selectedReligion, isSmall: true),
                        optionButton("Hinduism", controller.selectedReligion, isSmall: true),
                        optionButton("Others", controller.selectedReligion, isSmall: true),
                      ],
                    ),

                    const SizedBox(height: 24),
                    
                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Save logic
                          Get.snackbar(
                            "Saved",
                            "Your preferences have been saved.",
                            backgroundColor: Colors.green.shade100,
                            colorText: Colors.green.shade800,
                            margin: const EdgeInsets.all(16),
                            borderRadius: 12,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.blue, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}