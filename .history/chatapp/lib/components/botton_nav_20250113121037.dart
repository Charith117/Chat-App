import 'package:chatapp/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.light(), // Added light mode theme
    home: HomePage(), // Changed home to directly open HomePage
  ));
}

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    CallPage(),
    UpdatesPage(),
    AddMorePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: const Color.fromARGB(255, 229, 33, 243),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed, // Added to remove animations
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8), // Added padding
              decoration: BoxDecoration(
                color: _currentIndex == 0 ? Colors.grey : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.chat),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            
            icon: Container(
              padding: EdgeInsets.all(8), // Added padding

              decoration: BoxDecoration(
                color: _currentIndex == 1 ? Colors.grey : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.call),
            ),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: _currentIndex == 2 ? Colors.grey : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.update),
            ),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: _currentIndex == 3 ? Colors.grey : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.add),
            ),
            label: 'Add More',
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Center(
        child: Text('Chat Page',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}

class CallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Text('Call Page',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}

class UpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: Center(
        child: Text('Updates Page',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}

class AddMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
      child: Center(
        child: Text('Add More Page',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}
