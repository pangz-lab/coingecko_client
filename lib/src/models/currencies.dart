/// Base class for the currency classes.<br>
/// `Currencies` and `CryptoCurrencies` can be used for
/// explicit values while `CustomCurrency` is used to
/// specify non standard values.
abstract class BaseCurrency {
  String getCode();
}

/// Collection of known world currencies.
enum Currencies implements BaseCurrency {
  /// World currency code - afn
  afn('afn'),

  /// World currency code - eur
  eur('eur'),

  /// World currency code - all
  all('all'),

  /// World currency code - dzd
  dzd('dzd'),

  /// World currency code - usd
  usd('usd'),

  /// World currency code -
  aoa('aoa'),

  /// World currency code - xcd
  xcd('xcd'),

  /// World currency code - ars
  ars('ars'),

  /// World currency code -
  amd('amd'),

  /// World currency code - ars
  awg('awg'),

  /// World currency code - aud
  aud('aud'),

  /// World currency code - azn
  azn('azn'),

  /// World currency code - bsd
  bsd('bsd'),

  /// World currency code - bhd
  bhd('bhd'),

  /// World currency code -
  bdt('bdt'),

  /// World currency code - bbd
  bbd('bbd'),

  /// World currency code - byn
  byn('byn'),

  /// World currency code -
  bzd('bzd'),

  /// World currency code - xof
  xof('xof'),

  /// World currency code - bmd
  bmd('bmd'),

  /// World currency code - inr
  inr('inr'),

  /// World currency code - inr
  btn('btn'),

  /// World currency code - inr
  bob('bob'),

  /// World currency code - bov
  bov('bov'),

  /// World currency code - bam
  bam('bam'),

  /// World currency code - bwp
  bwp('bwp'),

  /// World currency code - nok
  nok('nok'),

  /// World currency code - brl
  brl('brl'),

  /// World currency code - bnd
  bnd('bnd'),

  /// World currency code - bgn
  bgn('bgn'),

  /// World currency code - bif
  bif('bif'),

  /// World currency code - cve
  cve('cve'),

  /// World currency code - khr
  khr('khr'),

  /// World currency code - xaf
  xaf('xaf'),

  /// World currency code - cad
  cad('cad'),

  /// World currency code - kyd
  kyd('kyd'),

  /// World currency code - clp
  clp('clp'),

  /// World currency code - clf
  clf('clf'),

  /// World currency code - cny
  cny('cny'),

  /// World currency code -
  cop('cop'),

  /// World currency code - cou
  cou('cou'),

  /// World currency code - kmf
  kmf('kmf'),

  /// World currency code - cdf
  cdf('cdf'),

  /// World currency code - nzd
  nzd('nzd'),

  /// World currency code - crc
  crc('crc'),

  /// World currency code - cup
  cup('cup'),

  /// World currency code - cuc
  cuc('cuc'),

  /// World currency code - ang
  ang('ang'),

  /// World currency code - czk
  czk('czk'),

  /// World currency code - dkk
  dkk('dkk'),

  /// World currency code - djf
  djf('djf'),

  /// World currency code - dop
  dop('dop'),

  /// World currency code - egp
  egp('egp'),

  /// World currency code - svc
  svc('svc'),

  /// World currency code - ern
  ern('ern'),

  /// World currency code - szl
  szl('szl'),

  /// World currency code - etb
  etb('etb'),

  /// World currency code - fkp
  fkp('fkp'),

  /// World currency code - fjd
  fjd('fjd'),

  /// World currency code - xpf
  xpf('xpf'),

  /// World currency code - gmd
  gmd('gmd'),

  /// World currency code - gel
  gel('gel'),

  /// World currency code - ghs
  ghs('ghs'),

  /// World currency code - gip
  gip('gip'),

  /// World currency code - gtq
  gtq('gtq'),

  /// World currency code - gbp
  gbp('gbp'),

  /// World currency code - gnf
  gnf('gnf'),

  /// World currency code - gyd
  gyd('gyd'),

  /// World currency code - htg
  htg('htg'),

  /// World currency code - hnl
  hnl('hnl'),

  /// World currency code - hkd
  hkd('hkd'),

  /// World currency code - huf
  huf('huf'),

  /// World currency code - isk
  isk('isk'),

  /// World currency code - idr
  idr('idr'),

  /// World currency code - xdr
  xdr('xdr'),

  /// World currency code - irr
  irr('irr'),

  /// World currency code - iqd
  iqd('iqd'),

  /// World currency code - ils
  ils('ils'),

  /// World currency code - jmd
  jmd('jmd'),

  /// World currency code - jpy
  jpy('jpy'),

  /// World currency code - jod
  jod('jod'),

  /// World currency code - kzt
  kzt('kzt'),

  /// World currency code - kes
  kes('kes'),

  /// World currency code - kpw
  kpw('kpw'),

  /// World currency code - krw
  krw('krw'),

  /// World currency code - kwd
  kwd('kwd'),

  /// World currency code - kgs
  kgs('kgs'),

  /// World currency code - lak
  lak('lak'),

  /// World currency code - lbp
  lbp('lbp'),

  /// World currency code - lsl
  lsl('lsl'),

  /// World currency code - zar
  zar('zar'),

  /// World currency code - lrd
  lrd('lrd'),

  /// World currency code - lyd
  lyd('lyd'),

  /// World currency code - chf
  chf('chf'),

  /// World currency code - mop
  mop('mop'),

  /// World currency code - mkd
  mkd('mkd'),

  /// World currency code - mga
  mga('mga'),

  /// World currency code - mwk
  mwk('mwk'),

  /// World currency code - myr
  myr('myr'),

  /// World currency code - mvr
  mvr('mvr'),

  /// World currency code - mru
  mru('mru'),

  /// World currency code - mur
  mur('mur'),

  /// World currency code - xua
  xua('xua'),

  /// World currency code - mxn
  mxn('mxn'),

  /// World currency code - mxv
  mxv('mxv'),

  /// World currency code - mdl
  mdl('mdl'),

  /// World currency code - mnt
  mnt('mnt'),

  /// World currency code - mad
  mad('mad'),

  /// World currency code - mzn
  mzn('mzn'),

  /// World currency code - mmk
  mmk('mmk'),

  /// World currency code - nad
  nad('nad'),

  /// World currency code - npr
  npr('npr'),

  /// World currency code - nio
  nio('nio'),

  /// World currency code - ngn
  ngn('ngn'),

  /// World currency code - omr
  omr('omr'),

  /// World currency code - pkr
  pkr('pkr'),

  /// World currency code - pab
  pab('pab'),

  /// World currency code - pgk
  pgk('pgk'),

  /// World currency code - pyg
  pyg('pyg'),

  /// World currency code - pen
  pen('pen'),

  /// World currency code - php
  php('php'),

  /// World currency code - pln
  pln('pln'),

  /// World currency code - qar
  qar('qar'),

  /// World currency code - ron
  ron('ron'),

  /// World currency code - rub
  rub('rub'),

  /// World currency code - rwf
  rwf('rwf'),

  /// World currency code - shp
  shp('shp'),

  /// World currency code - wst
  wst('wst'),

  /// World currency code - stn
  stn('stn'),

  /// World currency code - sar
  sar('sar'),

  /// World currency code - rsd
  rsd('rsd'),

  /// World currency code - scr
  scr('scr'),

  /// World currency code - sll
  sll('sll'),

  /// World currency code - sle
  sle('sle'),

  /// World currency code - sgd
  sgd('sgd'),

  /// World currency code - xsu
  xsu('xsu'),

  /// World currency code - sbd
  sbd('sbd'),

  /// World currency code - sos
  sos('sos'),

  /// World currency code - ssp
  ssp('ssp'),

  /// World currency code - lkr
  lkr('lkr'),

  /// World currency code - sdg
  sdg('sdg'),

  /// World currency code - srd
  srd('srd'),

  /// World currency code - sek
  sek('sek'),

  /// World currency code - che
  che('che'),

  /// World currency code - chw
  chw('chw'),

  /// World currency code - syp
  syp('syp'),

  /// World currency code - twd
  twd('twd'),

  /// World currency code - tjs
  tjs('tjs'),

  /// World currency code - tzs
  tzs('tzs'),

  /// World currency code - thb
  thb('thb'),

  /// World currency code - top
  top('top'),

  /// World currency code - ttd
  ttd('ttd'),

  /// World currency code - tnd
  tnd('tnd'),

  /// World currency code - tmt
  tmt('tmt'),

  /// World currency code - ugx
  ugx('ugx'),

  /// World currency code - uah
  uah('uah'),

  /// World currency code - aed
  aed('aed'),

  /// World currency code - usn
  usn('usn'),

  /// World currency code - uyu
  uyu('uyu'),

  /// World currency code - uyi
  uyi('uyi'),

  /// World currency code - uyw
  uyw('uyw'),

  /// World currency code - uzs
  uzs('uzs'),

  /// World currency code - vuv
  vuv('vuv'),

  /// World currency code - ves
  ves('ves'),

  /// World currency code - ved
  ved('ved'),

  /// World currency code - vnd
  vnd('vnd'),

  /// World currency code - yer
  yer('yer'),

  /// World currency code - zmw
  zmw('zmw'),

  /// World currency code - zwl
  zwl('zwl'),

  /// World currency code - xba
  xba('xba'),

  /// World currency code - xbb
  xbb('xbb'),

  /// World currency code - xbc
  xbc('xbc'),

  /// World currency code - xbd
  xbd('xbd'),

  /// World currency code - xts
  xts('xts'),

  /// World currency code - xxx
  xxx('xxx'),

  /// World currency code - xau
  xau('xau'),

  /// World currency code - xpd
  xpd('xpd'),

  /// World currency code - xpt
  xpt('xpt'),

  /// World currency code - xag
  xag('xag');

  const Currencies(this.code);
  final String code;

  @override
  String getCode() {
    return code;
  }
}

/// Collection of known cryptocurrencies.
enum CryptoCurrencies implements BaseCurrency {
  /// Crypto code - btc
  btc('btc'),

  /// Crypto code - eth
  eth('eth'),

  /// Crypto code -
  ltc('ltc'),

  /// Crypto code - bch
  bch('bch'),

  /// Crypto code - bnb
  bnb('bnb'),

  /// Crypto code - eos
  eos('eos'),

  /// Crypto code - xrp
  xrp('xrp'),

  /// Crypto code - xlm
  xlm('xlm'),

  /// Crypto code - link
  link('link'),

  /// Crypto code - dot
  dot('dot'),

  /// Crypto code - dot
  yfi('yfi'),

  /// Crypto code - usd
  usd('usd'),

  /// Crypto code - aed
  aed('aed'),

  /// Crypto code -
  ars('ars'),

  /// Crypto code - aud
  aud('aud'),

  /// Crypto code - bdt
  bdt('bdt'),

  /// Crypto code - bhd
  bhd('bhd'),

  /// Crypto code - bmd
  bmd('bmd'),

  /// Crypto code - brl
  brl('brl'),

  /// Crypto code - cad
  cad('cad'),

  /// Crypto code - chf
  chf('chf'),

  /// Crypto code - clp
  clp('clp'),

  /// Crypto code - cny
  cny('cny'),

  /// Crypto code - czk
  czk('czk'),

  /// Crypto code - dkk
  dkk('dkk'),

  /// Crypto code - eur
  eur('eur'),

  /// Crypto code - gbp
  gbp('gbp'),

  /// Crypto code - hkd
  hkd('hkd'),

  /// Crypto code - huf
  huf('huf'),

  /// Crypto code - idr
  idr('idr'),

  /// Crypto code - ils
  ils('ils'),

  /// Crypto code - inr
  inr('inr'),

  /// Crypto code - jpy
  jpy('jpy'),

  /// Crypto code - krw
  krw('krw'),

  /// Crypto code - kwd
  kwd('kwd'),

  /// Crypto code - lkr
  lkr('lkr'),

  /// Crypto code - mmk
  mmk('mmk'),

  /// Crypto code - mxn
  mxn('mxn'),

  /// Crypto code - myr
  myr('myr'),

  /// Crypto code - ngn
  ngn('ngn'),

  /// Crypto code - nok
  nok('nok'),

  /// Crypto code - nzd
  nzd('nzd'),

  /// Crypto code - php
  php('php'),

  /// Crypto code - php
  pkr('pkr'),

  /// Crypto code - pln
  pln('pln'),

  /// Crypto code - rub
  rub('rub'),

  /// Crypto code - sar
  sar('sar'),

  /// Crypto code - sek
  sek('sek'),

  /// Crypto code - sgd
  sgd('sgd'),

  /// Crypto code - thb
  thb('thb'),

  /// Crypto code - twd
  twd('twd'),

  /// Crypto code - uah
  uah('uah'),

  /// Crypto code - vef
  vef('vef'),

  /// Crypto code - vnd
  vnd('vnd'),

  /// Crypto code - vrsc
  vrsc('vrsc'),

  /// Crypto code - zar
  zar('zar'),

  /// Crypto code - xdr
  xdr('xdr'),

  /// Crypto code - xag
  xag('xag'),

  /// Crypto code - xau
  xau('xau'),

  /// Crypto code - bits
  bits('bits'),

  /// Crypto code - sats
  sats('sats');

  const CryptoCurrencies(this.code);
  final String code;

  @override
  String getCode() {
    return code;
  }
}

/// You might need to use currencies that does not exist<br>
/// in either `Currencies` or `CryptoCurrencies` enum/class. You can use this do define
/// custom currencies.
class CustomCurrency implements BaseCurrency {
  String? _code;

  CustomCurrency.from(String code) {
    _code = code;
  }

  @override
  String getCode() {
    return _code ?? '';
  }
}
