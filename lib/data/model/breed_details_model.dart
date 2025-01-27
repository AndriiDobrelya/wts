class BreedDetailsModel {
  BreedDetailsModel({this.message, this.status});

  BreedDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  String? message;
  String? status;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
