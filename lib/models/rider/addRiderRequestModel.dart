

class AddRiderRequest{
  String firebase_token;
  String firebase_fcm_token;
  String device_type;
  String name;
  String phone;
  String company_code;

  AddRiderRequest(this.firebase_token, this.firebase_fcm_token, this.device_type, this.name, this.phone, this.company_code,);

  AddRiderRequest.fromJson(Map<String, dynamic> json):
        firebase_token = json['firebase_token'],
        firebase_fcm_token = json['firebase_fcm_token'],
        device_type = json['device_type'],
        name = json['name'],
        phone = json['phone'],
        company_code = json['company_code']
  {}

  Map<String, dynamic> toJson() =>
      {
        'firebase_token': firebase_token,
        'firebase_fcm_token': firebase_fcm_token,
        'device_type': device_type,
        'name': name,
        'phone': phone,
        'company_code': company_code,
      };
}

