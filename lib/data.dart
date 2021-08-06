class Data {
  final int name;
  final int email;
  final String title;
  final String body;

  Data({this.name, this.email, this.title, this.body});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        name: json['name'],
        email: json['email'],
        title: json['title'],
        body: json['body']);
  }
}
