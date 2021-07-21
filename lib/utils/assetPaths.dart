final String imageAssetsRoot = "assets/images/";
final String blogAppLogo = _getImagePath("blogApp.png");
final String addPerson = _getImagePath("addPerson.png");



String _getImagePath(String fileName){
  return imageAssetsRoot + fileName;
}