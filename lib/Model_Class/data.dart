class Data{
  int? id;
  String? email;
  String? frist_name;
  String? last_mame;
  String? avatar;

  Data({this.id,this.avatar,this.frist_name,this.email,this.last_mame});


  factory Data.formjson(Map<String, dynamic> json){
    return Data(
      id: json['id'],
      email: json['email'],
      frist_name: json['first_name'],
      last_mame: json['last_name'],
      avatar: json['avatar'],
    );
  }
}