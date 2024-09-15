extension IntExtension on int{
  String get formatJobTitle{
    if(this == 0){
      return "Uydan";
    }else if(this == 1){
      return "Ofisdan";
    }else {
      return "Har qanday";
    }
  }
}