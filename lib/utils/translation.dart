import 'package:get/get.dart';

class MyTranslation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en':{
      'title':'Blog App',
      'body':'here is body',
      'kayıt':'Sing up',
      'login':'Login'
    },
    'tr':{
      'title':'Blog uygulaması',
      'body':'burası gövde ',
      'kayıt':'Kayıt ol ',
      "login":'Giriş yap'
    }
  };

}