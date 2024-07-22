/// id : 1
/// productCategory : "Smartphone"
/// name : "iPhone 12 Pro"
/// brand : "Apple"
/// description : "The iPhone 12 Pro features a new design and edge-to-edge Super Retina XDR display."
/// basePrice : 999
/// inStock : true
/// stock : 43
/// featuredImage : "https://placehold.co/800x600?text=iPhone+12+Pro"
/// thumbnailImage : "https://placehold.co/400x300?text=iPhone+12+Pro"
/// storageOptions : ["128GB","256GB","512GB"]
/// colorOptions : ["Graphite","Silver","Gold","Pacific Blue"]
/// display : "6.1-inch Super Retina XDR display"
/// CPU : "A14 Bionic chip"
/// camera : {"rearCamera":"Pro 12MP camera system: Ultra Wide, Wide, and Telephoto cameras","frontCamera":"12MP TrueDepth front camera"}

class ProductModel {
  ProductModel({
      num? id, 
      String? productCategory, 
      String? name, 
      String? brand, 
      String? description, 
      num? basePrice, 
      bool? inStock, 
      num? stock, 
      String? featuredImage, 
      String? thumbnailImage, 
      List<String>? storageOptions, 
      List<String>? colorOptions, 
      String? display, 
      String? cpu, 
      Camera? camera,}){
    _id = id;
    _productCategory = productCategory;
    _name = name;
    _brand = brand;
    _description = description;
    _basePrice = basePrice;
    _inStock = inStock;
    _stock = stock;
    _featuredImage = featuredImage;
    _thumbnailImage = thumbnailImage;
    _storageOptions = storageOptions;
    _colorOptions = colorOptions;
    _display = display;
    _cpu = cpu;
    _camera = camera;
}

  ProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _productCategory = json['productCategory'];
    _name = json['name'];
    _brand = json['brand'];
    _description = json['description'];
    _basePrice = json['basePrice'];
    _inStock = json['inStock'];
    _stock = json['stock'];
    _featuredImage = json['featuredImage'];
    _thumbnailImage = json['thumbnailImage'];
    _storageOptions = json['storageOptions'] != null ? json['storageOptions'].cast<String>() : [];
    _colorOptions = json['colorOptions'] != null ? json['colorOptions'].cast<String>() : [];
    _display = json['display'];
    _cpu = json['CPU'];
    _camera = json['camera'] != null ? Camera.fromJson(json['camera']) : null;
  }
  num? _id;
  String? _productCategory;
  String? _name;
  String? _brand;
  String? _description;
  num? _basePrice;
  bool? _inStock;
  num? _stock;
  String? _featuredImage;
  String? _thumbnailImage;
  List<String>? _storageOptions;
  List<String>? _colorOptions;
  String? _display;
  String? _cpu;
  Camera? _camera;

  num? get id => _id;
  String? get productCategory => _productCategory;
  String? get name => _name;
  String? get brand => _brand;
  String? get description => _description;
  num? get basePrice => _basePrice;
  bool? get inStock => _inStock;
  num? get stock => _stock;
  String? get featuredImage => _featuredImage;
  String? get thumbnailImage => _thumbnailImage;
  List<String>? get storageOptions => _storageOptions;
  List<String>? get colorOptions => _colorOptions;
  String? get display => _display;
  String? get cpu => _cpu;
  Camera? get camera => _camera;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['productCategory'] = _productCategory;
    map['name'] = _name;
    map['brand'] = _brand;
    map['description'] = _description;
    map['basePrice'] = _basePrice;
    map['inStock'] = _inStock;
    map['stock'] = _stock;
    map['featuredImage'] = _featuredImage;
    map['thumbnailImage'] = _thumbnailImage;
    map['storageOptions'] = _storageOptions;
    map['colorOptions'] = _colorOptions;
    map['display'] = _display;
    map['CPU'] = _cpu;
    if (_camera != null) {
      map['camera'] = _camera?.toJson();
    }
    return map;
  }

}

/// rearCamera : "Pro 12MP camera system: Ultra Wide, Wide, and Telephoto cameras"
/// frontCamera : "12MP TrueDepth front camera"

class Camera {
  Camera({
      String? rearCamera, 
      String? frontCamera,}){
    _rearCamera = rearCamera;
    _frontCamera = frontCamera;
}

  Camera.fromJson(dynamic json) {
    _rearCamera = json['rearCamera'];
    _frontCamera = json['frontCamera'];
  }
  String? _rearCamera;
  String? _frontCamera;
Camera copyWith({  String? rearCamera,
  String? frontCamera,
}) => Camera(  rearCamera: rearCamera ?? _rearCamera,
  frontCamera: frontCamera ?? _frontCamera,
);
  String? get rearCamera => _rearCamera;
  String? get frontCamera => _frontCamera;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rearCamera'] = _rearCamera;
    map['frontCamera'] = _frontCamera;
    return map;
  }

}