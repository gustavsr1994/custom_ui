class AbsentModel {
  String? checkIn;
  String? checkOut;
  String? date;
  String? name;

  AbsentModel({this.checkIn, this.checkOut, this.date, this.name});

  AbsentModel.fromJson(Map<String, dynamic> json) {
    checkIn = json['checkIn'];
    checkOut = json['checkOut'];
    date = json['date'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkIn'] = this.checkIn;
    data['checkOut'] = this.checkOut;
    data['date'] = this.date;
    data['name'] = this.name;
    return data;
  }
}
