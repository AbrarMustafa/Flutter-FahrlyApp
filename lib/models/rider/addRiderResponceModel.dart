

class AddRiderResponce{
  String id;
  String name;
  String company;

  AddRiderResponce(this.id, this.name, this.company,);

  AddRiderResponce.fromJson(Map<String, dynamic> json):
        id = json['id'],
        name = json['name'],
        company = json['company']
  {}

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
        'company': company,
      };
}

