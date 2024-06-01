// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
//
// class Profile extends StatefulWidget {
//   @override
//   _ProfileState createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final ImagePicker _picker = ImagePicker();
//
//   User? _user;
//   String _userName = "";
//   String _userEmail = "";
//   String _userProfilePicUrl = "";
//   File? _selectedImage;
//
//   @override
//   void initState() {
//     super.initState();
//     _getUserInfo();
//   }
//
//   // Function to get current user information
//   Future<void> _getUserInfo() async {
//     User? user = _auth.currentUser;
//     if (user != null) {
//       setState(() {
//         _user = user;
//         _userName = user.displayName ?? "";
//         _userEmail = user.email ?? "";
//         _userProfilePicUrl = user.photoURL ?? "";
//       });
//     }
//   }
//
//   // Function to handle logout
//   Future<void> _logout() async {
//     await _auth.signOut();
//     Navigator.pop(context);
//   }
//
//   // Function to handle profile picture selection
//   Future<void> _selectProfilePicture() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _selectedImage = File(image.path);
//       });
//     }
//   }
//
//   // Function to handle profile picture upload
//   Future<void> _uploadProfilePicture() async {
//     if (_selectedImage != null) {
//       Reference ref = _storage.ref().child("profile_pictures/${_user!.uid}");
//       UploadTask uploadTask = ref.putFile(_selectedImage!);
//
//       TaskSnapshot snapshot = await uploadTask;
//       String url = await snapshot.ref.getDownloadURL();
//
//       // Save the download URL to Firebase user's photoURL
//       await _user!.updatePhotoURL(url);
//
//       setState(() {
//         _userProfilePicUrl = url;
//         _selectedImage = null; // Clear selected image after upload
//       });
//     }
//   }
//
//   // Method to get the image provider
//   ImageProvider<Object> _imageProvider() {
//     if (_selectedImage != null) {
//       return FileImage(_selectedImage!);
//     } else if (_userProfilePicUrl != null && _userProfilePicUrl.isNotEmpty) {
//       return NetworkImage(_userProfilePicUrl);
//     } else {
//       return AssetImage('assets/default_profile_pic.jpg');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: _logout,
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.topCenter,
//               children: [
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: _imageProvider(), // Use the _imageProvider method
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   child: ElevatedButton(
//                     onPressed: _selectProfilePicture,
//                     child: Text('Select Profile Picture'),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               initialValue: _userName,
//               readOnly: true,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               initialValue: _userEmail,
//               readOnly: true,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//