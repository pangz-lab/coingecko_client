enum CategoriesCoinDataOrdering {
  marketCapDesc('market_cap_desc'),
  marketCapAsc('market_cap_asc'),
  nameDesc('name_desc'),
  nameAsc('name_asc'),
  marketCapChange24hDesc('market_cap_change_24h_desc'),
  marketCapChange24hAsc('market_cap_change_24h_asc');
  const CategoriesCoinDataOrdering(this.value);
  final String value;
}