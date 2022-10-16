import 'package:bustracker/views/screens/history_screen.dart';
import 'package:bustracker/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BusMainScreen extends StatefulWidget {
  const BusMainScreen({super.key});

  @override
  State<BusMainScreen> createState() => _BusMainScreenState();
}

class _BusMainScreenState extends State<BusMainScreen> {
  int currentIndex = 0;
  late PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
        backgroundColor: Colors.orange,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          navidateTo(value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
      ),
      body: PageView(
          controller: pageController,
          children: [HomeScreen(), HistoryScreen()]),
    );
  }

  navidateTo(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    currentIndex = index;
    setState(() {});
  }
}
