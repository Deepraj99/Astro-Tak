
class PostModel {
  String httpStatus;
  int httpStatusCode;
  bool success;
  String message;
  String apiName;
  List<Data> data;

  PostModel({this.httpStatus, this.httpStatusCode, this.success, this.message, this.apiName, this.data});

  PostModel.fromJson(Map<String, dynamic> json) {
    this.httpStatus = json["httpStatus"];
    this.httpStatusCode = json["httpStatusCode"];
    this.success = json["success"];
    this.message = json["message"];
    this.apiName = json["apiName"];
    this.data = json["data"]==null ? null : (json["data"] as List).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["httpStatus"] = this.httpStatus;
    data["httpStatusCode"] = this.httpStatusCode;
    data["success"] = this.success;
    data["message"] = this.message;
    data["apiName"] = this.apiName;
    if(this.data != null)
      data["data"] = this.data.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Data {
  int id;
  String urlSlug;
  dynamic namePrefix;
  String firstName;
  String lastName;
  String aboutMe;
  dynamic profliePicUrl;
  int experience;
  List<Languages> languages;
  int minimumCallDuration;
  int minimumCallDurationCharges;
  int additionalPerMinuteCharges;
  bool isAvailable;
  dynamic rating;
  List<Skills> skills;
  bool isOnCall;
  int freeMinutes;
  int additionalMinute;
  Images images;
  Availability availability;

  Data({this.id, this.urlSlug, this.namePrefix, this.firstName, this.lastName, this.aboutMe, this.profliePicUrl, this.experience, this.languages, this.minimumCallDuration, this.minimumCallDurationCharges, this.additionalPerMinuteCharges, this.isAvailable, this.rating, this.skills, this.isOnCall, this.freeMinutes, this.additionalMinute, this.images, this.availability});

  Data.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.urlSlug = json["urlSlug"];
    this.namePrefix = json["namePrefix"];
    this.firstName = json["firstName"];
    this.lastName = json["lastName"];
    this.aboutMe = json["aboutMe"];
    this.profliePicUrl = json["profliePicUrl"];
    this.experience = json["experience"];
    this.languages = json["languages"]==null ? null : (json["languages"] as List).map((e)=>Languages.fromJson(e)).toList();
    this.minimumCallDuration = json["minimumCallDuration"];
    this.minimumCallDurationCharges = json["minimumCallDurationCharges"];
    this.additionalPerMinuteCharges = json["additionalPerMinuteCharges"];
    this.isAvailable = json["isAvailable"];
    this.rating = json["rating"];
    this.skills = json["skills"]==null ? null : (json["skills"] as List).map((e)=>Skills.fromJson(e)).toList();
    this.isOnCall = json["isOnCall"];
    this.freeMinutes = json["freeMinutes"];
    this.additionalMinute = json["additionalMinute"];
    this.images = json["images"] == null ? null : Images.fromJson(json["images"]);
    this.availability = json["availability"] == null ? null : Availability.fromJson(json["availability"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["urlSlug"] = this.urlSlug;
    data["namePrefix"] = this.namePrefix;
    data["firstName"] = this.firstName;
    data["lastName"] = this.lastName;
    data["aboutMe"] = this.aboutMe;
    data["profliePicUrl"] = this.profliePicUrl;
    data["experience"] = this.experience;
    if(this.languages != null)
      data["languages"] = this.languages.map((e)=>e.toJson()).toList();
    data["minimumCallDuration"] = this.minimumCallDuration;
    data["minimumCallDurationCharges"] = this.minimumCallDurationCharges;
    data["additionalPerMinuteCharges"] = this.additionalPerMinuteCharges;
    data["isAvailable"] = this.isAvailable;
    data["rating"] = this.rating;
    if(this.skills != null)
      data["skills"] = this.skills.map((e)=>e.toJson()).toList();
    data["isOnCall"] = this.isOnCall;
    data["freeMinutes"] = this.freeMinutes;
    data["additionalMinute"] = this.additionalMinute;
    if(this.images != null)
      data["images"] = this.images.toJson();
    if(this.availability != null)
      data["availability"] = this.availability.toJson();
    return data;
  }
}

class Availability {
  List<String> days;
  Slot slot;

  Availability({this.days, this.slot});

  Availability.fromJson(Map<String, dynamic> json) {
    this.days = json["days"]==null ? null : List<String>.from(json["days"]);
    this.slot = json["slot"] == null ? null : Slot.fromJson(json["slot"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.days != null)
      data["days"] = this.days;
    if(this.slot != null)
      data["slot"] = this.slot.toJson();
    return data;
  }
}

class Slot {
  String toFormat;
  String fromFormat;
  String from;
  String to;

  Slot({this.toFormat, this.fromFormat, this.from, this.to});

  Slot.fromJson(Map<String, dynamic> json) {
    this.toFormat = json["toFormat"];
    this.fromFormat = json["fromFormat"];
    this.from = json["from"];
    this.to = json["to"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["toFormat"] = this.toFormat;
    data["fromFormat"] = this.fromFormat;
    data["from"] = this.from;
    data["to"] = this.to;
    return data;
  }
}

class Images {
  Small small;
  Large large;
  Medium medium;

  Images({this.small, this.large, this.medium});

  Images.fromJson(Map<String, dynamic> json) {
    this.small = json["small"] == null ? null : Small.fromJson(json["small"]);
    this.large = json["large"] == null ? null : Large.fromJson(json["large"]);
    this.medium = json["medium"] == null ? null : Medium.fromJson(json["medium"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.small != null)
      data["small"] = this.small.toJson();
    if(this.large != null)
      data["large"] = this.large.toJson();
    if(this.medium != null)
      data["medium"] = this.medium.toJson();
    return data;
  }
}

class Medium {
  String imageUrl;
  int id;

  Medium({this.imageUrl, this.id});

  Medium.fromJson(Map<String, dynamic> json) {
    this.imageUrl = json["imageUrl"];
    this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["imageUrl"] = this.imageUrl;
    data["id"] = this.id;
    return data;
  }
}

class Large {
  String imageUrl;
  int id;

  Large({this.imageUrl, this.id});

  Large.fromJson(Map<String, dynamic> json) {
    this.imageUrl = json["imageUrl"];
    this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["imageUrl"] = this.imageUrl;
    data["id"] = this.id;
    return data;
  }
}

class Small {
  dynamic imageUrl;
  dynamic id;

  Small({this.imageUrl, this.id});

  Small.fromJson(Map<String, dynamic> json) {
    this.imageUrl = json["imageUrl"];
    this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["imageUrl"] = this.imageUrl;
    data["id"] = this.id;
    return data;
  }
}

class Skills {
  int id;
  String name;
  String description;

  Skills({this.id, this.name, this.description});

  Skills.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.description = json["description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["description"] = this.description;
    return data;
  }
}

class Languages {
  int id;
  String name;

  Languages({this.id, this.name});

  Languages.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    return data;
  }
}