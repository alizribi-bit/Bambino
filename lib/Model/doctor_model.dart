class Doctor {
  String? fullName;
  String? lacation;
  String? speciality;
  String? workTime;
  String? about;
  String? photo;
  int? nobrePatients;
  int? experience;
  double? rating;
  int? reviews;

  Doctor(
      {this.fullName,
      this.lacation,
      this.speciality,
      this.workTime,
      this.about,
      this.photo,
      this.nobrePatients,
      this.experience,
      this.rating,
      this.reviews});

  Doctor.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    lacation = json['Lacation'];
    speciality = json['speciality'];
    workTime = json['workTime'];
    about = json['about'];
    photo = json['photo'];
    nobrePatients = json['nobrePatients'];
    experience = json['experience'];
    rating = json['rating'];
    reviews = json['reviews'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['Lacation'] = lacation;
    data['speciality'] = speciality;
    data['workTime'] = workTime;
    data['about'] = about;
    data['photo'] = photo;
    data['nobrePatients'] = nobrePatients;
    data['experience'] = experience;
    data['rating'] = rating;
    data['reviews'] = reviews;
    return data;
  }
}
