import 'package:chatapp/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CustomBottomNavBar(),
  ));
}

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Widget> _children = [
    HomePage(),
    CallPage(),
    UpdatesPage(),
    AddMorePage(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _controller.forward(from: 0.0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add More',
          ),
        ],
      ),
    );
  }
}



// class CallPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.greenAccent,
//       child: Center(
//         child: Text('Call Page', style: TextStyle(color: Colors.white, fontSize: 24)),
//       ),
//     );
//   }
// }

// class UpdatesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.orangeAccent,
//       child: Center(
//         child: Text('Updates Page', style: TextStyle(color: Colors.white, fontSize: 24)),
//       ),
//     );
//   }
// }

// class AddMorePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.purpleAccent,
//       child: Center(
//         child: Text('Add More Page', style: TextStyle(color: Colors.white, fontSize: 24)),
//       ),
//     );
//   }
// }
