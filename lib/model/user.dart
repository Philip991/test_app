class User {
  final String id;
  //final String username;
  final String email;
  final String phoneNumber;
  final String interest1;
//  final String interest2;

  const User({
    this.id = '',
    // required this.username,
    required this.email,
    required this.phoneNumber,
    required this.interest1,
    //  required this.interest2
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'phoneNumber': phoneNumber,
        'interest1': interest1,
      };
}
