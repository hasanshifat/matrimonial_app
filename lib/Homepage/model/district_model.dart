class DistrictModel {
    DistrictModel({
        this.id,
        this.district,
        this.upazila,
        this.division,
    });

    String? id;
    String? district;
    String? upazila;
    String? division;

    factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        id: json["ID"],
        district: json["DISTRICT"],
        upazila: json["UPAZILA"],
        division: json["DIVISION"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "DISTRICT": district,
        "UPAZILA": upazila,
        "DIVISION": division,
    };
}
