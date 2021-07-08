import 'package:get/get.dart';

class MyTranslation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en':{
      'title':'Blog App',
      'name':'name',
      'username':'username',
      'email':'e-mail',
      'password':'Password',
      'body':'here is body',
      'kayıt':'Sing up',
      'Err':'Error',
      'boşBırakma':"Do not leave fields blank",
      'zaten var':'Do you have account already',
      'login':'Login'
    },
    'tr':{
      'title':'Blog uygulaması',
      'name':'İsim',
      'username':'Kullanıcı Adı',
      'email':'e-posta Adresi',
      'password':'Şifre',
      'body':'burası gövde ',
      'kayıt':'Kayıt ol ',
      'Err':'Hata ',
      'boşBırakma':'Zorunlu alanları boş bırakamazsınız ',
      'zaten var':'Zaten bir hesabınız var mı',
      "login":'Giriş yap'
    }
  };

}