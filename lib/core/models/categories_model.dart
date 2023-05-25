class CategoriesModel {
  String? message;
  List<CategoriesData>? categoriesData;

  CategoriesModel({this.message, this.categoriesData});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['results'] != null) {
      categoriesData = <CategoriesData>[];
      json['results'].forEach((v) {
        categoriesData!.add(new CategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.categoriesData != null) {
      data['results'] = this.categoriesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesData {
  String? sId;
  String? categoryName;
  String? categoryImg;
  int? iV;

  CategoriesData({this.sId, this.categoryName, this.categoryImg, this.iV});

  CategoriesData.fromJson(Map<String, dynamic> json) {
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
