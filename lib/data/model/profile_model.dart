class ProfileModel {
  int? id;
  String? title;
  int? mobile;

  ProfileModel(

      {
        this.id,
        required this.title,
        required this.mobile,

      });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id =json['id'];
    title = json['title'];
    mobile = json['mobile'] ;

    //rating =
    //json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']  = this.id;
    data['title'] = this.title;
    data['mobile'] = this.mobile;

    return data;
  }
}


