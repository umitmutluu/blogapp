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
      'hesapAc':'Don\'t have an account? ',
      'olustur':'Create account! ',
'bağlantıDoğru':'Connection OK',
'bağlantıYanlış':'Connection Failed',
      'zatenVar':"Already have an account?",
      'password':'Password',
      'kayıt':'Sing up',
      'Err':'Error',
      'boşBırakma':"Do not leave fields blank",
      'login':'Sign in!!'
    },
    'tr':{
      'title':'Blog uygulaması',
      'name':'İsim',
      'username':'Kullanıcı Adı',
      'email':'E-Posta',
      'hesapAc':'Bir Hesabınız Yok mu? ',
      'olustur':'Hesap Oluştur! ',
      'bağlantıDoğru':'İnternet Bağlantısı var!',
      'bağlantıYanlış':'İnternet Bağlantı Hatası',
      'zatenVar':"Zaten bir hesabın var mı?  ",
      'password':'Şifre',
      'kayıt':'Kayıt ol ',
      'Err':'Hata ',
      'boşBırakma':'Zorunlu alanları boş bırakamazsınız ',
      "login":'Giriş yap'
    }
  };

}