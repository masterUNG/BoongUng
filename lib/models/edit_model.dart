class EditModel {
  int id;
  int state;
  String name;
  String code;
  String rspocode;
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
  String datein;

  EditModel(
      this.id,
      this.state,
      this.name,
      this.code,
      this.rspocode,
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
      this.datein);

  EditModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    name = json['name'];
    code = json['code'];
    rspocode = json['rspocode'];
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
    datein = json['datein'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['name'] = this.name;
    data['code'] = this.code;
    data['rspocode'] = this.rspocode;
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
    data['datein'] = this.datein;
    return data;
  }
}

