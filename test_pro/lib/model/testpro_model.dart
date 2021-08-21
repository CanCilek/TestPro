class TestPro {
  int age;
  String gender;
  double lenght;
  String mail;
  String name;
  String password;
  int weight;

  TestPro(
      {this.age,
      this.gender,
      this.lenght,
      this.mail,
      this.name,
      this.password,
      this.weight});

  TestPro.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    gender = json['gender'];
    lenght = json['lenght'];
    mail = json['mail'];
    name = json['name'];
    password = json['password'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['lenght'] = this.lenght;
    data['mail'] = this.mail;
    data['name'] = this.name;
    data['password'] = this.password;
    data['weight'] = this.weight;
    return data;
  }
}