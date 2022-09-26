class CardInfoModel {
  String title, subtitle, image;
  Function? onCardClick;
  CardInfoModel(
      {required this.title,
      required this.subtitle,
      required this.image,
      this.onCardClick});
}
