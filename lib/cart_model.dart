class CartModel{
   String productName;
   String productPrice;
   String productImage;


  CartModel({
    this.productName,
    this.productPrice,
    this.productImage,

});

  CartModel.fromJson(Map<String , dynamic> json){
    productName = json['productName'];
    productPrice = json['productPrice'];
    productImage = json['productImage'];

  }

  Map<String , dynamic>toMap(){
    return{
      'productName' : productName,
      'productPrice' : productPrice,
      'productImage' : productImage,

    };
  }

}