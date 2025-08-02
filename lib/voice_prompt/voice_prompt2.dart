import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VoicePrompt2Controller extends GetxController {
  var question = ''.obs;

  void updateQuestion(String value) {
    if (value.length <= 40) {
      question.value = value;
    }
  }

  void startRecording() {
    // TODO: Implement voice recording start
    print("Recording started...");
  }

  void stopRecording() {
    // TODO: Implement voice recording stop
    print("Recording stopped.");
  }
}



class VoicePrompt2RecordScreen extends StatelessWidget {
  VoicePrompt2RecordScreen({super.key});

  final controller = Get.put(VoicePrompt2Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Back button and title
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset("assets/icon/svg/back_arrow.svg"),
                  ),
                  const SizedBox(width: 16),
                  
                ],
              ),
              Center(
                child: const Text(
                      "Voice Prompts",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
              ),
              const SizedBox(height: 16),

              /// Info text
              const Text(
                
                '*Voice prompts is an optional feature where you answer questions here with your voice. Your voice will be added to your profile for everyone else to hear',
                style: TextStyle(fontSize: 12, color: Color(0xff505050)),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              /// Input field with dynamic count

                    Obx(
                  () => TextField(
                    onChanged: controller.updateQuestion,
                    maxLength: 40,
                    decoration: InputDecoration(
                      hintText: 'What do i think of first dates?',
                      counterText: '', // Hides default counter
                      contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      suffix: Text(
                        '${controller.question.value.length}/40',
                        style: const TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xff505050))
                      ),
                    ),
                  ),
                ),


              const SizedBox(height: 40),

              /// Record mic
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        // Get.to(()=>)
                      },
                      onLongPress: controller.startRecording,
                      onLongPressEnd: (_) => controller.stopRecording(),
                      child: Container(
                        height: 80,
                        width: 80
                        ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Color(0xff505050), width: 2),
                          color: Color(0xffEEBCBC)
                        ),
                        child: Image.asset("assets/images/speaker.png"),)
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Replay to hear your voice!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,fontSize: 15,fontWeight: FontWeight.w300, color: Colors.black54),
                    ),

              const SizedBox(height: 30),

                    ElevatedButton(onPressed: (){}, 
                     style: ElevatedButton.styleFrom(
                      shadowColor: const Color.fromARGB(223, 0, 0, 0),
                      backgroundColor: Colors.white, // Approximate color based on image
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(285, 50),
                    ),
                    child: Text(
                      "Redo",
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color(0xff505050),
                      ),
                    ),),

                    const SizedBox(height: 30),

ElevatedButton(onPressed: (){}, 
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffC672A5), // Approximate color based on image
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(285, 50),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),)


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
