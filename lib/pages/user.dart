import 'dart:math';

class User {
  final String id;
  String name;
  double totalAmount = 0.0;
  DateTime createdAt;
  List<String> friends;
  Map<String, double> friendsOwing;

  User({
    required this.id,
    required this.name,
    List<String>? friends,
    Map<String, double>? friendsOwing,
  })  : createdAt = DateTime.now(),
        friends = friends ?? [],
        friendsOwing = friendsOwing ?? {},
        assert((friends == null && friendsOwing == null) ||
            (friends!.length == friendsOwing!.length)) {
    if (friendsOwing != null) {
      totalAmount = friendsOwing.values
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
