class AssetPlatform {
  String? id;
  int? chainIdentifier;
  String? name;
  String? shortName;

  AssetPlatform({this.id, this.chainIdentifier, this.name, this.shortName});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['chain_identifier'] = chainIdentifier;
    data['name'] = name;
    data['shortname'] = shortName;
    return data;
  }
  
  AssetPlatform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chainIdentifier = json['chain_identifier'];
    name = json['name'];
    shortName = json['shortname'];
  }
}
