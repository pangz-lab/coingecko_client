/// Use to define sorting order of coin categories result.
enum CoinCategoriesDataOrdering {
  /// Sort by market capital in descending order
  marketCapDesc('market_cap_desc'),

  /// Sort by market capital in ascending order
  marketCapAsc('market_cap_asc'),

  /// Sort by name in descending order
  nameDesc('name_desc'),

  /// Sort by name in ascending order
  nameAsc('name_asc'),

  /// Sort by market capital change in a 24-hour period in descending order
  marketCapChange24hDesc('market_cap_change_24h_desc'),

  /// Sort by market capital change in a 24-hour period in ascending order
  marketCapChange24hAsc('market_cap_change_24h_asc');

  const CoinCategoriesDataOrdering(this.value);
  final String value;
}
