class PinChartsModel {
  String? message;
  PieCharts? pieChart;

  PinChartsModel({this.message, this.pieChart});

  PinChartsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    pieChart = json['pieChart'] != null
        ? new PieCharts.fromJson(json['pieChart'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.pieChart != null) {
      data['pieChart'] = this.pieChart!.toJson();
    }
    return data;
  }
}

class PieCharts {
  String? sId;
  String? creationAt;
  String? status;
  String? userId;
  List<PieChartsData>? pieChartData;
  int? iV;

  PieCharts(
      {this.sId,
        this.creationAt,
        this.status,
        this.userId,
        this.pieChartData,
        this.iV});

  PieCharts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    creationAt = json['creationAt'];
    status = json['status'];
    userId = json['userId'];
    if (json['pieChart'] != null) {
      pieChartData = <PieChartsData>[];
      json['pieChart'].forEach((v) {
        pieChartData!.add(new PieChartsData.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['creationAt'] = this.creationAt;
    data['status'] = this.status;
    data['userId'] = this.userId;
    if (this.pieChartData != null) {
      data['pieChart'] = this.pieChartData!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class PieChartsData {
  String? title;
  int? value;
  String? color;
  String? sId;

  PieChartsData({this.title, this.value, this.color, this.sId});

  PieChartsData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
    color = json['color'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    data['color'] = this.color;
    data['_id'] = this.sId;
    return data;
  }
}
