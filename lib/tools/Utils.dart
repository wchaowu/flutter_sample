class EptUtils {
  String cutImage(String imgUrl, int width, int height) {
    if (imgUrl != null && imgUrl.length > 0) {
      String rbImgUrl;
      if (imgUrl.indexOf(".gif") < 0) {
        rbImgUrl = imgUrl.replaceFirst("/jfs/",
            "/s" + width.toString() + "x" + height.toString() + "_jfs/");
        if (imgUrl.indexOf("jfs/") < 0) {
          // return "https://static.joybuy.com/ept_m/index/v20181225/logo.png";
          // rbImgUrl = imgUrl.replaceFirst("/cms/",
          //     "/cms/s" + width.toString() + "x" + height.toString() + "_jfs/");
        }
      } else {
        rbImgUrl = imgUrl;
      }

      print(rbImgUrl);
      return rbImgUrl.trim();
    }
    return "";
  }
}
