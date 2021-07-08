final String imageAssetsRoot = "assets/images/";
final String blogApp = _getImagePath("blogApp.png");
/*
final String image2 = _getImagePath("2.jpeg");
final String image3 = _getImagePath("3.jpeg");
final String image4 = _getImagePath("4.jpeg");
final String image5 = _getImagePath("5.jpeg");
final String image6 = _getImagePath("6.jpeg");
final String logo = _getImagePath("logo.png");
*/


String _getImagePath(String fileName){
  return imageAssetsRoot + fileName;
}