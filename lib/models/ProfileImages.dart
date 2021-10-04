class ProfileImages {
  String myimageURL;
  String myphoto1URL;
  String myphoto2URL;
  String myphoto3URL;

  ProfileImages({
    this.myimageURL = '',
    this.myphoto1URL = '',
    this.myphoto2URL = '',
    this.myphoto3URL = '',
  });

  ProfileImages.fromJson(Map<dynamic, dynamic> json) {
    myimageURL = json['myimageURL'];
    myphoto1URL = json['myphoto1URL'];
    myphoto2URL = json['myphoto2URL'];
    myphoto3URL = json['myphoto3URL'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['myimageURL'] = this.myimageURL;
    data['myphoto1URL'] = this.myphoto1URL;
    data['myphoto2URL'] = this.myphoto2URL;
    data['myphoto3URL'] = this.myphoto3URL;

    return data;
  }
}
