class Data {
  final int doctorId;
  final int encDoctorId;
  final String title;
  final String body;

  Data({this.doctorId, this.encDoctorId, this.title, this.body});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        doctorId: json['DoctorId'],
        encDoctorId: json['DoctorId'],
        title: json['title'],
        body: json['body']);
  }
}
