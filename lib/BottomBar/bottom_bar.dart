// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// // Controller
// class BottomNavController extends GetxController {
//   var selectedIndex = 0.obs;

//   void changeTabIndex(int index) {
//     selectedIndex.value = index;
//   }
// }

// // Main Widget
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(BottomNavController());

//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: Obx(() => _getSelectedPage(controller.selectedIndex.value)),
//      bottomNavigationBar: Obx(() => CurvedBottomNavigationBar(
//   currentIndex: controller.selectedIndex.value,
//   onTap: controller.changeTabIndex,
// )),




//     );
//   }

//   Widget _getSelectedPage(int index) {
//     return [
//       MatchesPage(),
//       NewsletterPage(),
//       CafeConnectPage(),
//       ChatsPage(),
//       ProfilePage()
//     ][index];
//   }
// }

// // Curved Bottom Navigation Bar
// class CurvedBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;


//   const CurvedBottomNavigationBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 90,
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.bottomCenter,
//         children: [
//           // Background with curved shape
//           CustomPaint(
//             size: Size(MediaQuery.of(context).size.width, 90),
//             painter: CurvedBottomBarPainter(),
//           ),

//           // Navigation items
//           // Navigation items (restructured using one Row with 5 Columns)
// Positioned.fill(
//   top: 10,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: List.generate(5, (index) {
//       if (index == 2) {
//         // Center CafeConnect item, elevated
//         return SizedBox(
//           width: 60,
//           child: GestureDetector(
//             onTap: () => onTap(2),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Transform.translate(
//                   offset: const Offset(0, -20), // elevate above slope
//                   child: Image.asset(
//                     "assets/images/cup_coffee.jpg",
//                     // width: 40,
//                     // height: 40,
//                   ),
//                 ),
//                 // const SizedBox(height: 4),
//                 Text(
//                   'CafeConnect',
//                   style: TextStyle(
//                     fontSize: 8,
//                     color: currentIndex == 2
//                         ? const Color(0xff3771C8)
//                         : const Color(0xff000000),
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       } else {
//         // Other navigation items
//         final iconPaths = [
//           "assets/icon/svg/herats.svg",
//           "assets/icon/svg/newsletter.svg",
//           "", // center item
//           "assets/icon/svg/message.svg",
//           "assets/icon/svg/profile.svg"
//         ];

//         final labels = ["Matches", "Newsletter", "", "Chats", "Profile"];

//         int actualIndex = index > 2 ? index : index;

//         return Expanded(
//           child: GestureDetector(
//             onTap: () => onTap(index),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SvgPicture.asset(
//                   iconPaths[index],
//                   width: 24,
//                   height: 24,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   labels[index],
//                   style: TextStyle(
//                     fontSize: 11,
//                     color: currentIndex == index
//                         ? const Color(0xff3771C8)
//                         : const Color(0xff000000),
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }
//     }),
//   ),
// ),

//         ],
//       ),
//     );
//   }

// Widget _buildSvgIcon(String assetPath, {double size = 24}) {
//   return SvgPicture.asset(
//     assetPath,
//     width: size,
//     height: size,
//     // No color applied — will render original SVG colors
//   );
// }

// Widget _buildNavItem(
//   int index,
//   String svgAssetPath,
//   String label, {
//   bool showBadge = false,
// }) {
//   bool isSelected = currentIndex == index;

//   return GestureDetector(
//     onTap: () => onTap(index),
//     child: Padding(
//       padding: const EdgeInsets.only(top: 15),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SvgPicture.asset(
//             svgAssetPath,
//             width: 24,
//             height: 24,
//             ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 11,
//               color: isSelected ? Color(0xff3771C8) : Color(0xff000000),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }


// class CurvedBottomBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     final path = Path();
//     path.moveTo(0, 20);
//     path.lineTo(size.width * 0.25, 20);

//     // Create oval-shaped curve - left side
//     path.quadraticBezierTo(
//       size.width * 0.35, -15, // First control point for oval shape
//       size.width * 0.50, -15, // Center peak of oval
//     );

//     // Create oval-shaped curve - right side
//     path.quadraticBezierTo(
//       size.width * 0.65, -15, // Second control point for oval shape
//       size.width * 0.75, 20,  // End point back to baseline
//     );

//     path.lineTo(size.width, 20);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawShadow(path, const Color.fromARGB(255, 233, 18, 18), 4, false);
//     canvas.drawPath(path, paint);

//     final borderPaint = Paint()
//       ..color = Colors.grey.shade300
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;
//     canvas.drawPath(path, borderPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// // Sample pages for each tab
// class MatchesPage extends StatelessWidget {
//   const MatchesPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.favorite, size: 100, color: Colors.pink),
//           SizedBox(height: 20),
//           Text(
//             'Matches',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NewsletterPage extends StatelessWidget {
//   const NewsletterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.article, size: 100, color: Colors.blue),
//           SizedBox(height: 20),
//           Text(
//             'Newsletter',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CafeConnectPage extends StatelessWidget {
//   const CafeConnectPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: SvgPicture.asset(
//               "assets/icon/svg/cup_coffee.svg",
//               width: 60,
//               height: 60,
//               errorBuilder: (context, error, stackTrace) {
//                 return Icon(Icons.coffee, size: 60, color: Colors.white);
//               },
//             ),
//           ),
//           SizedBox(height: 60),
//           Text(
//             'CafeConnect',
//             style: TextStyle(
//               fontSize: 24, 
//               fontWeight: FontWeight.bold,
//               color: Colors.orange.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatsPage extends StatelessWidget {
//   const ChatsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.chat_bubble, size: 100, color: Colors.green),
//           SizedBox(height: 20),
//           Text(
//             'Chats',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Stack(
//             children: [
//               Icon(Icons.person, size: 100, color: Colors.blue.shade600),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   width: 20,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Text(
//                       '1',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Profile',
//             style: TextStyle(
//               fontSize: 24, 
//               fontWeight: FontWeight.bold,
//               color: Colors.blue.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// // Controller
// class BottomNavController extends GetxController {
//   var selectedIndex = 0.obs;

//   void changeTabIndex(int index) {
//     selectedIndex.value = index;
//   }
// }

// // Main Widget
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(BottomNavController());

//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: Obx(() => _getSelectedPage(controller.selectedIndex.value)),
//       bottomNavigationBar: Obx(() => CurvedBottomNavigationBar(
//         currentIndex: controller.selectedIndex.value,
//         onTap: controller.changeTabIndex,
//       )),
//     );
//   }

//   Widget _getSelectedPage(int index) {
//     return [
//       MatchesPage(),
//       NewsletterPage(),
//       CafeConnectPage(),
//       ChatsPage(),
//       ProfilePage()
//     ][index];
//   }
// }

// // Curved Bottom Navigation Bar
// class CurvedBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CurvedBottomNavigationBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth > 600;
//     final bottomNavHeight = isTablet ? 110.0 : 90.0;
    
//     return SizedBox(
//       height: bottomNavHeight,
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.bottomCenter,
//         children: [
//           // Background with curved shape
//           CustomPaint(
//             size: Size(screenWidth, bottomNavHeight),
//             painter: CurvedBottomBarPainter(),
//           ),

//           // Navigation items (restructured using one Row with 5 Columns)
//           Positioned.fill(
//             top: isTablet ? 15 : 10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(5, (index) {
//                 if (index == 2) {
//                   // Center CafeConnect item, elevated
//                   return SizedBox(
//                     width: isTablet ? 80 : 60,
//                     child: GestureDetector(
//                       onTap: () => onTap(2),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                         Stack(children: [
//                             Transform.translate(
//                             offset: Offset(0, isTablet ? -28 : -33), // elevate above slope
//                             child: Image.asset(
//                               "assets/images/cup_coffee.jpg",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 8,
//                               child: Text(
//                                 'CafeConnect',
//                                 style: TextStyle(
//                                   fontSize: _getResponsiveFontSize(screenWidth, 11),
//                                   color: currentIndex == 2
//                                       ? const Color(0xff3771C8)
//                                       : const Color(0xff000000),
//                                   fontWeight: FontWeight.w500,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ],)
//                         ],
//                       ),
//                     ),
//                   );
//                 } else {
//                   // Other navigation items
//                   final iconPaths = [
//                     "assets/icon/svg/herats.svg",
//                     "assets/icon/svg/newsletter.svg",
//                     "", // center item
//                     "assets/icon/svg/message.svg",
//                     "assets/icon/svg/profile.svg"
//                   ];

//                   final labels = ["Matches", "Newsletter", "", "Chats", "Profile"];

//                   return Expanded(
//                     child: GestureDetector(
//                       onTap: () => onTap(index),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           SvgPicture.asset(
//                             iconPaths[index],
//                             width: _getResponsiveIconSize(screenWidth),
//                             height: _getResponsiveIconSize(screenWidth),
//                           ),
//                           SizedBox(height: isTablet ? 6 : 4),
//                           Text(
//                             labels[index],
//                             style: TextStyle(
//                               fontSize: _getResponsiveFontSize(screenWidth, 11),
//                               color: currentIndex == index
//                                   ? const Color(0xff3771C8)
//                                   : const Color(0xff000000),
//                               fontWeight: FontWeight.w500,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   double _getResponsiveIconSize(double screenWidth) {
//     if (screenWidth > 600) return 28; // Tablet
//     if (screenWidth > 400) return 24; // Large phone
//     return 20; // Small phone
//   }

//   double _getResponsiveFontSize(double screenWidth, double baseFontSize) {
//     if (screenWidth > 600) return baseFontSize + 2; // Tablet
//     if (screenWidth > 400) return baseFontSize; // Large phone
//     return baseFontSize - 1; // Small phone
//   }

//   Widget _buildSvgIcon(String assetPath, {double size = 24}) {
//     return SvgPicture.asset(
//       assetPath,
//       width: size,
//       height: size,
//       // No color applied — will render original SVG colors
//     );
//   }

//   Widget _buildNavItem(
//     int index,
//     String svgAssetPath,
//     String label, {
//     bool showBadge = false,
//   }) {
//     bool isSelected = currentIndex == index;

//     return GestureDetector(
//       onTap: () => onTap(index),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 15),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(
//               svgAssetPath,
//               width: 24,
//               height: 24,
//             ),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 11,
//                 color: isSelected ? Color(0xff3771C8) : Color(0xff000000),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CurvedBottomBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     final path = Path();
//     final curveDepth = size.height * 0.4; // Responsive curve depth
    
//     path.moveTo(0, 20);
//     path.lineTo(size.width * 0.25, 20);

//     // Create oval-shaped curve - left side
//     path.quadraticBezierTo(
//       size.width * 0.35, -curveDepth * 0.75, // First control point for oval shape
//       size.width * 0.50, -curveDepth * 0.75, // Center peak of oval
//     );

//     // Create oval-shaped curve - right side
//     path.quadraticBezierTo(
//       size.width * 0.65, -curveDepth * 0.75, // Second control point for oval shape
//       size.width * 0.75, 20,  // End point back to baseline
//     );

//     path.lineTo(size.width, 20);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawShadow(path, const Color.fromARGB(255, 233, 18, 18), 4, false);
//     canvas.drawPath(path, paint);

//     final borderPaint = Paint()
//       ..color = Colors.grey.shade300
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;
//     canvas.drawPath(path, borderPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// // Sample pages for each tab
// class MatchesPage extends StatelessWidget {
//   const MatchesPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.favorite, size: 100, color: Colors.pink),
//           SizedBox(height: 20),
//           Text(
//             'Matches',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NewsletterPage extends StatelessWidget {
//   const NewsletterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.article, size: 100, color: Colors.blue),
//           SizedBox(height: 20),
//           Text(
//             'Newsletter',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CafeConnectPage extends StatelessWidget {
//   const CafeConnectPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: SvgPicture.asset(
//               "assets/icon/svg/cup_coffee.svg",
//               width: 60,
//               height: 60,
//               errorBuilder: (context, error, stackTrace) {
//                 return Icon(Icons.coffee, size: 60, color: Colors.white);
//               },
//             ),
//           ),
//           SizedBox(height: 60),
//           Text(
//             'CafeConnect',
//             style: TextStyle(
//               fontSize: 24, 
//               fontWeight: FontWeight.bold,
//               color: Colors.orange.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatsPage extends StatelessWidget {
//   const ChatsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.chat_bubble, size: 100, color: Colors.green),
//           SizedBox(height: 20),
//           Text(
//             'Chats',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Stack(
//             children: [
//               Icon(Icons.person, size: 100, color: Colors.blue.shade600),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   width: 20,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Text(
//                       '1',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Profile',
//             style: TextStyle(
//               fontSize: 24, 
//               fontWeight: FontWeight.bold,
//               color: Colors.blue.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

















// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// // Controller
// class BottomNavController extends GetxController {
//   var selectedIndex = 0.obs;

//   void changeTabIndex(int index) {
//     selectedIndex.value = index;
//   }
// }

// // Main Widget
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(BottomNavController());

//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: Obx(() => _getSelectedPage(controller.selectedIndex.value)),
//       bottomNavigationBar: Obx(() => CurvedBottomNavigationBar(
//         currentIndex: controller.selectedIndex.value,
//         onTap: controller.changeTabIndex,
//       )),
//     );
//   }

//   Widget _getSelectedPage(int index) {
//     return [
//       MatchesPage(),
//       NewsletterPage(),
//       CafeConnectPage(),
//       ChatsPage(),
//       ProfilePage()
//     ][index];
//   }
// }

// // Curved Bottom Navigation Bar
// class CurvedBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CurvedBottomNavigationBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth > 600;
//     final bottomNavHeight = isTablet ? 140.0 : 120.0;
    
//     return SizedBox(
//       height: bottomNavHeight,
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.bottomCenter,
//         children: [
//           // Background with curved shape
//           CustomPaint(
//             size: Size(screenWidth, bottomNavHeight),
//             painter: CurvedBottomBarPainter(),
//           ),

//           // Navigation items (restructured using one Row with 5 Columns)
//           Positioned.fill(
//             top: isTablet ? 15 : 10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(5, (index) {
//                 if (index == 2) {
//                   // Center CafeConnect item, elevated
//                   return SizedBox(
//                     width: isTablet ? 80 : 60,
//                     child: GestureDetector(
//                       onTap: () => onTap(2),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                         Stack(children: [
                          
//                         // SizedBox(height: 5,),
//                         Positioned(
//                           bottom: 0,
//                           child: Text(
//                           'CafeConnect',
//                           style: TextStyle(
//                             fontSize: _getResponsiveFontSize(screenWidth, 11),
//                             color: currentIndex == 2
//                                 ? const Color(0xff3771C8)
//                                 : const Color(0xff000000),
//                             fontWeight: FontWeight.w500,
//                             ),
//                             textAlign: TextAlign.center,
//                             ),
//                         ),
//                         Transform.translate(
//                         offset: Offset(0, isTablet ? -25 : -25), // Reduced elevation to match flatter curve
//                         child: Image.asset(
//                           "assets/images/cup_coffee.jpg",
//                           fit: BoxFit.contain,
//                           height: 50,
//                         ),
//                         ),
//                         ],)
//                         ],
//                       ),
//                     ),
//                   );
//                 } else {
//                   // Other navigation items
//                   final iconPaths = [
//                     "assets/icon/svg/herats.svg",
//                     "assets/icon/svg/newsletter.svg",
//                     "", // center item
//                     "assets/icon/svg/message.svg",
//                     "assets/icon/svg/profile.svg"
//                   ];

//                   final labels = ["Matches", "Newsletter", "", "Chats", "Profile"];

//                   return Expanded(
//                     child: GestureDetector(
//                       onTap: () => onTap(index),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           SvgPicture.asset(
//                             iconPaths[index],
//                             width: _getResponsiveIconSize(screenWidth),
//                             height: _getResponsiveIconSize(screenWidth),
//                           ),
//                           SizedBox(height: isTablet ? 6 : 4),
//                           Text(
//                             labels[index],
//                             style: TextStyle(
//                               fontSize: _getResponsiveFontSize(screenWidth, 11),
//                               color: currentIndex == index
//                                   ? const Color(0xff3771C8)
//                                   : const Color(0xff000000),
//                               fontWeight: FontWeight.w500,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   double _getResponsiveIconSize(double screenWidth) {
//     if (screenWidth > 600) return 28; // Tablet
//     if (screenWidth > 400) return 24; // Large phone
//     return 20; // Small phone
//   }

//   double _getResponsiveFontSize(double screenWidth, double baseFontSize) {
//     if (screenWidth > 600) return baseFontSize + 2; // Tablet
//     if (screenWidth > 400) return baseFontSize; // Large phone
//     return baseFontSize - 1; // Small phone
//   }

//   Widget _buildSvgIcon(String assetPath, {double size = 24}) {
//     return SvgPicture.asset(
//       assetPath,
//       width: size,
//       height: size,
//       // No color applied — will render original SVG colors
//     );
//   }

//   Widget _buildNavItem(
//     int index,
//     String svgAssetPath,
//     String label, {
//     bool showBadge = false,
//   }) {
//     bool isSelected = currentIndex == index;

//     return GestureDetector(
//       onTap: () => onTap(index),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 15),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(
//               svgAssetPath,
//               width: 24,
//               height: 24,
//             ),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 11,
//                 color: isSelected ? Color(0xff3771C8) : Color(0xff000000),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CurvedBottomBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     final path = Path();
//     final curveDepth = size.height * 0.15; // Much flatter curve to match reference image
    
//     // Start from left edge
//     path.moveTo(0, 15);
    
//     // Left side leading to curve
//     path.lineTo(size.width * 0.3, 15);

//     // Gentle curve for center - flatter and wider like reference image
//     path.quadraticBezierTo(
//       size.width * 0.4, -curveDepth, // Left control point - much gentler
//       size.width * 0.5, -curveDepth,  // Center peak - very shallow
//     );

//     path.quadraticBezierTo(
//       size.width * 0.6, -curveDepth, // Right control point - much gentler
//       size.width * 0.7, 15,          // Right side back to baseline
//     );

//     // Right side to edge
//     path.lineTo(size.width, 15);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     // Subtle shadow like in reference image
//     canvas.drawShadow(path, Colors.black.withOpacity(0.1), 3, false);
//     canvas.drawPath(path, paint);

//     // Very light border
//     final borderPaint = Paint()
//       ..color = Colors.grey.shade200
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 0.5;
//     canvas.drawPath(path, borderPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// // Sample pages for each tab
// class MatchesPage extends StatelessWidget {
//   const MatchesPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.favorite, size: 100, color: Colors.pink),
//           SizedBox(height: 20),
//           Text(
//             'Matches',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NewsletterPage extends StatelessWidget {
//   const NewsletterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.article, size: 100, color: Colors.blue),
//           SizedBox(height: 20),
//           Text(
//             'Newsletter',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CafeConnectPage extends StatelessWidget {
//   const CafeConnectPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: SvgPicture.asset(
//               "assets/icon/svg/cup_coffee.svg",
//               width: 60,
//               height: 60,
//               errorBuilder: (context, error, stackTrace) {
//                 return Icon(Icons.coffee, size: 60, color: Colors.white);
//               },
//             ),
//           ),
//           SizedBox(height: 60),
//           Text(
//             'CafeConnect',
//             style: TextStyle(
//               fontSize: 24, 
//               fontWeight: FontWeight.bold,
//               color: Colors.orange.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatsPage extends StatelessWidget {
//   const ChatsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.chat_bubble, size: 100, color: Colors.green),
//           SizedBox(height: 20),
//           Text(
//             'Chats',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Stack(
//             children: [
//               Icon(Icons.person, size: 100, color: Colors.blue.shade600),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   width: 20,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Text(
//                       '1',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Profile',
//             style: TextStyle(
//               fontSize: 24, 
//               fontWeight: FontWeight.bold,
//               color: Colors.blue.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }










// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// // Controller
// class BottomNavController extends GetxController {
//   var selectedIndex = 0.obs;

//   void changeTabIndex(int index) {
//     selectedIndex.value = index;
//   }
// }

// // Main Widget
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(BottomNavController());

//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: Obx(() => _getSelectedPage(controller.selectedIndex.value)),
//       bottomNavigationBar: Obx(() => CurvedBottomNavigationBar(
//         currentIndex: controller.selectedIndex.value,
//         onTap: controller.changeTabIndex,
//       )),
//     );
//   }

//   Widget _getSelectedPage(int index) {
//     return [
//       MatchesPage(),
//       NewsletterPage(),
//       CafeConnectPage(),
//       ChatsPage(),
//       ProfilePage()
//     ][index];
//   }
// }

// // Curved Bottom Navigation Bar
// class CurvedBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CurvedBottomNavigationBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth > 600;
//     final bottomNavHeight = isTablet ? 140.0 : 115.0;
    
//     return SizedBox(
//       height: bottomNavHeight,
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.bottomCenter,
//         children: [
//           // Background with curved shape
//           CustomPaint(
//             size: Size(screenWidth, bottomNavHeight),
//             painter: CurvedBottomBarPainter(),
//           ),

//           // Navigation items (restructured using one Row with 5 Columns)
//           Positioned.fill(
//             top: isTablet ? 25 : 18,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(5, (index) {
//                 if (index == 2) {
//                   // Center CafeConnect item, elevated
//                   return SizedBox(
//                     width: isTablet ? 100 : 80,
//                     child: GestureDetector(
//                       onTap: () => onTap(2),
//                       child: Column(
//                         // mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                         Stack(
//                           children: [
//                             Transform.translate(
//                             offset: Offset(0, isTablet ? -40 : -20), // Reduced elevation to match flatter curve
//                             child: Image.asset(
//                               "assets/images/cup_coffee.jpg",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                           SizedBox(height: 10,),
//                           Positioned(
//                             bottom: 0,
//                               child: Text(
//                                 'CafeConnect',
//                                 style: TextStyle(
//                                   fontSize: _getResponsiveFontSize(screenWidth, 11),
//                                   color: currentIndex == 2
//                                       ? const Color(0xff3771C8)
//                                       : const Color(0xff000000),
//                                   fontWeight: FontWeight.w500,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ],)
//                         ],
//                       ),
//                     ),
//                   );
//                 } else {
//                   // Other navigation items
//                   final iconPaths = [
//                     "assets/icon/svg/herats.svg",
//                     "assets/icon/svg/newsletter.svg",
//                     "", // center item
//                     "assets/icon/svg/message.svg",
//                     "assets/icon/svg/profile.svg"
//                   ];

//                   final labels = ["Matches", "Newsletter", "", "Chats", "Profile"];

//                   return Expanded(
//                     child: GestureDetector(
//                       onTap: () => onTap(index),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           SvgPicture.asset(
//                             iconPaths[index],
//                             width: _getResponsiveIconSize(screenWidth),
//                             height: _getResponsiveIconSize(screenWidth),
//                           ),
//                           SizedBox(height: isTablet ? 6 : 4),
//                           Text(
//                             labels[index],
//                             style: TextStyle(
//                               fontSize: _getResponsiveFontSize(screenWidth, 11),
//                               color: currentIndex == index
//                                   ? const Color(0xff3771C8)
//                                   : const Color(0xff000000),
//                               fontWeight: FontWeight.w500,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   double _getResponsiveIconSize(double screenWidth) {
//     if (screenWidth > 600) return 28; // Tablet
//     if (screenWidth > 400) return 24; // Large phone
//     return 20; // Small phone
//   }

//   double _getResponsiveFontSize(double screenWidth, double baseFontSize) {
//     if (screenWidth > 600) return baseFontSize + 2; // Tablet
//     if (screenWidth > 400) return baseFontSize; // Large phone
//     return baseFontSize - 1; // Small phone
//   }

//   Widget _buildSvgIcon(String assetPath, {double size = 24}) {
//     return SvgPicture.asset(
//       assetPath,
//       width: size,
//       height: size,
//       // No color applied — will render original SVG colors
//     );
//   }

//   Widget _buildNavItem(
//     int index,
//     String svgAssetPath,
//     String label, {
//     bool showBadge = false,
//   }) {
//     bool isSelected = currentIndex == index;

//     return GestureDetector(
//       onTap: () => onTap(index),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 15),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(
//               svgAssetPath,
//               width: 24,
//               height: 24,
//             ),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 11,
//                 color: isSelected ? Color(0xff3771C8) : Color(0xff000000),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CurvedBottomBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     final path = Path();
//     final curveDepth = size.height * 0.15; // Much flatter curve to match reference image
    
//     // Start from left edge
//     path.moveTo(0, 15);
    
//     // Left side leading to curve
//     path.lineTo(size.width * 0.3, 15);

//     // Gentle curve for center - flatter and wider like reference image
//     path.quadraticBezierTo(
//       size.width * 0.4, -curveDepth, // Left control point - much gentler
//       size.width * 0.5, -curveDepth,  // Center peak - very shallow
//     );

//     path.quadraticBezierTo(
//       size.width * 0.6, -curveDepth, // Right control point - much gentler
//       size.width * 0.7, 15,          // Right side back to baseline
//     );

//     // Right side to edge
//     path.lineTo(size.width, 15);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     // Subtle shadow like in reference image
//     canvas.drawShadow(path, Colors.black.withOpacity(0.1), 3, false);
//     canvas.drawPath(path, paint);

//     // Very light border
//     final borderPaint = Paint()
//       ..color = Colors.grey.shade200
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 0.5;
//     canvas.drawPath(path, borderPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// // Sample pages for each tab
// class MatchesPage extends StatelessWidget {
//   const MatchesPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.favorite, size: 100, color: Colors.pink),
//           SizedBox(height: 20),
//           Text(
//             'Matches',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NewsletterPage extends StatelessWidget {
//   const NewsletterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.article, size: 100, color: Colors.blue),
//           SizedBox(height: 20),
//           Text(
//             'Newsletter',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CafeConnectPage extends StatelessWidget {
//   const CafeConnectPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: SvgPicture.asset(
//               "assets/icon/svg/cup_coffee.svg",
//               width: 60,
//               height: 60,
//               errorBuilder: (context, error, stackTrace) {
//                 return Icon(Icons.coffee, size: 60, color: Colors.white);
//               },
//             ),
//           ),
//           SizedBox(height: 60),
//           Text(
//             'CafeConnect',
//             style: TextStyle(
//               fontSize: 24, 
//               fontWeight: FontWeight.bold,
//               color: Colors.orange.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatsPage extends StatelessWidget {
//   const ChatsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.chat_bubble, size: 100, color: Colors.green),
//           SizedBox(height: 20),
//           Text(
//             'Chats',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Stack(
//             children: [
//               Icon(Icons.person, size: 100, color: Colors.blue.shade600),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   width: 20,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Text(
//                       '1',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Profile',
//             style: TextStyle(
//               fontSize: 24, 
//               fontWeight: FontWeight.bold,
//               color: Colors.blue.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



















// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// // Controller
// class BottomNavController extends GetxController {
//   var selectedIndex = 0.obs;

//   void changeTabIndex(int index) {
//     selectedIndex.value = index;
//   }
// }

// // Main Widget
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(BottomNavController());

//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: Obx(() => _getSelectedPage(controller.selectedIndex.value)),
//       bottomNavigationBar: Obx(() => CurvedBottomNavigationBar(
//         currentIndex: controller.selectedIndex.value,
//         onTap: controller.changeTabIndex,
//       )),
//     );
//   }

//   Widget _getSelectedPage(int index) {
//     return [
//       MatchesPage(),
//       NewsletterPage(),
//       CafeConnectPage(),
//       ChatsPage(),
//       ProfilePage()
//     ][index];
//   }
// }

// // Curved Bottom Navigation Bar
// class CurvedBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CurvedBottomNavigationBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth > 600;
//     final bottomNavHeight = isTablet ? 140.0 : 110.0;
    
//     return SizedBox(
//       height: bottomNavHeight,
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.bottomCenter,
//         children: [
//           // Background with curved shape
//           CustomPaint(
//             size: Size(screenWidth, bottomNavHeight),
//             painter: CurvedBottomBarPainter(),
//           ),

//           // Navigation items (restructured using one Row with 5 Columns)
//           Positioned.fill(
//             top: isTablet ? 25 : 18,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(5, (index) {
//                 if (index == 2) {
//                   // Center CafeConnect item, elevated
//                   return SizedBox(
//                     width: isTablet ? 80 : 60,
//                     child: GestureDetector(
//                       onTap: () => onTap(2),
//                       child: Column(
//                         // mainAxisSize: MainAxisSize.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                         Image.asset(
//                           "assets/images/cup_coffee.jpg",
//                           fit: BoxFit.contain,
//                         ),
//                                                   Text(
//                         'CafeConnect',
//                         style: TextStyle(
//                           fontSize: _getResponsiveFontSize(screenWidth, 8),
//                           color: currentIndex == 2
//                               ? const Color(0xff3771C8)
//                               : const Color(0xff000000),
//                           fontWeight: FontWeight.w500,
//                                                   ),
//                                                   textAlign: TextAlign.center,
//                                                   )
//                         ],
//                       ),
//                     ),
//                   );
//                 } else {
//                   // Other navigation items
//                   final iconPaths = [
//                     "assets/icon/svg/herats.svg",
//                     "assets/icon/svg/newsletter.svg",
//                     "", // center item
//                     "assets/icon/svg/message.svg",
//                     "assets/icon/svg/profile.svg"
//                   ];

//                   final labels = ["Matches", "Newsletter", "", "Chats", "Profile"];

//                   return Expanded(
//                     child: GestureDetector(
//                       onTap: () => onTap(index),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           SvgPicture.asset(
//                             iconPaths[index],
//                             width: _getResponsiveIconSize(screenWidth),
//                             height: _getResponsiveIconSize(screenWidth),
//                           ),
//                           SizedBox(height: isTablet ? 6 : 4),
//                           Text(
//                             labels[index],
//                             style: TextStyle(
//                               fontSize: _getResponsiveFontSize(screenWidth, 11),
//                               color: currentIndex == index
//                                   ? const Color(0xff3771C8)
//                                   : const Color(0xff000000),
//                               fontWeight: FontWeight.w500,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   double _getResponsiveIconSize(double screenWidth) {
//     if (screenWidth > 600) return 28; // Tablet
//     if (screenWidth > 400) return 24; // Large phone
//     return 20; // Small phone
//   }

//   double _getResponsiveFontSize(double screenWidth, double baseFontSize) {
//     if (screenWidth > 600) return baseFontSize + 2; // Tablet
//     if (screenWidth > 400) return baseFontSize; // Large phone
//     return baseFontSize - 1; // Small phone
//   }

//   Widget _buildSvgIcon(String assetPath, {double size = 24}) {
//     return SvgPicture.asset(
//       assetPath,
//       width: size,
//       height: size,
//       // No color applied — will render original SVG colors
//     );
//   }

//   Widget _buildNavItem(
//     int index,
//     String svgAssetPath,
//     String label, {
//     bool showBadge = false,
//   }) {
//     bool isSelected = currentIndex == index;

//     return GestureDetector(
//       onTap: () => onTap(index),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 15),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(
//               svgAssetPath,
//               width: 24,
//               height: 24,
//             ),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 11,
//                 color: isSelected ? Color(0xff3771C8) : Color(0xff000000),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class CurvedBottomBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     final path = Path();
//     final curveDepth = size.height * 0.15; // Much flatter curve to match reference image
    
//     // Start from left edge
//     path.moveTo(0, 15);
    
//     // Left side leading to curve
//     path.lineTo(size.width * 0.3, 15);

//     // Gentle curve for center - flatter and wider like reference image
//     path.quadraticBezierTo(
//       size.width * 0.4, -curveDepth, // Left control point - much gentler
//       size.width * 0.5, -curveDepth,  // Center peak - very shallow
//     );

//     path.quadraticBezierTo(
//       size.width * 0.6, -curveDepth, // Right control point - much gentler
//       size.width * 0.7, 15,          // Right side back to baseline
//     );

//     // Right side to edge
//     path.lineTo(size.width, 15);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     // Subtle shadow like in reference image
//     canvas.drawShadow(path, Colors.black.withOpacity(0.1), 3, false);
//     canvas.drawPath(path, paint);

//     // Very light border
//     final borderPaint = Paint()
//       ..color = Colors.grey.shade200
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 0.5;
//     canvas.drawPath(path, borderPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// // Sample pages for each tab
// class MatchesPage extends StatelessWidget {
//   const MatchesPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.favorite, size: 100, color: Colors.pink),
//           SizedBox(height: 20),
//           Text(
//             'Matches',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NewsletterPage extends StatelessWidget {
//   const NewsletterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.article, size: 100, color: Colors.blue),
//           SizedBox(height: 20),
//           Text(
//             'Newsletter',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CafeConnectPage extends StatelessWidget {
//   const CafeConnectPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: SvgPicture.asset(
//               "assets/icon/svg/cup_coffee.svg",
//               width: 60,
//               height: 60,
//               errorBuilder: (context, error, stackTrace) {
//                 return Icon(Icons.coffee, size: 60, color: Colors.white);
//               },
//             ),
//           ),
//           SizedBox(height: 60),
//           Text(
//             'CafeConnect',
//             style: TextStyle(
//               fontSize: 24, 
//               fontWeight: FontWeight.bold,
//               color: Colors.orange.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatsPage extends StatelessWidget {
//   const ChatsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.chat_bubble, size: 100, color: Colors.green),
//           SizedBox(height: 20),
//           Text(
//             'Chats',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Stack(
//             children: [
//               Icon(Icons.person, size: 100, color: Colors.blue.shade600),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   width: 20,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Text(
//                       '1',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Profile',
//             style: TextStyle(
//               fontSize: 24, 
//               fontWeight: FontWeight.bold,
//               color: Colors.blue.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }











// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// // Controller
// class BottomNavController extends GetxController {
//   var selectedIndex = 0.obs;

//   void changeTabIndex(int index) {
//     selectedIndex.value = index;
//   }
// }

// // Main Widget
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(BottomNavController());

//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: Obx(() => _getSelectedPage(controller.selectedIndex.value)),
//       bottomNavigationBar: Obx(() => CurvedBottomNavigationBar(
//         currentIndex: controller.selectedIndex.value,
//         onTap: controller.changeTabIndex,
//       )),
//     );
//   }

//   Widget _getSelectedPage(int index) {
//     return [
//       MatchesPage(),
//       NewsletterPage(),
//       CafeConnectPage(),
//       ChatsPage(),
//       ProfilePage()
//     ][index];
//   }
// }

// // Curved Bottom Navigation Bar
// class CurvedBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CurvedBottomNavigationBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth > 600;
//     final bottomNavHeight = isTablet ? 140.0 : 110.0;
    
//     return SizedBox(
//       height: bottomNavHeight,
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.bottomCenter,
//         children: [
//           // Background with curved shape
//           CustomPaint(
//             size: Size(screenWidth, bottomNavHeight),
//             painter: CurvedBottomBarPainter(),
//           ),

//           // Navigation items (restructured using one Row with 5 Columns)
//           Positioned.fill(
//             top: isTablet ? 25 : 18,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(5, (index) {
//                 if (index == 2) {
//                   // Center CafeConnect item, elevated
//                   return SizedBox(
//                     width: isTablet ? 100 : 80,
//                     child: GestureDetector(
//                       onTap: () => onTap(2),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         // mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                         Container(
//                           height: 80,
//                           width: 80,
//                           child: Image.asset(
//                             "assets/images/cup_coffee.jpg",
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                                                   Text(
//                         'CafeConnect',
//                         style: TextStyle(
//                           fontSize: _getResponsiveFontSize(screenWidth, 8),
//                           color: currentIndex == 2
//                               ? const Color(0xff3771C8)
//                               : const Color(0xff000000),
//                           fontWeight: FontWeight.w500,
//                                                   ),
//                                                   textAlign: TextAlign.center,
//                                                   )
//                         ],
//                       ),
//                     ),
//                   );
//                 } else {
//                   // Other navigation items
//                   final iconPaths = [
//                     "assets/icon/svg/herats.svg",
//                     "assets/icon/svg/newsletter.svg",
//                     "", // center item
//                     "assets/icon/svg/message.svg",
//                     "assets/icon/svg/profile.svg"
//                   ];

//                   final selectedIconPaths = [
//                     "assets/icon/svg/hearts_blue.svg",
//                     "assets/icon/svg/newsletter_blue.svg",
//                     "", // center item
//                     "assets/icon/svg/message_blue.svg",
//                     "assets/icon/svg/profile_blue.svg"
//                   ];

//                   final labels = ["Matches", "Newsletter", "", "Chats", "Profile"];

//                   return Expanded(
//                     child: GestureDetector(
//                       onTap: () => onTap(index),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             height: 30,
//                             width: 30,
//                             child: SvgPicture.asset(
//                               currentIndex == index ? selectedIconPaths[index] : iconPaths[index],
//                               width: _getResponsiveIconSize(screenWidth),
//                               height: _getResponsiveIconSize(screenWidth),
//                             ),
//                           ),
//                           SizedBox(height: isTablet ? 6 : 4),
//                           Text(
//                             labels[index],
//                             style: TextStyle(
//                               fontSize: _getResponsiveFontSize(screenWidth, 11),
//                               color: currentIndex == index
//                                   ? const Color(0xff3771C8)
//                                   : const Color(0xff000000),
//                               fontWeight: FontWeight.w500,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   double _getResponsiveIconSize(double screenWidth) {
//     if (screenWidth > 600) return 28; // Tablet
//     if (screenWidth > 400) return 24; // Large phone
//     return 20; // Small phone
//   }

//   double _getResponsiveFontSize(double screenWidth, double baseFontSize) {
//     if (screenWidth > 600) return baseFontSize + 2; // Tablet
//     if (screenWidth > 400) return baseFontSize; // Large phone
//     return baseFontSize - 1; // Small phone
//   }

//   Widget _buildSvgIcon(String assetPath, {double size = 24}) {
//     return SvgPicture.asset(
//       assetPath,
//       width: size,
//       height: size,
//       // No color applied — will render original SVG colors
//     );
//   }

//   Widget _buildNavItem(
//     int index,
//     String svgAssetPath,
//     String label, {
//     bool showBadge = false,
//   }) {
//     bool isSelected = currentIndex == index;

//     return GestureDetector(
//       onTap: () => onTap(index),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 15),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(
//               svgAssetPath,
//               width: 24,
//               height: 24,
//             ),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 11,
//                 color: isSelected ? Color(0xff3771C8) : Color(0xff000000),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class CurvedBottomBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     final path = Path();
//     final curveDepth = size.height * 0.15; // Much flatter curve to match reference image
    
//     // Start from left edge
//     path.moveTo(0, 15);
    
//     // Left side leading to curve
//     path.lineTo(size.width * 0.3, 15);

//     // Gentle curve for center - flatter and wider like reference image
//     path.quadraticBezierTo(
//       size.width * 0.4, -curveDepth, // Left control point - much gentler
//       size.width * 0.5, -curveDepth,  // Center peak - very shallow
//     );

//     path.quadraticBezierTo(
//       size.width * 0.6, -curveDepth, // Right control point - much gentler
//       size.width * 0.7, 15,          // Right side back to baseline
//     );

//     // Right side to edge
//     path.lineTo(size.width, 15);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     // Subtle shadow like in reference image
//     canvas.drawShadow(path, Colors.black.withOpacity(0.1), 3, false);
//     canvas.drawPath(path, paint);

//     // Very light border
//     final borderPaint = Paint()
//       ..color = Colors.grey.shade200
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 0.5;
//     canvas.drawPath(path, borderPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// // Sample pages for each tab
// class MatchesPage extends StatelessWidget {
//   const MatchesPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.favorite, size: 100, color: Colors.pink),
//           SizedBox(height: 20),
//           Text(
//             'Matches',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NewsletterPage extends StatelessWidget {
//   const NewsletterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.article, size: 100, color: Colors.blue),
//           SizedBox(height: 20),
//           Text(
//             'Newsletter',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CafeConnectPage extends StatelessWidget {
//   const CafeConnectPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: SvgPicture.asset(
//               "assets/icon/svg/cup_coffee.svg",
//               width: 60,
//               height: 60,
//               errorBuilder: (context, error, stackTrace) {
//                 return Icon(Icons.coffee, size: 60, color: Colors.white);
//               },
//             ),
//           ),
//           SizedBox(height: 60),
//           Text(
//             'CafeConnect',
//             style: TextStyle(
//               fontSize: 24, 
//               fontWeight: FontWeight.bold,
//               color: Colors.orange.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatsPage extends StatelessWidget {
//   const ChatsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.chat_bubble, size: 100, color: Colors.green),
//           SizedBox(height: 20),
//           Text(
//             'Chats',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Stack(
//             children: [
//               Icon(Icons.person, size: 100, color: Colors.blue.shade600),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   width: 20,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Text(
//                       '1',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Profile',
//             style: TextStyle(
//               fontSize: 24, 
//               fontWeight: FontWeight.bold,
//               color: Colors.blue.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





















import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// Controller
class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}

// Main Widget
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Obx(() => _getSelectedPage(controller.selectedIndex.value)),
      bottomNavigationBar: Obx(() => CurvedBottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.changeTabIndex,
      )),
    );
  }

  Widget _getSelectedPage(int index) {
    return [
      MatchesPage(),
      NewsletterPage(),
      CafeConnectPage(),
      ChatsPage(),
      ProfilePage()
    ][index];
  }
}

// Curved Bottom Navigation Bar
class CurvedBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CurvedBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final bottomNavHeight = isTablet ? 140.0 : 110.0;
    
    return SizedBox(
      height: bottomNavHeight,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Background with curved shape
          CustomPaint(
            size: Size(screenWidth, bottomNavHeight),
            painter: CurvedBottomBarPainter(),
          ),

          // Navigation items (restructured using one Row with 5 Columns)
          Positioned.fill(
            top: isTablet ? 25 : 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                if (index == 2) {
                  // Center CafeConnect item, elevated
                  return SizedBox(
                    width: isTablet ? 80 : 60,
                    child: GestureDetector(
                      onTap: () => onTap(2),
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Image.asset(
                          "assets/images/cup_coffee.jpg",
                          height: 70,
                          width: 70,
                          fit: BoxFit.contain,
                        ),
                                                  Text(
                        'CafeConnect',
                        style: TextStyle(
                          fontSize: _getResponsiveFontSize(screenWidth, 8),
                          color: currentIndex == 2
                              ? const Color(0xff3771C8)
                              : const Color(0xff000000),
                          fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  )
                        ],
                      ),
                    ),
                  );
                } else {
                  // Other navigation items
                  final iconPaths = [
                    "assets/icon/svg/herats.svg",
                    "assets/icon/svg/newsletter.svg",
                    "", // center item
                    "assets/icon/svg/message.svg",
                    "assets/icon/svg/profile.svg"
                  ];

                  final selectedIconPaths = [
                    "assets/icon/svg/hearts_blue.svg",
                    "assets/icon/svg/newsletter_blue.svg",
                    "", // center item
                    "assets/icon/svg/message_blue.svg",
                    "assets/icon/svg/profile_blue.svg"
                  ];

                  final labels = ["Matches", "Newsletter", "", "Chats", "Profile"];

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onTap(index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            currentIndex == index ? selectedIconPaths[index] : iconPaths[index],
                            width: _getResponsiveIconSize(screenWidth),
                            height: _getResponsiveIconSize(screenWidth),
                          ),
                          SizedBox(height: isTablet ? 6 : 4),
                          Text(
                            labels[index],
                            style: TextStyle(
                              fontSize: _getResponsiveFontSize(screenWidth, 11),
                              color: currentIndex == index
                                  ? const Color(0xff3771C8)
                                  : const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }

  double _getResponsiveIconSize(double screenWidth) {
    if (screenWidth > 600) return 28; // Tablet
    if (screenWidth > 400) return 24; // Large phone
    return 20; // Small phone
  }

  double _getResponsiveFontSize(double screenWidth, double baseFontSize) {
    if (screenWidth > 600) return baseFontSize + 2; // Tablet
    if (screenWidth > 400) return baseFontSize; // Large phone
    return baseFontSize - 1; // Small phone
  }

  Widget _buildSvgIcon(String assetPath, {double size = 24}) {
    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      // No color applied — will render original SVG colors
    );
  }

  Widget _buildNavItem(
    int index,
    String svgAssetPath,
    String label, {
    bool showBadge = false,
  }) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              svgAssetPath,
              width: 60,
              height: 60,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isSelected ? Color(0xff3771C8) : Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CurvedBottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    final curveDepth = size.height * 0.15; // Much flatter curve to match reference image
    
    // Start from left edge
    path.moveTo(0, 15);
    
    // Left side leading to curve
    path.lineTo(size.width * 0.3, 15);

    // Gentle curve for center - flatter and wider like reference image
    path.quadraticBezierTo(
      size.width * 0.4, -curveDepth, // Left control point - much gentler
      size.width * 0.5, -curveDepth,  // Center peak - very shallow
    );

    path.quadraticBezierTo(
      size.width * 0.6, -curveDepth, // Right control point - much gentler
      size.width * 0.7, 15,          // Right side back to baseline
    );

    // Right side to edge
    path.lineTo(size.width, 15);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Subtle shadow like in reference image
    canvas.drawShadow(path, Colors.black.withOpacity(0.1), 3, false);
    canvas.drawPath(path, paint);

    // Very light border
    final borderPaint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Sample pages for each tab
class MatchesPage extends StatelessWidget {
  const MatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite, size: 100, color: Colors.pink),
          SizedBox(height: 20),
          Text(
            'Matches',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class NewsletterPage extends StatelessWidget {
  const NewsletterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.article, size: 100, color: Colors.blue),
          SizedBox(height: 20),
          Text(
            'Newsletter',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CafeConnectPage extends StatelessWidget {
  const CafeConnectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              "assets/icon/svg/cup_coffee.svg",
              width: 60,
              height: 60,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.coffee, size: 60, color: Colors.white);
              },
            ),
          ),
          SizedBox(height: 60),
          Text(
            'CafeConnect',
            style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat_bubble, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Chats',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 100, color: Colors.blue.shade600),
          SizedBox(height: 20),
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade600,
            ),
          ),
        ],
      ),
    );
  }
}