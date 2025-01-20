
import 'package:chatapp/components/image_capture.dart';
import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/components/user_tile.dart';
import 'package:chatapp/pages/chat_page.dart' as chat_page;
import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:chatapp/services/profile/profile_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  HomePage({super.key});

  // chat & auth services
  final ChatService _chatService = ChatService();
  final AuthServices _authService = AuthServices();

  @override
  Widget build(BuildContext context) {
    final ProfileService _profileService = ProfileService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "ChatApps",
          style: TextStyle(color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt, color: Theme.of(context).primaryColor),
            onPressed: () {
              // Implement camera functionality here
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ImageCapture()),
            // );
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
            onPressed: () {
              // Implement search functionality here
            },
          ),
              MyThreeDotMenu(),
        ],
      ),
      // drawer: const MyDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Expanded(child: _builderUserList()),
        ],
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  // build a list of users accept for the current logged in user
  // Widget _builderUserList() {
  //   return StreamBuilder(
  //     stream: _chatService.getUserStream(),
  //     builder: (context, snapshot) {
  //       // error
  //       if (snapshot.hasError) {
  //         print("Error: ${snapshot.error}");
  //         return const Text("Error");
  //       }
  //       // loading
  //       // if (snapshot.connectionState == ConnectionState.waiting) {
  //       //   return const Text("Loading.....");
  //       // }

  //       // return list view
  //       if (snapshot.data == null || snapshot.data is! List<Map<String, dynamic>>) {
  //         print("No users found or data is not in the expected format");
  //         return const Text("No users found");
  //       }
  //       var users = snapshot.data as List<Map<String, dynamic>>;
  //       print("User: $users");
  //       return ListView(
  //         children: users.map<Widget>((userData) => _builderUserListItem(userData, context)).toList(),
  //       );
  //     },
   // );
  }

  // build the individual list tile for the user
  // Widget _builderUserListItem(
  //     Map<String, dynamic> userData, BuildContext context) {
  //   // display all user except current user
  //   if(userData["email"] != _authService.getCurrentUser()!.email){
  //     return UserTile(
  //     text:userData['email'],
  //     // profileImageUrl: userData['profilePic'],
  //     onTap: () {
  //        // tapped to the go user go to the chat page
  //     Navigator.push(context,MaterialPageRoute(builder:(context)=>chat_page.ChatPage(
  //       receiverEmail: userData['email'],
  //       receiverID: userData['uid'],
  //     ),
  //       ),
  //      );
  //     },
     
  //   );
  //   }
  //   else{
  //     return Container();
  //   }
  // }
//}