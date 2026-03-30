import '../metadata.dart';
import 'remote_product.dart';

class ProductResponse {
  ProductResponse({
      this.results, 
      this.metadata, 
      this.data,});

  ProductResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(RemoteProduct.fromJson(v));
      });
    }
  }
  num? results;
  Metadata? metadata;
  List<RemoteProduct>? data;
ProductResponse copyWith({  num? results,
  Metadata? metadata,
  List<RemoteProduct>? data,
}) => ProductResponse(  results: results ?? this.results,
  metadata: metadata ?? this.metadata,
  data: data ?? this.data,
);
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