import 'package:coingecko_client/src/domain/companies/models/company_info.dart';
import 'package:coingecko_client/src/models/base_model.dart';

class CompanyList extends BaseModel {
  double? _totalHoldings;
  double? _totalValueUsd;
  double? _marketCapDominance;
  List<CompanyInfo>? _companies;

  CompanyList(
      {double? totalHoldings,
      double? totalValueUsd,
      double? marketCapDominance,
      List<CompanyInfo>? companies}) {
    _totalHoldings = totalHoldings;
    _totalValueUsd = totalValueUsd;
    _marketCapDominance = marketCapDominance;
    _companies = companies;
  }

  double? get totalHoldings => _totalHoldings;
  double? get totalValueUsd => _totalValueUsd;
  double? get marketCapDominance => _marketCapDominance;
  List<CompanyInfo>? get companies => _companies;

  CompanyList.fromJson(Map<String, dynamic> json) {
    _totalHoldings = toDouble(json['total_holdings']);
    _totalValueUsd = toDouble(json['total_value_usd']);
    _marketCapDominance = toDouble(json['market_cap_dominance']);
    _companies = json['companies'] != null
        ? List<dynamic>.of(json['companies'])
            .map((e) => CompanyInfo.fromJson(e))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total_holdings'] = _totalHoldings;
    data['total_value_usd'] = _totalValueUsd;
    data['market_cap_dominance'] = _marketCapDominance;
    data['companies'] = _companies;
    return data;
  }
}
