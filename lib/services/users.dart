class UserProfile {
  final String userId;
  final String userEmail;
  final String userName;
  final String userPhone;
  final String userGender;
  final String userCollege;
  final String userYear;
  List registeredEvents;

  static UserProfile? currentUser;
  UserProfile(this.userId, this.userEmail, this.userName, this.userPhone,
      this.userGender, this.userCollege, this.userYear, this.registeredEvents);
}
