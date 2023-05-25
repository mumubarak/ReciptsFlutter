class ReciptsModel {
  String? message;
  List<ReciptsData>? reciptsData;

  ReciptsModel({this.message, this.reciptsData});

  ReciptsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['results'] != null) {
      reciptsData = <ReciptsData>[];
      json['results'].forEach((v) {
        reciptsData!.add(new ReciptsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.reciptsData != null) {
      data['results'] = this.reciptsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReciptsData {
  String? sId;
  String? creationAt;
  String? dateTime;
  int? amount;
  int? totalAmount;
  String? status;
  int? tax;
  int? service;
  Vendor? vendor;
  List<ReciptItem>? reciptItem;
  String? userId;
  int? iV;

  ReciptsData(
      {this.sId,
        this.creationAt,
        this.dateTime,
        this.amount,
        this.totalAmount,
        this.status,
        this.tax,
        this.service,
        this.vendor,
        this.reciptItem,
        this.userId,
        this.iV});

  ReciptsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    creationAt = json['creationAt'];
    dateTime = json['dateTime'];
    amount = json['amount'];
    totalAmount = json['totalAmount'];
    status = json['status'];
    tax = json['tax'];
    service = json['service'];
    vendor =
    json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    if (json['items'] != null) {
      reciptItem = <ReciptItem>[];
      json['items'].forEach((v) {
        reciptItem!.add(new ReciptItem.fromJson(v));
      });
    }
    userId = json['userId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['creationAt'] = this.creationAt;
    data['dateTime'] = this.dateTime;
    data['amount'] = this.amount;
    data['totalAmount'] = this.totalAmount;
    data['status'] = this.status;
    data['tax'] = this.tax;
    data['service'] = this.service;
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    if (this.reciptItem != null) {
      data['items'] = this.reciptItem!.map((v) => v.toJson()).toList();
    }
    data['userId'] = this.userId;
    data['__v'] = this.iV;
    return data;
  }
}

class Vendor {
  String? sId;
  String? vendorName;
  String? vendorImg;
  int? iV;

  Vendor({this.sId, this.vendorName, this.vendorImg, this.iV});

  Vendor.fromJson(Map<String, dynamic> json) {
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

class ReciptItem {
  String? item;
  double? quantity;
  int? price;
  String? sId;

  ReciptItem({this.item, this.quantity, this.price, this.sId});

  ReciptItem.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    quantity = json['quantity'];
    price = json['price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item'] = this.item;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['_id'] = this.sId;
    return data;
  }
}
