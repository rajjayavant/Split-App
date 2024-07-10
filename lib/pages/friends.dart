import 'package:flutter/material.dart';
import 'package:split_app/pages/user.dart';
import 'package:split_app/pages/globaluser.dart';

class MyFriends extends StatefulWidget {
  const MyFriends({super.key});

  @override
  State<MyFriends> createState() => _MyFriendsState();
}

class _MyFriendsState extends State<MyFriends> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Amount You Owe: ${globalUser.totalAmount} ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: globalUser.friends.length,
              itemBuilder: (context, index) {
                String friendID = globalUser.friends[index];
                return ListTile(
                  title: Text(globalUser.friends[index]),
                  subtitle: Text(
                      'Total Owing: ${globalUser.friendsOwing[friendID]}'), // Accessing specific friend's owing
                  onTap: () => {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
