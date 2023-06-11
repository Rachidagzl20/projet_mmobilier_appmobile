class Publication {
  late String username;
  final DateTime date;
  final String imageID;
  final String userID;
  late String imageProfile;
  final String description;

  Publication({
    required this.date,
    required this.imageID,
    required this.userID,
    required this.description,
  }) {
    // Initialize other properties with default values
    username = '';
    imageProfile = '';
  }
}
