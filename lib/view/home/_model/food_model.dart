
import '../../../core/base/model/base_model.dart';

class FoodModel extends BaseModel {
  String id;
  String deliveryInfo;
  List<String> imagePaths;
  String foodName;
  int numberOfLikes;
  int price;
  String returnPolicy;
  String foodType;

  FoodModel(this.deliveryInfo, this.foodName, this.numberOfLikes, this.price,
      this.returnPolicy, this.foodType);

  FoodModel.empty();

  FoodModel._fromJson(dynamic o) {
    id = o['_id'].toString();
    deliveryInfo = o['deliveryInfo'].toString();
    imagePaths = _stringToList(o['images'].toString()).split(',');
    foodName = o['name'].toString();
    numberOfLikes = int.tryParse(o['numberOfLikes'].toString());
    price = int.tryParse(o['price'].toString());
    returnPolicy = o['returnPolicy'].toString();
    foodType = o['foodType'];
  }

  @override
  fromObject(dynamic o) => FoodModel._fromJson(o);

  @override
  Map<String, dynamic> toMap() => {
        '_id': this.id,
        'deliveryInfo': this.deliveryInfo,
        'images': this.imagePaths,
        'name': this.foodName,
        'numberOfLikes': this.numberOfLikes.toString(),
        'price': this.price.toString(),
        'returnPoliciy': this.returnPolicy,
        'foodType': this.foodType
      };

  String _stringToList(String string) {
    var imagePaths = string.substring(1);
    imagePaths = imagePaths.substring(0, imagePaths.length - 1);
    return imagePaths;
  }
}
