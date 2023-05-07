import 'package:coingecko_client/src/models/base_model.dart';

class CompanyInfo extends BaseModel {
  String? _name;
  String? _symbol;
  String? _country;
  int? _totalHoldings;
  int? _totalEntryValueUsd;
  int? _totalCurrentValueUsd;
  double? _percentageOfTotalSupply;

  CompanyInfo(
      {String? name,
      String? symbol,
      String? country,
      int? totalHoldings,
      int? totalEntryValueUsd,
      int? totalCurrentValueUsd,
      double? percentageOfTotalSupply}) {
    _name = name;
    _symbol = symbol;
    _country = country;
    _totalHoldings = totalHoldings;
    _totalEntryValueUsd = totalEntryValueUsd;
    _totalCurrentValueUsd = totalCurrentValueUsd;
    _percentageOfTotalSupply = percentageOfTotalSupply;
  }

  String? get name => _name;
  String? get symbol => _symbol;
  String? get country => _country;
  int? get totalHoldings => _totalHoldings;
  int? get totalEntryValueUsd => _totalEntryValueUsd;
  int? get totalCurrentValueUsd => _totalCurrentValueUsd;
  double? get percentageOfTotalSupply => _percentageOfTotalSupply;

  CompanyInfo.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _symbol = json['symbol'];
    _country = json['country'];
    _totalHoldings = toInt(json['total_holdings']);
    _totalEntryValueUsd = toInt(json['total_entry_value_usd']);
    _totalCurrentValueUsd = toInt(json['total_current_value_usd']);
    _percentageOfTotalSupply = toDouble(json['percentage_of_total_supply']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = _name;
    data['symbol'] = _symbol;
    data['country'] = _country;
    data['total_holdings'] = _totalHoldings;
    data['total_entry_value_usd'] = _totalEntryValueUsd;
    data['total_current_value_usd'] = _totalCurrentValueUsd;
    data['percentage_of_total_supply'] = _percentageOfTotalSupply;
    return data;
  }
}
