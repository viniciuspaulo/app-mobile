class MedicineModel {
  String id;
  String posology;
  dynamic treatmentStartDate;
  dynamic treatmentEndDate;
  String addedDate;
  dynamic treatmentDuration;
  bool continuous;
  String prescriptive;
  String laboratory;
  String medicines;
  String activePrinciple;

  MedicineModel({
    this.id,
    this.posology,
    this.treatmentStartDate,
    this.treatmentEndDate,
    this.addedDate,
    this.treatmentDuration,
    this.continuous,
    this.prescriptive,
    this.laboratory,
    this.medicines,
    this.activePrinciple,
  });

  MedicineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    posology = json['posology'];
    treatmentStartDate = json['treatment_start_date'];
    treatmentEndDate = json['treatment_end_date'];
    addedDate = json['added_date'];
    treatmentDuration = json['treatment_duration'];
    continuous = json['continuous'];
    prescriptive = json['prescriptive'];
    laboratory = json['laboratory'];
    medicines = json['medicines'];
    activePrinciple = json['active_principle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['posology'] = this.posology;
    data['treatment_start_date'] = this.treatmentStartDate;
    data['treatment_end_date'] = this.treatmentEndDate;
    data['added_date'] = this.addedDate;
    data['treatment_duration'] = this.treatmentDuration;
    data['continuous'] = this.continuous;
    data['prescriptive'] = this.prescriptive;
    data['laboratory'] = this.laboratory;
    data['medicines'] = this.medicines;
    data['active_principle'] = this.activePrinciple;
    return data;
  }

  static List<MedicineModel> encondeToJson(List<dynamic> itens) {
    List<MedicineModel> list = [];
    for (int i = 0; i < itens.length; i++) {
      list.add(MedicineModel.fromJson(itens[i]));
    }
    return list;
  }
}
