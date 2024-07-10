import 'package:flutter/material.dart';
import 'package:split_app/pages/account.dart';
import 'package:split_app/pages/activity.dart';
import 'package:split_app/pages/addExpense.dart';
import 'package:split_app/pages/friends.dart';
import 'package:split_app/pages/globaluser.dart';
import 'package:split_app/pages/spends.dart';
import 'package:split_app/pages/backend.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  final List<Widget> _pages = [
    const MyFriends(),
    const MyActivity(),
    const MySpends(),
    const MyAccount()
  ];

  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() {
    globalUser = getUserData();
    // make fetch data api call instead
  }

  void _navigateToAddExpense(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddExpense()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _pages[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1.0,
        showUnselectedLabels: true,
        useLegacyColorScheme: true,
        fixedColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (tappedIndex) => {
          setState(() {
            selectedIndex = tappedIndex;
          })
        },
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.group),
              label: 'Friends',
              backgroundColor: Theme.of(context).colorScheme.inversePrimary),
          BottomNavigationBarItem(
              icon: const Icon(Icons.notifications),
              label: 'Activity',
              backgroundColor: Theme.of(context).colorScheme.inversePrimary),
          BottomNavigationBarItem(
              icon: const Icon(Icons.attach_money),
              label: 'Spends',
              backgroundColor: Theme.of(context).colorScheme.inversePrimary),
          BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              label: 'Account',
              backgroundColor: Theme.of(context).colorScheme.inversePrimary)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddExpense(context),
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
