// import 'package:flutter/material.dart';
// import 'package:tnmn_obat/main.dart';

// class ProfilePage extends StatelessWidget {
//   final String username = "Jay";
//   final String email = "jay@gmail.com";
//   final String profileImageUrl = 'assets/profile.jpeg'; // URL gambar profil

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile"),
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: Stack(
//         children: [
//           // Animasi tanaman bergerak
//           IgnorePointer(
//             ignoring: true,
//             child: AnimatedPlant(),
//           ),
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Foto Profil
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: AssetImage(profileImageUrl),
//                   ),
//                   SizedBox(height: 20),
//                   // Nama Pengguna
//                   Text(
//                     username,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[800],
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   // Email Pengguna
//                   Text(
//                     email,
//                     style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                   ),
//                   SizedBox(height: 20),
//                   // Data Tanaman Favorit
//                   Text(
//                     "Favorite Plants",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[800],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   // Daftar Tanaman Favorit
//                   Expanded(
//                     child: ListView(
//                       children: [
//                         ListTile(
//                           leading: Icon(Icons.local_florist, color: Colors.green),
//                           title: Text("Daun Sirih"),
//                           subtitle: Text("Manfaat: Menyembuhkan sariawan."),
//                         ),
//                         Divider(),
//                         ListTile(
//                           leading: Icon(Icons.local_florist, color: Colors.green),
//                           title: Text("Kunyit"),
//                           subtitle: Text("Manfaat: Meningkatkan daya tahan tubuh."),
//                         ),
//                         Divider(),
//                         ListTile(
//                           leading: Icon(Icons.local_florist, color: Colors.green),
//                           title: Text("Jahe"),
//                           subtitle: Text("Manfaat: Mengatasi mual, meredakan flu."),
//                         ),
//                         Divider(),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Tombol Pengaturan
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       // Navigasi ke halaman Settings
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SettingsPage(
//                             isDarkMode: false,
//                             profileName: username,
//                             onDarkModeToggle: (value) {
//                               // Logika dark mode
//                             },
//                             onProfileEdit: (newName) {
//                               // Logika pengeditan nama
//                             },
//                             onLogout: () {
//                               // Logika logout
//                               Navigator.pushAndRemoveUntil(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => MyHomePage()),
//                                 (route) => false,
//                               );
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                     icon: Icon(Icons.settings, size: 24),
//                     label: Text("Settings", style: TextStyle(fontSize: 18)),
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
//                       backgroundColor: Colors.greenAccent,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AnimatedPlant extends StatefulWidget {
//   @override
//   _AnimatedPlantState createState() => _AnimatedPlantState();
// }

// class _AnimatedPlantState extends State<AnimatedPlant> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(seconds: 3),
//       vsync: this,
//     )..repeat(reverse: true);

//     _animation = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         return Positioned(
//           top: 50 + _animation.value,
//           left: -50,
//           child: Opacity(
//             opacity: 0.2,
//             child: Icon(
//               Icons.local_florist_outlined,
//               size: 300,
//               color: const Color.fromARGB(255, 60, 179, 113),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }


// class SettingsPage extends StatelessWidget {
//   final bool isDarkMode; // Data di-passing ke widget
//   final String profileName;
//   final Function(bool) onDarkModeToggle; // Callback untuk mengganti dark mode
//   final Function(String) onProfileEdit; // Callback untuk mengganti nama profil
//   final VoidCallback onLogout; // Callback untuk logout

//   SettingsPage({
//     required this.isDarkMode,
//     required this.profileName,
//     required this.onDarkModeToggle,
//     required this.onProfileEdit,
//     required this.onLogout,
//   });

//   // Fungsi untuk menampilkan dialog
//   void _showDialog(BuildContext context, String title, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Settings"),
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: SingleChildScrollView(  // Make the content scrollable
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Profil Pengguna
//             ListTile(
//               leading: Icon(Icons.person, color: Colors.green),
//               title: Text("Profile"),
//               subtitle: Text("View and edit your profile"),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text("Edit Profile"),
//                     content: TextFormField(
//                       initialValue: profileName,
//                       decoration: InputDecoration(labelText: "Name"),
//                       onChanged: onProfileEdit,
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.of(context).pop(),
//                         child: Text("Save"),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//             Divider(),

//             // Notifikasi
//             ListTile(
//               leading: Icon(Icons.notifications, color: Colors.green),
//               title: Text("Notifications"),
//               subtitle: Text("Manage notification settings"),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 _showDialog(context, "Notifications", "Notification settings opened.");
//               },
//             ),
//             Divider(),

//             // Privasi
//             ListTile(
//               leading: Icon(Icons.lock, color: Colors.green),
//               title: Text("Privacy"),
//               subtitle: Text("Manage your privacy settings"),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 _showDialog(context, "Privacy", "Privacy settings opened.");
//               },
//             ),
//             Divider(),

//             // Tema
//             SwitchListTile(
//               secondary: Icon(Icons.dark_mode, color: Colors.green),
//               title: Text("Dark Mode"),
//               subtitle: Text("Enable or disable dark mode"),
//               value: isDarkMode,
//               onChanged: onDarkModeToggle,
//             ),
//             Divider(),

//             // Informasi Aplikasi
//             ListTile(
//               leading: Icon(Icons.info, color: Colors.green),
//               title: Text("About"),
//               subtitle: Text("App version and information"),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 showAboutDialog(
//                   context: context,
//                   applicationName: "Plantify",
//                   applicationVersion: "1.0.0",
//                   applicationIcon: Icon(Icons.local_florist, color: Colors.green),
//                   children: [
//                     Text("Plantify is a plant care application."),
//                   ],
//                 );
//               },
//             ),
//             Divider(),

//             // Logout
//             ListTile(
//               leading: Icon(Icons.logout, color: Colors.red),
//               title: Text("Logout"),
//               subtitle: Text("Sign out of your account"),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // Perform logout action and navigate to home or login page
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyHomePage()), // Replace LoginPage() with your actual login screen
//                   (Route<dynamic> route) => false, // Removes all previous routes
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:tnmn_obat/main.dart';  // Assuming this is the home page you want to return to

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   String username = "Jay";
//   String email = "jay@gmail.com";
//   String profileImageUrl = 'assets/profile.jpeg'; // URL gambar profil

//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _usernameController.text = username;
//     _emailController.text = email;
//   }

//   void _editProfile() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Edit Profile"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               controller: _usernameController,
//               decoration: InputDecoration(labelText: "Username"),
//             ),
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: "Email"),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 username = _usernameController.text;
//                 email = _emailController.text;
//               });
//               Navigator.of(context).pop();
//             },
//             child: Text("Save"),
//           ),
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text("Cancel"),
//           ),
//         ],
//       ),
//     );
//   }

//   void _changeProfileImage() {
//     // Here you can implement an image picker to change the profile picture
//     setState(() {
//       profileImageUrl = 'assets/new_profile_image.jpeg';  // Change to selected image
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile"),
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: _changeProfileImage, // Clicking on the profile picture
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage(profileImageUrl),
//                 ),
//               ),
//               SizedBox(height: 20),
//               GestureDetector(
//                 onTap: _editProfile, // Clicking the username to edit
//                 child: Text(
//                   username,
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green[800],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 8),
//               GestureDetector(
//                 onTap: _editProfile, // Clicking the email to edit
//                 child: Text(
//                   email,
//                   style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Favorite Plants",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green[800],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     ListTile(
//                       leading: Icon(Icons.local_florist, color: Colors.green),
//                       title: Text("Daun Sirih"),
//                       subtitle: Text("Manfaat: Menyembuhkan sariawan."),
//                       onTap: () {
//                         _showPlantDetails("Daun Sirih", "Manfaat: Menyembuhkan sariawan.");
//                       },
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.local_florist, color: Colors.green),
//                       title: Text("Kunyit"),
//                       subtitle: Text("Manfaat: Meningkatkan daya tahan tubuh."),
//                       onTap: () {
//                         _showPlantDetails("Kunyit", "Manfaat: Meningkatkan daya tahan tubuh.");
//                       },
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.local_florist, color: Colors.green),
//                       title: Text("Jahe"),
//                       subtitle: Text("Manfaat: Mengatasi mual, meredakan flu."),
//                       onTap: () {
//                         _showPlantDetails("Jahe", "Manfaat: Mengatasi mual, meredakan flu.");
//                       },
//                     ),
//                     Divider(),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton.icon(
//                 onPressed: _editProfile,  // Open profile edit dialog
//                 icon: Icon(Icons.edit, size: 24),
//                 label: Text("Edit Profile", style: TextStyle(fontSize: 18)),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
//                   backgroundColor: Colors.greenAccent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SettingsPage(
//                         isDarkMode: false,
//                         profileName: username,
//                         onDarkModeToggle: (value) {},
//                         onProfileEdit: (newName) {},
//                         onLogout: () {
//                           Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(builder: (context) => MyHomePage()),
//                             (route) => false,
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 },
//                 icon: Icon(Icons.settings, size: 24),
//                 label: Text("Settings", style: TextStyle(fontSize: 18)),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
//                   backgroundColor: Colors.greenAccent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showPlantDetails(String plantName, String plantBenefit) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(plantName),
//         content: Text(plantBenefit),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }
// }



// class SettingsPage extends StatelessWidget {
//   final bool isDarkMode;
//   final String profileName;
//   final Function(bool) onDarkModeToggle;
//   final Function(String) onProfileEdit;
//   final VoidCallback onLogout;

//   SettingsPage({
//     required this.isDarkMode,
//     required this.profileName,
//     required this.onDarkModeToggle,
//     required this.onProfileEdit,
//     required this.onLogout,
//   });

//   void _showDialog(BuildContext context, String title, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Settings"),
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ListTile(
//               leading: Icon(Icons.person, color: Colors.green),
//               title: Text("Profile"),
//               subtitle: Text("View and edit your profile"),
//               onTap: () {
//                 onProfileEdit(profileName);
//               },
//             ),
//             SwitchListTile(
//               title: Text("Dark Mode"),
//               value: isDarkMode,
//               onChanged: onDarkModeToggle,
//               activeColor: Colors.green,
//             ),
//             ListTile(
//               leading: Icon(Icons.info_outline, color: Colors.green),
//               title: Text("App Info"),
//               subtitle: Text("About the app"),
//               onTap: () {
//                 _showDialog(context, "App Info", "This is a plant medicine app!");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout, color: Colors.green),
//               title: Text("Log Out"),
//               onTap: onLogout,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:tnmn_obat/main.dart'; // Assuming this is the home page you want to return to

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   String username = "Jay";
//   String email = "jay@gmail.com";
//   String profileImageUrl = 'assets/profile.jpeg'; // URL gambar profil

//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     _usernameController.text = username;
//     _emailController.text = email;
//   }

//   // Function to pick an image from the gallery or camera
//   Future<void> _changeProfileImage() async {
//     final XFile? pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 80,
//     );

//     if (pickedFile != null) {
//       setState(() {
//         profileImageUrl = pickedFile.path;  // Set the selected image path
//       });
//     }
//   }

//   void _editProfile() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Edit Profile"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               controller: _usernameController,
//               decoration: InputDecoration(labelText: "Username"),
//             ),
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: "Email"),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 username = _usernameController.text;
//                 email = _emailController.text;
//               });
//               Navigator.of(context).pop();
//             },
//             child: Text("Save"),
//           ),
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text("Cancel"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile"),
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: _changeProfileImage, // Clicking on the profile picture
//                 child: CircleAvatar(
//                   radius: 60,
//                   backgroundImage: FileImage(File(profileImageUrl)),
//                 ),
//               ),
//               SizedBox(height: 20),
//               GestureDetector(
//                 onTap: _editProfile, // Clicking the username to edit
//                 child: Text(
//                   username,
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green[800],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 8),
//               GestureDetector(
//                 onTap: _editProfile, // Clicking the email to edit
//                 child: Text(
//                   email,
//                   style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Favorite Plants",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green[800],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     ListTile(
//                       leading: Icon(Icons.local_florist, color: Colors.green),
//                       title: Text("Daun Sirih"),
//                       subtitle: Text("Manfaat: Menyembuhkan sariawan."),
//                       onTap: () {
//                         _showPlantDetails("Daun Sirih", "Manfaat: Menyembuhkan sariawan.");
//                       },
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.local_florist, color: Colors.green),
//                       title: Text("Kunyit"),
//                       subtitle: Text("Manfaat: Meningkatkan daya tahan tubuh."),
//                       onTap: () {
//                         _showPlantDetails("Kunyit", "Manfaat: Meningkatkan daya tahan tubuh.");
//                       },
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.local_florist, color: Colors.green),
//                       title: Text("Jahe"),
//                       subtitle: Text("Manfaat: Mengatasi mual, meredakan flu."),
//                       onTap: () {
//                         _showPlantDetails("Jahe", "Manfaat: Mengatasi mual, meredakan flu.");
//                       },
//                     ),
//                     Divider(),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Updated Edit Profile button style
//               ElevatedButton(
//                 onPressed: _editProfile,
//                 child: Text("Edit Profile", style: TextStyle(fontSize: 18)),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
//                   backgroundColor: Colors.green[700],
//                   disabledBackgroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   elevation: 5,
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Updated Settings button style
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SettingsPage(
//                         isDarkMode: false,
//                         profileName: username,
//                         onDarkModeToggle: (value) {},
//                         onProfileEdit: (newName) {},
//                         onLogout: () {
//                           Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(builder: (context) => MyHomePage()),
//                             (route) => false,
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text("Settings", style: TextStyle(fontSize: 18)),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
//                   backgroundColor: Colors.green[700],
//                   disabledBackgroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   elevation: 5,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showPlantDetails(String plantName, String plantBenefit) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(plantName),
//         content: Text(plantBenefit),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SettingsPage extends StatelessWidget {
//   final bool isDarkMode;
//   final String profileName;
//   final Function(bool) onDarkModeToggle;
//   final Function(String) onProfileEdit;
//   final VoidCallback onLogout;

//   SettingsPage({
//     required this.isDarkMode,
//     required this.profileName,
//     required this.onDarkModeToggle,
//     required this.onProfileEdit,
//     required this.onLogout,
//   });

//   void _showDialog(BuildContext context, String title, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Settings"),
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ListTile(
//               leading: Icon(Icons.person, color: Colors.green),
//               title: Text("Profile"),
//               subtitle: Text("View and edit your profile"),
//               onTap: () {
//                 onProfileEdit(profileName);
//               },
//             ),
//             SwitchListTile(
//               title: Text("Dark Mode"),
//               value: isDarkMode,
//               onChanged: onDarkModeToggle,
//               activeColor: Colors.green,
//             ),
//             ListTile(
//               leading: Icon(Icons.info_outline, color: Colors.green),
//               title: Text("App Info"),
//               subtitle: Text("About the app"),
//               onTap: () {
//                 _showDialog(context, "App Info", "This is a plant medicine app!");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout, color: Colors.green),
//               title: Text("Log Out"),
//               onTap: onLogout,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:tnmn_obat/main.dart'; // Assuming this is the home page you want to return to

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   String username = "Jay";
//   String email = "jay@gmail.com";
//   File? profileImage; // Menggunakan File untuk menyimpan gambar profil

//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     _usernameController.text = username;
//     _emailController.text = email;
//   }

//   // Function to pick an image from the gallery
//   Future<void> _changeProfileImage() async {
//     final XFile? pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 80,
//     );

//     if (pickedFile != null) {
//       setState(() {
//         profileImage = File(pickedFile.path); // Set the selected image file
//       });
//     }
//   }

//   void _editProfile() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Edit Profile"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               controller: _usernameController,
//               decoration: InputDecoration(labelText: "Username"),
//             ),
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: "Email"),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 username = _usernameController.text;
//                 email = _emailController.text;
//               });
//               Navigator.of(context).pop();
//             },
//             child: Text("Save"),
//           ),
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text("Cancel"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile"),
//         backgroundColor: Colors.greenAccent,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SettingsPage(
//                     profileName: username,
//                     onProfileEdit: (newName) {
//                       setState(() {
//                         username = newName;
//                       });
//                     },
//                     onLanguageChange: (language) {
//                       // Handle language change
//                     },
//                     onLogout: () {
//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(builder: (context) => MyHomePage()),
//                         (route) => false,
//                       );
//                     },
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Stack(
//                 children: [
//                   GestureDetector(
//                     onTap: _changeProfileImage,
//                     child: CircleAvatar(
//                       radius: 60,
//                       backgroundImage: profileImage != null
//                           ? FileImage(profileImage!)
//                           : AssetImage('assets/profile.jpeg') as ImageProvider,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: IconButton(
//                       icon: Icon(Icons.edit, color: Colors.white, size: 30),
//                       onPressed: _changeProfileImage,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Text(
//                 username,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green[800],
//                 ),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 email,
//                 style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//               ),
//               SizedBox(height: 20),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: ElevatedButton.icon(
//                   onPressed: _editProfile,
//                   icon: Icon(Icons.edit, size: 18, color: Colors.white),
//                   label: Text(
//                     "Edit Profile",
//                     style: TextStyle(fontSize: 14, color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//                     backgroundColor: Colors.green[700],
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Favorite Plants",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green[800],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     ListTile(
//                       leading: Icon(Icons.local_florist, color: Colors.green),
//                       title: Text("Daun Sirih"),
//                       subtitle: Text("Manfaat: Menyembuhkan sariawan."),
//                       onTap: () {
//                         _showPlantDetails("Daun Sirih", "Manfaat: Menyembuhkan sariawan.");
//                       },
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.local_florist, color: Colors.green),
//                       title: Text("Kunyit"),
//                       subtitle: Text("Manfaat: Meningkatkan daya tahan tubuh."),
//                       onTap: () {
//                         _showPlantDetails("Kunyit", "Manfaat: Meningkatkan daya tahan tubuh.");
//                       },
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.local_florist, color: Colors.green),
//                       title: Text("Jahe"),
//                       subtitle: Text("Manfaat: Mengatasi mual, meredakan flu."),
//                       onTap: () {
//                         _showPlantDetails("Jahe", "Manfaat: Mengatasi mual, meredakan flu.");
//                       },
//                     ),
//                     Divider(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showPlantDetails(String plantName, String plantBenefit) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(plantName),
//         content: Text(plantBenefit),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SettingsPage extends StatelessWidget {
//   final String profileName;
//   final Function(String) onProfileEdit;
//   final Function(String) onLanguageChange;
//   final VoidCallback onLogout;

//   SettingsPage({
//     required this.profileName,
//     required this.onProfileEdit,
//     required this.onLanguageChange,
//     required this.onLogout,
//   });

//   void _showLanguageSelector(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text("Select Language", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               ListTile(
//                 title: Text("English"),
//                 onTap: () {
//                   onLanguageChange("English");
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: Text("Bahasa Indonesia"),
//                 onTap: () {
//                   onLanguageChange("Bahasa Indonesia");
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: Text("Español"),
//                 onTap: () {
//                   onLanguageChange("Español");
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Settings"),
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(16.0),
//         children: [
//           ListTile(
//             leading: Icon(Icons.person, color: Colors.green),
//             title: Text("Edit Profile"),
//             subtitle: Text("View and edit your profile"),
//             onTap: () {
//               onProfileEdit(profileName);
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.notifications, color: Colors.green),
//             title: Text("Notification Settings"),
//             subtitle: Text("Manage app notifications"),
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: Text("Notification Settings"),
//                   content: Text("Here you can manage your notification preferences."),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.of(context).pop(),
//                       child: Text("Close"),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.language, color: Colors.green),
//             title: Text("Change Language"),
//             subtitle: Text("Select app language"),
//             onTap: () {
//               _showLanguageSelector(context);
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.info_outline, color: Colors.green),
//             title: Text("About the App"),
//             subtitle: Text("Learn more about this app"),
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: Text("About the App"),
//                   content: Text("This app provides information about medicinal plants."),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.of(context).pop(),
//                       child: Text("Close"),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.contact_support, color: Colors.green),
//             title: Text("Help & Support"),
//             subtitle: Text("Get assistance"),
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: Text("Help & Support"),
//                   content: Text("For inquiries, contact us at support@plantmedicine.com."),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.of(context).pop(),
//                       child: Text("Close"),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.logout, color: Colors.green),
//             title: Text("Log Out"),
//             onTap: onLogout,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tnmn_obat/main.dart'; // Assuming this is the home page you want to return to

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "Jay";
  String email = "jay@gmail.com";
  File? profileImage; // To store the profile image

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _usernameController.text = username;
    _emailController.text = email;
  }

  // Function to pick an image from the gallery
  Future<void> _changeProfileImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path); // Set the selected image file
      });
    }
  }

  // Function to edit profile information
  void _editProfile() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Profile"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                username = _usernameController.text;
                email = _emailController.text;
              });
              Navigator.of(context).pop();
            },
            child: Text("Save"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                    profileName: username,
                    onProfileEdit: (newName) {
                      setState(() {
                        username = newName;
                      });
                    },
                    onLanguageChange: (language) {
                      // Handle language change
                    },
                    onLogout: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                        (route) => false,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: _changeProfileImage,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: profileImage != null
                          ? FileImage(profileImage!)
                          : AssetImage('assets/profile.jpeg') as ImageProvider,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.white, size: 30),
                      onPressed: _changeProfileImage,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                username,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 8),
              Text(
                email,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton.icon(
                  onPressed: _editProfile,
                  icon: Icon(Icons.edit, size: 18, color: Colors.white),
                  label: Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Favorite Plants",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.local_florist, color: Colors.green),
                      title: Text("Daun Sirih"),
                      subtitle: Text("Manfaat: Menyembuhkan sariawan."),
                      onTap: () {
                        _showPlantDetails("Daun Sirih", "Manfaat: Menyembuhkan sariawan.");
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.local_florist, color: Colors.green),
                      title: Text("Kunyit"),
                      subtitle: Text("Manfaat: Meningkatkan daya tahan tubuh."),
                      onTap: () {
                        _showPlantDetails("Kunyit", "Manfaat: Meningkatkan daya tahan tubuh.");
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.local_florist, color: Colors.green),
                      title: Text("Jahe"),
                      subtitle: Text("Manfaat: Mengatasi mual, meredakan flu."),
                      onTap: () {
                        _showPlantDetails("Jahe", "Manfaat: Mengatasi mual, meredakan flu.");
                      },
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPlantDetails(String plantName, String plantBenefit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(plantName),
        content: Text(plantBenefit),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final String profileName;
  final Function(String) onProfileEdit;
  final Function(String) onLanguageChange;
  final VoidCallback onLogout;

  SettingsPage({
    required this.profileName,
    required this.onProfileEdit,
    required this.onLanguageChange,
    required this.onLogout,
  });

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Select Language", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                title: Text("English"),
                onTap: () {
                  onLanguageChange("English");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Bahasa Indonesia"),
                onTap: () {
                  onLanguageChange("Bahasa Indonesia");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Español"),
                onTap: () {
                  onLanguageChange("Español");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Colors.green),
            title: Text("Edit Profile"),
            subtitle: Text("View and edit your profile"),
            onTap: () {
              onProfileEdit(profileName);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.green),
            title: Text("Notification Settings"),
            subtitle: Text("Manage app notifications"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Notification Settings"),
                  content: Text("Here you can manage your notification preferences."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Close"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.language, color: Colors.green),
            title: Text("Change Language"),
            subtitle: Text("Select app language"),
            onTap: () {
              _showLanguageSelector(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.green),
            title: Text("About the App"),
            subtitle: Text("Learn more about this app"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("About the App"),
                  content: Text("This app provides information about medicinal plants."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Close"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_support, color: Colors.green),
            title: Text("Help & Support"),
            subtitle: Text("Get assistance"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Help & Support"),
                  content: Text("For inquiries, contact us at support@plantmedicine.com."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Close"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.green),
            title: Text("Log Out"),
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}



