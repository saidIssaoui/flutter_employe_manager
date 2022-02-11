class userSatatus {
  final bool disabled;

  userSatatus({
    required this.disabled,
  });

  factory userSatatus.fromJson(Map<String, dynamic> json) {
    return userSatatus(
      disabled: json['disabled'],
    );
  }
}
