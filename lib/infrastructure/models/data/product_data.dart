import 'brand.dart';
import 'category_data.dart';
import 'digital.dart';
import 'galleries.dart';
import 'properties.dart';
import 'review_data.dart';
import 'shop_data.dart';
import 'stock.dart';
import 'translation.dart';
import 'unit_data.dart';

class ProductData {
  ProductData({
    int? id,
    String? uuid,
    int? shopId,
    int? categoryId,
    String? keywords,
    String? barcode,
    int? brandId,
    num? tax,
    int? minQty,
    int? maxQty,
    int? ageLimit,
    bool? active,
    bool? digital,
    String? img,
    String? createdAt,
    String? updatedAt,
    String? status,
    num? ratingAvg,
    dynamic ordersCount,
    Translation? translation,
    List<Translation>? translations,
    List<String>? locales,
    List<Properties>? properties,
    List<Stocks>? stocks,
    Stocks? stock,
    ShopData? shop,
    CategoryData? category,
    Brand? brand,
    UnitData? unit,
    Digital? digitalFile,
    List<ReviewData>? reviews,
    List<Galleries>? galleries,
    int? cartCount,
    num? interval,
  }) {
    _id = id;
    _uuid = uuid;
    _shopId = shopId;
    _categoryId = categoryId;
    _keywords = keywords;
    _brandId = brandId;
    _tax = tax;
    _digital = digital;
    _minQty = minQty;
    _maxQty = maxQty;
    _active = active;
    _digital = digital;
    _ageLimit = ageLimit;
    _img = img;
    _stock = stock;
    _interval = interval;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _ratingAvg = ratingAvg;
    _ordersCount = ordersCount;
    _translation = translation;
    _translations = translations;
    _locales = locales;
    _properties = properties;
    _stocks = stocks;
    _shop = shop;
    _category = category;
    _brand = brand;
    _unit = unit;
    _reviews = reviews;
    _galleries = galleries;
    _cartCount = cartCount;
    _barcode = barcode;
    _status = status;
  }

  ProductData.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _shopId = json['shop_id'];
    _active = json['active'];
    _categoryId = json['category_id'];
    _keywords = json['keywords'];
    _brandId = json['brand_id'];
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _stock = json['stock'] != null ? Stocks.fromJson(json['stock']) : null;
    _digitalFile = json['digital_file'] != null
        ? Digital.fromJson(json['digital_file'])
        : null;
    _interval = json['interval'];
    _tax = json['tax'];
    _minQty = json['min_qty'];
    _maxQty = json['max_qty'];
    _img = json['img'];
    _ageLimit = json['age_limit'];
    _barcode = json['bar_code'];
    _category = json['category'] != null
        ? CategoryData.fromJson(json['category'])
        : null;
    _unit = json['unit'] != null ? UnitData.fromJson(json['unit']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _status = json['status'];
    _digital = json['digital'];
    _ratingAvg = json['rating_avg'];
    _ordersCount = json['orders_count'];
    _cartCount = 0;
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    if (json['translations'] != null) {
      _translations = [];
      json['translations'].forEach((v) {
        _translations?.add(Translation.fromJson(v));
      });
    }
    if (json['locales'] != null) {
      _locales = [];
      json['locales'].forEach((v) {
        _locales?.add(v);
      });
    }
    if (json['properties'] != null) {
      _properties = [];
      json['properties'].forEach((v) {
        _properties?.add(Properties.fromJson(v));
      });
    }
    if (json['stocks'] != null) {
      _stocks = [];

      json['stocks'].forEach((v) {
        _stocks?.add(Stocks.fromJson(v));
      });
      if (_stocks?.isNotEmpty ?? false) {
        if (_stocks?.first.extras?.isNotEmpty ?? false) {
          _stocks?.forEach((element) {
            element.extras?.sort(
                (p, n) => ((p.group?.id ?? 0) < (n.group?.id ?? 0) ? 1 : 0));
          });
        }
      }
    }
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(ReviewData.fromJson(v));
      });
    }
    if (json['galleries'] != null) {
      _galleries = [];
      json['galleries'].forEach((v) {
        _galleries?.add(Galleries.fromJson(v));
      });
    }
  }

  int? _id;
  String? _uuid;
  String? _barcode;
  String? _status;
  int? _shopId;
  num? _interval;
  int? _categoryId;
  String? _keywords;
  bool? _digital;
  int? _brandId;
  int? _ageLimit;
  num? _tax;
  Stocks? _stock;
  int? _minQty;
  int? _maxQty;
  bool? _active;
  String? _img;
  String? _createdAt;
  String? _updatedAt;
  num? _ratingAvg;
  dynamic _ordersCount;
  Translation? _translation;
  List<Translation>? _translations;
  List<String>? _locales;
  List<Properties>? _properties;
  List<Stocks>? _stocks;
  ShopData? _shop;
  CategoryData? _category;
  Brand? _brand;
  UnitData? _unit;
  Digital? _digitalFile;
  List<ReviewData>? _reviews;
  List<Galleries>? _galleries;

  int? _cartCount;

  ProductData copyWith({
    int? id,
    int? cartCount,
    String? uuid,
    int? shopId,
    num? interval,
    int? categoryId,
    String? keywords,
    int? brandId,
    num? tax,
    int? minQty,
    int? maxQty,
    int? ageLimit,
    bool? active,
    bool? digital,
    String? img,
    String? barcode,
    String? createdAt,
    Stocks? stock,
    String? status,
    String? updatedAt,
    num? ratingAvg,
    dynamic ordersCount,
    Translation? translation,
    List<Translation>? translations,
    List<String>? locales,
    List<Properties>? properties,
    List<Stocks>? stocks,
    ShopData? shop,
    CategoryData? category,
    Brand? brand,
    UnitData? unit,
    Digital? digitalFile,
    List<ReviewData>? reviews,
    List<Galleries>? galleries,
  }) =>
      ProductData(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        shopId: shopId ?? _shopId,
        categoryId: categoryId ?? _categoryId,
        keywords: keywords ?? _keywords,
        brandId: brandId ?? _brandId,
        tax: tax ?? _tax,
        minQty: minQty ?? _minQty,
        maxQty: maxQty ?? _maxQty,
        active: active ?? _active,
        img: img ?? _img,
        stock: stock ?? _stock,
        interval: interval ?? _interval,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        ratingAvg: ratingAvg ?? _ratingAvg,
        ordersCount: ordersCount ?? _ordersCount,
        translation: translation ?? _translation,
        translations: translations ?? _translations,
        locales: locales ?? _locales,
        properties: properties ?? _properties,
        stocks: stocks ?? _stocks,
        shop: shop ?? _shop,
        digitalFile: digitalFile ?? _digitalFile,
        category: category ?? _category,
        brand: brand ?? _brand,
        unit: unit ?? _unit,
        reviews: reviews ?? _reviews,
        galleries: galleries ?? _galleries,
        barcode: barcode ?? _barcode,
        cartCount: cartCount ?? _cartCount,
        status: status ?? _status,
        digital: digital ?? _digital,
        ageLimit: ageLimit ?? _ageLimit,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  String? get barcode => _barcode;

  int? get shopId => _shopId;

  num? get interval => _interval;

  int? get categoryId => _categoryId;

  String? get keywords => _keywords;

  String? get status => _status;

  Stocks? get stock => _stock;

  int? get brandId => _brandId;

  num? get tax => _tax;

  int? get minQty => _minQty;

  int? get ageLimit => _ageLimit;

  int? get maxQty => _maxQty;

  bool? get active => _active;

  bool? get digital => _digital;

  String? get img => _img;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  num? get ratingAvg => _ratingAvg;

  dynamic get ordersCount => _ordersCount;

  Translation? get translation => _translation;

  List<Translation>? get translations => _translations;

  List<String>? get locales => _locales;

  List<Properties>? get properties => _properties;

  List<Stocks>? get stocks => _stocks;

  ShopData? get shop => _shop;

  Digital? get digitalFile => _digitalFile;

  CategoryData? get category => _category;

  Brand? get brand => _brand;

  UnitData? get unit => _unit;

  int? get cartCount => _cartCount;

  List<ReviewData>? get reviews => _reviews;

  List<Galleries>? get galleries => _galleries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['shop_id'] = _shopId;
    map['barcode'] = _barcode;
    map['category_id'] = _categoryId;
    map['keywords'] = _keywords;
    map['brand_id'] = _brandId;
    map['tax'] = _tax;
    map['min_qty'] = _minQty;
    map['max_qty'] = _maxQty;
    map['active'] = _active;
    map['img'] = _img;
    map['age_limit'] = _ageLimit;
    map['digital'] = _digital;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['rating_avg'] = _ratingAvg;
    map['orders_count'] = _ordersCount;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    if (_properties != null) {
      map['properties'] = _properties?.map((v) => v.toJson()).toList();
    }
    if (_stocks != null) {
      map['stocks'] = _stocks?.map((v) => v.toJson()).toList();
    }
    if (_shop != null) {
      map['shop'] = _shop?.toJson();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    if (_unit != null) {
      map['unit'] = _unit?.toJson();
    }
    if (_digitalFile != null) {
      map['digital_file'] = _digitalFile?.toJson();
    }
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    if (_galleries != null) {
      map['galleries'] = _galleries?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
