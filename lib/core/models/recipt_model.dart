class ReciptModel {
  String? serialNumber;
  String? vendor;
  String? category;
  String? tax;
  String? branch;
  String? service;
  String? dateTime;
  String? amount;
  String? totalAmount;
  List<Items>? items;

  ReciptModel(
      {this.serialNumber,
        this.vendor,
        this.category,
        this.tax,
        this.branch,
        this.service,
        this.dateTime,
        this.amount,
        this.totalAmount,
        this.items});

  ReciptModel.fromJson(Map<String, dynamic> json) {
    serialNumber = json['serialNumber'];
    vendor = json['vendor'];
    category = json['category'];
    tax = json['tax'];
    branch = json['branch'];
    service = json['service'];
    dateTime = json['date-time'];
    amount = json['amount'];
    totalAmount = json['totalAmount'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serialNumber'] = this.serialNumber;
    data['vendor'] = this.vendor;
    data['category'] = this.category;
    data['tax'] = this.tax;
    data['branch'] = this.branch;
    data['service'] = this.service;
    data['date-time'] = this.dateTime;
    data['amount'] = this.amount;
    data['totalAmount'] = this.totalAmount;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? item;
  String? quantity;
  String? price;
  String? finalPrice;

  Items({this.item, this.quantity, this.price, this.finalPrice});

  Items.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    quantity = json['quantity'];
    price = json['price'];
    finalPrice = json['final-price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item'] = this.item;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['final-price'] = this.finalPrice;
    return data;
  }
}
