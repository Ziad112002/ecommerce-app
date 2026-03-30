import '../metadata.dart';
import 'remote_category.dart';

class CategoryResponse {
  CategoryResponse({
      this.results, 
      this.metadata, 
      this.data,});

  CategoryResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(RemoteCategory.fromJson(v));
      });
    }
  }
  num? results;
  Metadata? metadata;
  List<RemoteCategory>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}