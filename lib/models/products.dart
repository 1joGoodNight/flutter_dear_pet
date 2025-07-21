class Products {
  // String imgUrl;//상품이미지
  String name; //상품이름
  int price; //상품가격
  String discriptions; //상품설명
  String imgpath;

  Products(
      {required this.name,
      required this.price,
      required this.discriptions,
      required this.imgpath});

  factory Products.fromJson(List<dynamic> json) {
    return Products(
      name: json[0],
      price: json[1],
      discriptions: json[2],
      imgpath: json[3]//.replaceAll(r'\', '/'), // 역슬래시 처리
    );
  }
}
