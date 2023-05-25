class LineChartsModel {
  String? message;
  LineCharts? lineCharts;

  LineChartsModel({this.message, this.lineCharts});

  LineChartsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    lineCharts = json['lineChart'] != null
        ? LineCharts.fromJson(json['lineChart'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.lineCharts != null) {
      data['lineChart'] = this.lineCharts!.toJson();
    }
    return data;
  }
}

class LineCharts {
  String? sId;
  String? creationAt;
  String? status;
  String? userId;
  List<LineChartsData>? lineChartData;
  int? iV;

  LineCharts(
      {this.sId,
        this.creationAt,
        this.status,
        this.userId,
        this.lineChartData,
        this.iV});

  LineCharts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    creationAt = json['creationAt'];
    status = json['status'];
    userId = json['userId'];
    if (json['lineChart'] != null) {
      lineChartData = <LineChartsData>[];
      json['lineChart'].forEach((v) {
        lineChartData!.add(new LineChartsData.fromJson(v));
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
    if (this.lineChartData != null) {
      data['lineChart'] = this.lineChartData!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class LineChartsData {
  int? x;
  int? y;
  String? color;
  String? sId;

  LineChartsData({this.x, this.y, this.color, this.sId});

  LineChartsData.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    color = json['color'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['color'] = this.color;
    data['_id'] = this.sId;
    return data;
  }
}
