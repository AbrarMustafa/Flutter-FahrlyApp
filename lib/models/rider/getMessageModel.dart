
class GetMessageResponce{
  String id;
  String pickup_address;
  String dropoff_address;
  String price;
  String time;
  String ownerMessage;
  String createdAt;

  GetMessageResponce(this.id, this.pickup_address, this.dropoff_address, this.price, this.time, this.ownerMessage, this.createdAt);

  GetMessageResponce.fromJson(Map<String, dynamic> json):
        id = json['_id'],
        pickup_address = json.containsKey("pickup_address")?json['pickup_address']:"",
        dropoff_address = json.containsKey("dropoff_address")?json['dropoff_address']:"",
        price = json.containsKey("price")?json['price']:"",
        time = json.containsKey("time")?json['time']:"",
        ownerMessage = json.containsKey("ownerMessage")?json['ownerMessage']:"",
        createdAt = json['createdAt']
  {}

  Map<String, dynamic> toJson() =>
      {
        '_id': id,
        'pickup_address': pickup_address,
        'dropoff_address': dropoff_address,
        'price': price,
        'time': time,
        'ownerMessage': ownerMessage,
        'createdAt': createdAt,
      };
}
