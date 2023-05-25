class UserModel {
  UserData? user;
  String? message;

  UserModel({this.user, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new UserData.fromJson(json['user']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class UserData {
  String? sId;
  String? userName;
  String? creationAt;
  String? gender;
  String? dateOfBirth;
  String? email;
  String? status;
  String? password;

  // List<Null>? restaurants;
  // List<Null>? products;
  int? iV;
  String? token;
  List<CategoryData>? category;

  // List<Null>? resipts;
  // List<VendorData>? vendor;

  UserData({
    this.sId,
    this.userName,
    this.creationAt,
    this.gender,
    this.dateOfBirth,
    this.email,
    this.status,
    this.password,
    // this.restaurants,
    // this.products,
    this.iV,
    this.token,
    this.category,
    // this.resipts,
    // this.vendor,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    creationAt = json['creationAt'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    email = json['email'];
    status = json['status'];
    password = json['password'];
    // if (json['restaurants'] != null) {
    //   restaurants = <Null>[];
    //   json['restaurants'].forEach((v) {
    //     restaurants!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['products'] != null) {
    //   products = <Null>[];
    //   json['products'].forEach((v) {
    //     products!.add(new Null.fromJson(v));
    //   });
    // }
    iV = json['__v'];
    token = json['token'];
    if (json['category'] != null) {
      category = <CategoryData>[];
      json['category'].forEach((v) {
        category!.add(new CategoryData.fromJson(v));
      });
    }
    // if (json['resipts'] != null) {
    //   resipts = <Null>[];
    //   json['resipts'].forEach((v) {
    //     resipts!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['vendor'] != null) {
    //   vendor = <Null>[];
    //   json['vendor'].forEach((v) {
    //     vendor!.add(new VendorData.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['creationAt'] = this.creationAt;
    data['gender'] = this.gender;
    data['dateOfBirth'] = this.dateOfBirth;
    data['email'] = this.email;
    data['status'] = this.status;
    data['password'] = this.password;
    // if (this.restaurants != null) {
    //   data['restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
    // }
    // if (this.products != null) {
    //   data['products'] = this.products!.map((v) => v.toJson()).toList();
    // }
    data['__v'] = this.iV;
    data['token'] = this.token;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    // if (this.resipts != null) {
    //   data['resipts'] = this.resipts!.map((v) => v.toJson()).toList();
    // }
    // if (this.vendor != null) {
    //   data['vendor'] = this.vendor!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class CategoryData {
  String? sId;
  String? categoryName;
  String? categoryImg;
  int? iV;

  CategoryData({this.sId, this.categoryName, this.categoryImg, this.iV});

  CategoryData.fromJson(Map<String, dynamic> json) {
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

class VendorData {
  String? sId;
  String? vendorName;
  String? vendorImg;
  int? iV;

  VendorData({this.sId, this.vendorName, this.vendorImg, this.iV});

  VendorData.fromJson(Map<String, dynamic> json) {
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
