class User {
  final int userId;
  final String name;
  final String email;
  final String password;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
  });
}
List<User> users = [
  User(
    userId: 1,
    name: 'Alaa',
    email: 'alaa@gmail.com',
    password: '774460081',
  ),
  User(
    userId: 2,
    name: 'John Doe',
    email: 'aiman@example.com',
    password: '780060445',
  ),
  User(
    userId: 3,
    name: 'Jane Doe',
    email: 'jane@example.com',
    password: 'mypassword',
  ),
  User(
    userId: 4,
    name: 'John Smith',
    email: 'john@example.com',
    password: 'password123',
  ),
  User(
    userId: 5,
    name: 'Emma Brown',
    email: 'emma@example.com',
    password: 'helloWorld',
  ),
];