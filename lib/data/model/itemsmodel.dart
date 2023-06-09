class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsDesc;
  int? itemsActive;
  double? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  String? itemsImage;
  int? itemsType;
  int? typeId;
  String? typeName;
  int? typeCat;
  int? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesDatatime;

  ItemsModel(
      {this.itemsId,
        this.itemsName,
        this.itemsDesc,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsImage,
        this.itemsType,
        this.typeId,
        this.typeName,
        this.typeCat,
        this.categoriesId,
        this.categoriesName,
        this.categoriesImage,
        this.categoriesDatatime});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDesc = json['items_desc'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsImage = json['items_image'];
    itemsType = json['items_type'];
    typeId = json['type_id'];
    typeName = json['type_name'];
    typeCat = json['type_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesDatatime = json['categories_datatime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_desc'] = this.itemsDesc;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_image'] = this.itemsImage;
    data['items_type'] = this.itemsType;
    data['type_id'] = this.typeId;
    data['type_name'] = this.typeName;
    data['type_cat'] = this.typeCat;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_datatime'] = this.categoriesDatatime;
    return data;
  }
}