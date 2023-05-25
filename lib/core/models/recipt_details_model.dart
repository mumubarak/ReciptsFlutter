class ReciptDetailsModel {
  String? message;
  Results? results;

  ReciptDetailsModel({this.message, this.results});

  ReciptDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    results =
    json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  String? sId;
  String? creationAt;
  String? dateTime;
  int? amount;
  int? totalAmount;
  String? status;
  int? tax;
  int? service;
  Vendor? vendor;
  List<Items>? items;
  String? userId;
  Category? category;
  int? iV;

  Results(
      {this.sId,
        this.creationAt,
        this.dateTime,
        this.amount,
        this.totalAmount,
        this.status,
        this.tax,
        this.service,
        this.vendor,
        this.items,
        this.userId,
        this.category,
        this.iV});

  Results.fromJson(Map<String, dynamic> json) {
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
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    userId = json['userId'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
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
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['userId'] = this.userId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
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

class Items {
  String? item;
  double? quantity;
  int? price;
  String? sId;

  Items({this.item, this.quantity, this.price, this.sId});

  Items.fromJson(Map<String, dynamic> json) {
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

class Category {
  String? sId;
  String? categoryName;
  String? categoryImg;
  int? iV;

  Category({this.sId, this.categoryName, this.categoryImg, this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryName = json['categoryName'];
    categoryImg = json['categoryImg'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['categoryName'] = this.categoryName;
    data['categoryImg'] = this.categoryImg;
    data['__v'] = this.iV;
    return data;
  }
}
