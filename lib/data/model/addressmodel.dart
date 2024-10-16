class MyAddressModel {
  int? AddressId;
  int? AddressUsersid;
  String? AddressName;
  String? AddressCity;
  String? AddressStreet;
  String? AddressLat;
  String? AddressLong;


  MyAddressModel(
      {this.AddressId,
        this.AddressUsersid,
        this.AddressName,
        this.AddressCity,
        this.AddressStreet,
        this.AddressLat,
        this.AddressLong,
        });

  MyAddressModel.fromJson(Map<String, dynamic> json) {
    AddressId = json['address_id'];
    AddressUsersid = json['address_userid'];
    AddressName = json['address_name'];
    AddressCity = json['address_city'];
    AddressStreet = json['address_street'];
    AddressLat = json['address_lat'];
    AddressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.AddressId;
    data['address_userid'] = this.AddressUsersid;
    data['address_name'] = this.AddressName;
    data['address_city'] = this.AddressCity;
    data['address_street'] = this.AddressStreet;
    data['address_lat'] = this.AddressLat;
    data['address_long'] = this.AddressLong;

    return data;
  }
}