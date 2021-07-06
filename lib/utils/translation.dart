import 'package:get/get.dart';

class MyTranslation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en':{
      'title':'Blog App',
      'body':'here is body'
    },
    'tr':{
      'title':'Blog uygulaması',
      'body':'burası gövde '
    }
  };

}