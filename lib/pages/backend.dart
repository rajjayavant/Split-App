import 'package:split_app/pages/user.dart';

User getUserData() {
  User user1 = User(
    id: 'u1',
    name: 'Alice',
    friends: ['u2', 'u3', 'u4', 'u5', 'u6'],
    friendsOwing: {
      'u2': -50.0,
      'u3': 100.0,
      'u4': -20.0,
      'u5': 80.0,
      'u6': -30.0
    },
  );
  return user1;
}
