class statelistmodel {
  String? status;
  String? msg;
  List<Data>? data;

  statelistmodel({this.status, this.msg, this.data});

  statelistmodel.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  Null? parentId;
  String? externalId;
  String? locationType;
  Null? pin;

  Data(
      {this.id,
      this.name,
      this.parentId,
      this.externalId,
      this.locationType,
      this.pin});

  Data.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    externalId = json['external_id'];
    locationType = json['location_type'];
    pin = json['pin'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parent_id'] = this.parentId;
    data['external_id'] = this.externalId;
    data['location_type'] = this.locationType;
    data['pin'] = this.pin;
    return data;
  }
}