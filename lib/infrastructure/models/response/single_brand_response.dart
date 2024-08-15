import '../data/brand.dart';
import 'response.dart';

class SingleBrandResponse {
  SingleBrandResponse({Brand? data, Meta? meta}) {
    _data = data;
    _meta = meta;
  }

  SingleBrandResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? Brand.fromJson(json['data']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Brand? _data;
  Meta? _meta;

  SingleBrandResponse copyWith({Brand? data, Meta? meta}) =>
      SingleBrandResponse(data: data ?? _data, meta: meta ?? _meta);

  Brand? get data => _data;

  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = _data?.toJson();
    map['meta'] = _meta?.toJson();
    return map;
  }
}
