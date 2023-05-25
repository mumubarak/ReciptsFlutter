class VendorsModel {
  String? message;
  List<VendorsData>? vendorsData;

  VendorsModel({this.message, this.vendorsData});

  VendorsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['results'] != null) {
      vendorsData = <VendorsData>[];
      json['results'].forEach((v) {
        vendorsData!.add(new VendorsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.vendorsData != null) {
      data['results'] = this.vendorsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VendorsData {
  String? sId;
  String? vendorName;
  String? vendorImg;
  int? iV;

  VendorsData({this.sId, this.vendorName, this.vendorImg, this.iV});

  VendorsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    vendorName = json['vendorName'];
    vendorImg = json['vendorImg'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['vendorName'] = this.vendorName;
    data['vendorImg'] = this.vendorImg;
    data['__v'] = this.iV;
    return data;
  }
}
