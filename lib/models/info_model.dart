class InfoModel {
  String id;
  String owner;
  String name;
  String address;
  String type;
  String yearin;
  String area;
  String num;
  String dead;
  String growback;
  String yeargrow;
  String solutiongrow;
  String reasondead;
  String detailarea;
  String benefitother;
  String conserve;
  String coordinate;
  String statesoil;
  String typearea;
  String typearearemark;
  String typesoil;
  String typesoilother;
  String plantingarea;
  String plantingareaother;
  String soilconservation;
  String soilconservationother;
  String wateringmethod;
  String sourcewater;
  String usebefore;
  String pattern;
  String phase;
  String harvesting;
  String harvestingother;
  String originsoil;
  String originsoilother;
  String kindsoil;
  String kindsoilcompany;
  String choosesoil;
  String oldsoil;
  String code;
  String rspocode;
  String datein;

  InfoModel(
      {this.id,
      this.owner,
      this.name,
      this.address,
      this.type,
      this.yearin,
      this.area,
      this.num,
      this.dead,
      this.growback,
      this.yeargrow,
      this.solutiongrow,
      this.reasondead,
      this.detailarea,
      this.benefitother,
      this.conserve,
      this.coordinate,
      this.statesoil,
      this.typearea,
      this.typearearemark,
      this.typesoil,
      this.typesoilother,
      this.plantingarea,
      this.plantingareaother,
      this.soilconservation,
      this.soilconservationother,
      this.wateringmethod,
      this.sourcewater,
      this.usebefore,
      this.pattern,
      this.phase,
      this.harvesting,
      this.harvestingother,
      this.originsoil,
      this.originsoilother,
      this.kindsoil,
      this.kindsoilcompany,
      this.choosesoil,
      this.oldsoil,
      this.code,
      this.rspocode,
      this.datein});

  InfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    name = json['name'];
    address = json['address'];
    type = json['type'];
    yearin = json['yearin'];
    area = json['area'];
    num = json['num'];
    dead = json['dead'];
    growback = json['growback'];
    yeargrow = json['yeargrow'];
    solutiongrow = json['solutiongrow'];
    reasondead = json['reasondead'];
    detailarea = json['detailarea'];
    benefitother = json['benefitother'];
    conserve = json['conserve'];
    coordinate = json['coordinate'];
    statesoil = json['statesoil'];
    typearea = json['typearea'];
    typearearemark = json['typearearemark'];
    typesoil = json['typesoil'];
    typesoilother = json['typesoilother'];
    plantingarea = json['plantingarea'];
    plantingareaother = json['plantingareaother'];
    soilconservation = json['soilconservation'];
    soilconservationother = json['soilconservationother'];
    wateringmethod = json['wateringmethod'];
    sourcewater = json['sourcewater'];
    usebefore = json['usebefore'];
    pattern = json['pattern'];
    phase = json['phase'];
    harvesting = json['harvesting'];
    harvestingother = json['harvestingother'];
    originsoil = json['originsoil'];
    originsoilother = json['originsoilother'];
    kindsoil = json['kindsoil'];
    kindsoilcompany = json['kindsoilcompany'];
    choosesoil = json['choosesoil'];
    oldsoil = json['oldsoil'];
    code = json['code'];
    rspocode = json['rspocode'];
    datein = json['datein'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner'] = this.owner;
    data['name'] = this.name;
    data['address'] = this.address;
    data['type'] = this.type;
    data['yearin'] = this.yearin;
    data['area'] = this.area;
    data['num'] = this.num;
    data['dead'] = this.dead;
    data['growback'] = this.growback;
    data['yeargrow'] = this.yeargrow;
    data['solutiongrow'] = this.solutiongrow;
    data['reasondead'] = this.reasondead;
    data['detailarea'] = this.detailarea;
    data['benefitother'] = this.benefitother;
    data['conserve'] = this.conserve;
    data['coordinate'] = this.coordinate;
    data['statesoil'] = this.statesoil;
    data['typearea'] = this.typearea;
    data['typearearemark'] = this.typearearemark;
    data['typesoil'] = this.typesoil;
    data['typesoilother'] = this.typesoilother;
    data['plantingarea'] = this.plantingarea;
    data['plantingareaother'] = this.plantingareaother;
    data['soilconservation'] = this.soilconservation;
    data['soilconservationother'] = this.soilconservationother;
    data['wateringmethod'] = this.wateringmethod;
    data['sourcewater'] = this.sourcewater;
    data['usebefore'] = this.usebefore;
    data['pattern'] = this.pattern;
    data['phase'] = this.phase;
    data['harvesting'] = this.harvesting;
    data['harvestingother'] = this.harvestingother;
    data['originsoil'] = this.originsoil;
    data['originsoilother'] = this.originsoilother;
    data['kindsoil'] = this.kindsoil;
    data['kindsoilcompany'] = this.kindsoilcompany;
    data['choosesoil'] = this.choosesoil;
    data['oldsoil'] = this.oldsoil;
    data['code'] = this.code;
    data['rspocode'] = this.rspocode;
    data['datein'] = this.datein;
    return data;
  }
}

