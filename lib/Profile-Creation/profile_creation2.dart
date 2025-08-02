import 'dart:developer';

import 'package:convo_hearts/Profile-Creation/profile_creation3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

// Controller for managing profile creation state
class ProfileCreation2Controller extends GetxController {
  // Form fields
  var nickname = ''.obs;
  var jobInterests = ''.obs;
  var address = ''.obs;
  var occupation = ''.obs;
  var university = ''.obs;
  var aboutYourself = ''.obs;
  var hobbies = ''.obs;
  var lifestyleInterests = ''.obs;
  var bio = ''.obs;
  
  // Dropdown selections
  var selectedLocation = 'Location'.obs;
  var selectedReglion = 'Religion'.obs;
  
  // Dating Intentions - only one can be selected at a time
  var selectedDatingIntention = ''.obs;
  
  // Age range
  var ageFrom = 18.obs;
  var ageTo = 25.obs;
  
  // Checkboxes
  var isStudent = false.obs;
  var isWorking = false.obs;
  var isOther = false.obs;
  
  // Selected languages
  var selectedLanguages = <String>[].obs;
  
  // Status selection
  var selectedStatus = ''.obs;
  
  // Lifestyle questions
  var selectedSmoking = ''.obs;
  var selectedDrinking = ''.obs;
  var selectedClubs = ''.obs;
  
  // Pet ownership
  var ownsPet = ''.obs; // 'yes', 'no', or ''
  
  // Methods
  void updateNickname(String value) => nickname.value = value;
  void updateJobInterests(String value) => jobInterests.value = value;
  void updateAddress(String value) => address.value = value;
  void updateOccupation(String value) => occupation.value = value;
  void updateUniversity(String value) => university.value = value;
  void updateAboutYourself(String value) => aboutYourself.value = value;
  void updateHobbies(String value) => hobbies.value = value;
  void updateLifestyleInterests(String value) => lifestyleInterests.value = value;
  void updateBio(String value) => bio.value = value;
  
  void updateLocation(String value) => selectedLocation.value = value;
  void updateSubject(String value) => selectedReglion.value = value;
  
  // Dating Intentions methods
  void selectDatingIntention(String intention) {
    selectedDatingIntention.value = intention;
  }
  
  void updateAgeFrom(double value) => ageFrom.value = value.round();
  void updateAgeTo(double value) => ageTo.value = value.round();
  
  void toggleStudent(bool? value) => isStudent.value = value ?? false;
  void toggleWorking(bool? value) => isWorking.value = value ?? false;
  void toggleOther(bool? value) => isOther.value = value ?? false;
  
  // Language selection methods
  void toggleLanguage(String language) {
    if (selectedLanguages.contains(language)) {
      selectedLanguages.remove(language);
    } else {
      selectedLanguages.add(language);
    }
  }
  
  bool isLanguageSelected(String language) {
    return selectedLanguages.contains(language);
  }
  
  // Methods for status and lifestyle
  void selectStatus(String status) => selectedStatus.value = status;
  void selectSmoking(String smoking) => selectedSmoking.value = smoking;
  void selectDrinking(String drinking) => selectedDrinking.value = drinking;
  void selectClubs(String clubs) => selectedClubs.value = clubs;
  void selectPetOwnership(String pet) => ownsPet.value = pet;
  
  void createProfile() {
    
    Get.snackbar(
      'Success',
      'Profile created successfully!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Get.to(()=>ProfileCreation3());
  }
}

class ProfileCreation2 extends StatelessWidget {
  final ProfileCreation2Controller controller = Get.put(ProfileCreation2Controller());

  ProfileCreation2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
        
            Row(
              children: [
                  InkWell(
                onTap: (){
                    Get.back();
                },
                child: SvgPicture.asset("assets/icon/svg/back_arrow.svg"),
              ),
        
              Text("Profile Creation ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                ),
              )
              ],
            ),
              
              // Profile Picture Section
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("assets/images/avatar.jpg")
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xffFA6D8C),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Text(
                  'Edit my AI Avatar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Form Fields
            _buildTextField('Nickname', controller.updateNickname, showCharCount: true, showLabelAbove: F, maxLength: 20),
                  const SizedBox(height: 15),
        
              ElevatedButton(
                onPressed: (){
                  log("upload Picture ");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  minimumSize: Size(280, 50),
                  side: BorderSide(color: Color(0xffFA6D8C)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icon/svg/upload.svg"), 
                    // SizedBox(height: 20,),
                    Text("upload 3 Images (Optional)", style: TextStyle(color: Color(0xffFA6D8C)),)
                  ],
                )
              ),
        
              const SizedBox(height: 20),
        
              // Dating Intentions Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Dating Intentions:',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDatingIntentionChip('Serious'),
                  const SizedBox(width: 8),
                  _buildDatingIntentionChip('Friends'),
                  const SizedBox(width: 8),
                  _buildDatingIntentionChip('Casual'),
                ],
              ),
              
              const SizedBox(height: 20),
        
              // Describe Yourself Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Describe Yourself:',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 15),
              
              _buildTextField('Occupation', controller.updateOccupation, showCharCount: true, maxLength: 20, showLabelAbove: false),
              SizedBox(height: 20,),
              _buildTextField('Hobbies', controller.updateHobbies, showCharCount: true, maxLength: 20, showLabelAbove: false),
              SizedBox(height: 20,),
              _buildTextField('Lifestyle / Interests', controller.updateLifestyleInterests, showCharCount: true, maxLength: 20, showLabelAbove: false),
              SizedBox(height: 20,),
              
              // Bio Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Bio:',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
              ),
        
              const SizedBox(height: 8),
        
              // Bio TextField with character count in row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: controller.updateBio,
                      maxLines: 6,
                      maxLength: 200,
                      decoration: InputDecoration(
                        hintText: 'Write more about yourself',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.pink),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                        counterText: '', // Hide the default counter
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 12), // Align with text field content
                    child: Obx(() => Text(
                      '${controller.bio.value.length}/200',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    )),
                  ),
                ],
              ),
                  const SizedBox(height: 15),
        
              // Dropdowns
              Column(
                children: [
                  _buildDropdown('Location', controller.selectedLocation,"assets/icon/svg/location.svg" ),
                  const SizedBox(height: 15),
                  _buildDropdown('Religion', controller.selectedReglion, "assets/icon/svg/reglion.svg" ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Social/Foreign Language section
              
              const SizedBox(height: 10),
              
        
              // Status Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Status :',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStatusChip('Studying'),
                  const SizedBox(width: 8),
                  _buildStatusChip('Working'),
                  const SizedBox(width: 8),
                  _buildStatusChip('Others'),
                ],
              ),
        
              const SizedBox(height: 20),
        
              // Do you smoke Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Do you smoke ?',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLifestyleChip('Frequent', 'smoking'),
                  const SizedBox(width: 8),
                  _buildLifestyleChip('Occasionally', 'smoking'),
                  const SizedBox(width: 8),
                  _buildLifestyleChip('Never', 'smoking'),
                ],
              ),
        
              const SizedBox(height: 20),
        
              // Do you drink Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Do you drink ?',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLifestyleChip('Frequent', 'drinking'),
                  const SizedBox(width: 8),
                  _buildLifestyleChip('Occasionally', 'drinking'),
                  const SizedBox(width: 8),
                  _buildLifestyleChip('Never', 'drinking'),
                ],
              ),
        
              const SizedBox(height: 20),
        
              // Do you go to clubs Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Do you go to clubs ?',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLifestyleChip('Frequent', 'clubs'),
                  const SizedBox(width: 8),
                  _buildLifestyleChip('Occasionally', 'clubs'),
                  const SizedBox(width: 8),
                  _buildLifestyleChip('Never', 'clubs'),
                ],
              ),
        
              const SizedBox(height: 20),
        
              // Do you own pets Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Do you own pets ?',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  _buildRadioOption('yes', 'Yes'),
                  _buildRadioOption('no', 'No'),
                ],
              ),
        
              const SizedBox(height: 20),
        
              // Voice Prompt Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Voice Prompt (Optional)',
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                    ),
                  ),
                   Container(
                    width: 32, // Set a fixed width for proper positioning
                    height: 32, // Set a fixed height for proper positioning
                    child: Stack(
                      children: [
                        // Main voice command icon
                        Positioned(
                          left: 0,
                          top: 7,
                          child: SvgPicture.asset(
                            "assets/icon/svg/voice_command.svg",
                            width:25,
                            height: 23,
                          ),
                        ),
                        // Plus icon positioned at top-right
                        Positioned(
                          right: 0,
                          top: 0,
                          child: SvgPicture.asset(
                            "assets/icon/svg/voice_command_plus.svg",
                            width: 11,
                            height: 12,
                          ),
                        ),
                      ],
                    ) 
                    
                  ),
                ],
              ),
        
              const SizedBox(height: 30),
        
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Green Flags',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff008000),
                     fontWeight: FontWeight.w700
                     ),
        
                ),
              ),
            const SizedBox(height: 10),
        
              Wrap( 
                spacing: 2,
                runSpacing: 2,
                children: [
                  _buildLanguageChip('Likes to Call'),
                  _buildLanguageChip('Open Communication'),
                  _buildLanguageChip('Trustworthy & Honest'),
                  _buildLanguageChip('Accountability'),
                  _buildLanguageChip('Supportive Behavior'),
                  _buildLanguageChip('Conflict Resolver'),
                  _buildLanguageChip('Flexibilty'),
                  _buildLanguageChip('Sharing Responsibilities'),
           
                ],
              ),
            const SizedBox(height: 30),
        
        
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Red Flags',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xffFF0000),
                     fontWeight: FontWeight.w700
                     ),
        
                ),
              ),
            const SizedBox(height: 10),
        
              Wrap( 
                spacing: 2,
                runSpacing: 2,
                children: [
                  BuildLanguageChip('Dry Texter'),
                  BuildLanguageChip('Lack Communication'),
                  BuildLanguageChip('Bad Anger Management'),
                  BuildLanguageChip('Bad Time Management'),
                  BuildLanguageChip('Avoids Conflict'),
                  BuildLanguageChip('Controlling'),
                  BuildLanguageChip('Unflexible'),
                  BuildLanguageChip('Inconsistent Behavior'),
        
             
                ],
              ),
        
        
        
              
              const SizedBox(height: 30),
        
        
              
              // Create Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.createProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffC672A5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Create',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }


Widget _buildTextField(String label, Function(String) onChanged, {int maxLines = 1, bool showCharCount = false, int? maxLength, bool showLabelAbove = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (showLabelAbove)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
            ),
            if (showCharCount && maxLength != null)
              Obx(() {
                int currentLength = 0;
                if (label.contains('Write more about yourself')) {
                  currentLength = controller.bio.value.length;
                } else if (label == 'Nickname') {
                  currentLength = controller.nickname.value.length;
                } else if (label == 'Occupation') {
                  currentLength = controller.occupation.value.length;
                } else if (label == 'Hobbies') {
                  currentLength = controller.hobbies.value.length;
                } else if (label == 'Lifestyle / Interests') {
                  currentLength = controller.lifestyleInterests.value.length;
                }
                return Text(
                  '$currentLength/$maxLength',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                );
              }),
          ],
        ),
      if (showLabelAbove) const SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onChanged,
              maxLines: maxLines,
              maxLength: maxLength,
              decoration: InputDecoration(
                hintText: showLabelAbove ? null : label,
                hintStyle: TextStyle(
                  color: Colors.grey.shade600, // Changed to proper grey color
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.pink),
                ),
                contentPadding: const EdgeInsets.all(12),
                counterText: '', // Hide the default counter
              ),
            ),
          ),
          if (!showLabelAbove && showCharCount && maxLength != null) ...[
            const SizedBox(width: 10),
            Obx(() {
              int currentLength = 0;
              if (label == 'Nickname') {
                currentLength = controller.nickname.value.length;
              } else if (label == 'Occupation') {
                currentLength = controller.occupation.value.length;
              } else if (label == 'Hobbies') {
                currentLength = controller.hobbies.value.length;
              } else if (label == 'Lifestyle / Interests') {
                currentLength = controller.lifestyleInterests.value.length;
              }
              return Text(
                '$currentLength/$maxLength',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              );
            }),
          ]
        ],
      )
    ],
  );
}



Widget _buildDropdown(String hintlabel, RxString selectedValue, String iconPath) {
  return Obx(() => Container(
    width: double.infinity,
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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




  Widget _buildDatingIntentionChip(String intention) {
    return Obx(() => GestureDetector(
      onTap: () => controller.selectDatingIntention(intention),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFA6D8C) ),
          color: controller.selectedDatingIntention.value == intention 
              ? Color(0xffFA6D8C) 
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          intention,
          style: TextStyle(
            color: controller.selectedDatingIntention.value == intention 
                ? Colors.white 
                : Color(0xffFA6D8C),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ));
  }

  Widget _buildLanguageChip(String language) {
    return Obx(() => GestureDetector(
      onTap: () => controller.toggleLanguage(language),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, ),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff008000)),
          color: controller.isLanguageSelected(language) 
              ? Colors.green 
              : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          language,
          style: TextStyle(
            color: controller.isLanguageSelected(language) 
                ? Colors.white 
                : Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    ));
  }


 Widget BuildLanguageChip(String language) {
    return Obx(() => GestureDetector(
      onTap: () => controller.toggleLanguage(language),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, ),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFF0000)),
          color: controller.isLanguageSelected(language) 
              ? Color(0xffFF0000) 
              : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          language,
          style: TextStyle(
            color: controller.isLanguageSelected(language) 
                ? Colors.white 
                : Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    ));
  }





  Widget _buildStatusChip(String status) {
    return Obx(() => GestureDetector(
      onTap: () => controller.selectStatus(status),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFA6D8C)),
          color: controller.selectedStatus.value == status 
              ? Color(0xffFA6D8C) 
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          status,
          style: TextStyle(
            color: controller.selectedStatus.value == status 
                ? Colors.white 
                : Color(0xffFA6D8C),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ));
  }

  Widget _buildLifestyleChip(String option, String category) {
    return Obx(() {
      bool isSelected = false;
      switch (category) {
        case 'smoking':
          isSelected = controller.selectedSmoking.value == option;
          break;
        case 'drinking':
          isSelected = controller.selectedDrinking.value == option;
          break;
        case 'clubs':
          isSelected = controller.selectedClubs.value == option;
          break;
      }
      
      return GestureDetector(
        onTap: () {
          switch (category) {
            case 'smoking':
              controller.selectSmoking(option);
              break;
            case 'drinking':
              controller.selectDrinking(option);
              break;
            case 'clubs':
              controller.selectClubs(option);
              break;
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffFA6D8C)),
            color: isSelected ? Color(0xffFA6D8C) : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            option,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xffFA6D8C),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildRadioOption(String value, String label) {
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => controller.selectPetOwnership(value),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xffFA6D8C),
                  width: 2,
                ),
                color: controller.ownsPet.value == value 
                    ? Color(0xffFA6D8C) 
                    : Colors.white,
              ),
              child: controller.ownsPet.value == value
                  ? const Icon(
                      Icons.circle,
                      size: 12,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ));
  }
}