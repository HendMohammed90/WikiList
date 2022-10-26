class CardInfoModel {
  String name, email, image;
  Function? onCardClick;
  CardInfoModel(
      {required this.name,
      required this.email,
      required this.image,
      this.onCardClick});
}
