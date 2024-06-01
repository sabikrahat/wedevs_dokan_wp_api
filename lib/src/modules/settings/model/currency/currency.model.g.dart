// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.model.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetCurrencyProfileCollection on Isar {
  IsarCollection<int, CurrencyProfile> get currencyProfiles =>
      this.collection();
}

const CurrencyProfileSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'CurrencyProfile',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'shortForm',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'symbol',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'name',
        type: IsarType.string,
      ),
    ],
    indexes: [
      IsarIndexSchema(
        name: 'shortForm',
        properties: [
          "shortForm",
        ],
        unique: true,
        hash: false,
      ),
    ],
  ),
  converter: IsarObjectConverter<int, CurrencyProfile>(
    serialize: serializeCurrencyProfile,
    deserialize: deserializeCurrencyProfile,
    deserializeProperty: deserializeCurrencyProfileProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeCurrencyProfile(IsarWriter writer, CurrencyProfile object) {
  IsarCore.writeString(writer, 1, object.shortForm);
  IsarCore.writeString(writer, 2, object.symbol);
  IsarCore.writeString(writer, 3, object.name);
  return object.id;
}

@isarProtected
CurrencyProfile deserializeCurrencyProfile(IsarReader reader) {
  final object = CurrencyProfile();
  object.id = IsarCore.readId(reader);
  object.shortForm = IsarCore.readString(reader, 1) ?? '';
  object.symbol = IsarCore.readString(reader, 2) ?? '';
  object.name = IsarCore.readString(reader, 3) ?? '';
  return object;
}

@isarProtected
dynamic deserializeCurrencyProfileProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      return IsarCore.readString(reader, 3) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _CurrencyProfileUpdate {
  bool call({
    required int id,
    String? shortForm,
    String? symbol,
    String? name,
  });
}

class _CurrencyProfileUpdateImpl implements _CurrencyProfileUpdate {
  const _CurrencyProfileUpdateImpl(this.collection);

  final IsarCollection<int, CurrencyProfile> collection;

  @override
  bool call({
    required int id,
    Object? shortForm = ignore,
    Object? symbol = ignore,
    Object? name = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (shortForm != ignore) 1: shortForm as String?,
          if (symbol != ignore) 2: symbol as String?,
          if (name != ignore) 3: name as String?,
        }) >
        0;
  }
}

sealed class _CurrencyProfileUpdateAll {
  int call({
    required List<int> id,
    String? shortForm,
    String? symbol,
    String? name,
  });
}

class _CurrencyProfileUpdateAllImpl implements _CurrencyProfileUpdateAll {
  const _CurrencyProfileUpdateAllImpl(this.collection);

  final IsarCollection<int, CurrencyProfile> collection;

  @override
  int call({
    required List<int> id,
    Object? shortForm = ignore,
    Object? symbol = ignore,
    Object? name = ignore,
  }) {
    return collection.updateProperties(id, {
      if (shortForm != ignore) 1: shortForm as String?,
      if (symbol != ignore) 2: symbol as String?,
      if (name != ignore) 3: name as String?,
    });
  }
}

extension CurrencyProfileUpdate on IsarCollection<int, CurrencyProfile> {
  _CurrencyProfileUpdate get update => _CurrencyProfileUpdateImpl(this);

  _CurrencyProfileUpdateAll get updateAll =>
      _CurrencyProfileUpdateAllImpl(this);
}

sealed class _CurrencyProfileQueryUpdate {
  int call({
    String? shortForm,
    String? symbol,
    String? name,
  });
}

class _CurrencyProfileQueryUpdateImpl implements _CurrencyProfileQueryUpdate {
  const _CurrencyProfileQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<CurrencyProfile> query;
  final int? limit;

  @override
  int call({
    Object? shortForm = ignore,
    Object? symbol = ignore,
    Object? name = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (shortForm != ignore) 1: shortForm as String?,
      if (symbol != ignore) 2: symbol as String?,
      if (name != ignore) 3: name as String?,
    });
  }
}

extension CurrencyProfileQueryUpdate on IsarQuery<CurrencyProfile> {
  _CurrencyProfileQueryUpdate get updateFirst =>
      _CurrencyProfileQueryUpdateImpl(this, limit: 1);

  _CurrencyProfileQueryUpdate get updateAll =>
      _CurrencyProfileQueryUpdateImpl(this);
}

class _CurrencyProfileQueryBuilderUpdateImpl
    implements _CurrencyProfileQueryUpdate {
  const _CurrencyProfileQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<CurrencyProfile, CurrencyProfile, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? shortForm = ignore,
    Object? symbol = ignore,
    Object? name = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (shortForm != ignore) 1: shortForm as String?,
        if (symbol != ignore) 2: symbol as String?,
        if (name != ignore) 3: name as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension CurrencyProfileQueryBuilderUpdate
    on QueryBuilder<CurrencyProfile, CurrencyProfile, QOperations> {
  _CurrencyProfileQueryUpdate get updateFirst =>
      _CurrencyProfileQueryBuilderUpdateImpl(this, limit: 1);

  _CurrencyProfileQueryUpdate get updateAll =>
      _CurrencyProfileQueryBuilderUpdateImpl(this);
}

extension CurrencyProfileQueryFilter
    on QueryBuilder<CurrencyProfile, CurrencyProfile, QFilterCondition> {
  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      shortFormEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      shortFormGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      shortFormGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      shortFormLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      shortFormLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      shortFormBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      shortFormStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      shortFormEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      shortFormContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      shortFormMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      shortFormIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      shortFormIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      symbolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      symbolGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      symbolGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      symbolLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      symbolLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      symbolBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      nameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      nameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }
}

extension CurrencyProfileQueryObject
    on QueryBuilder<CurrencyProfile, CurrencyProfile, QFilterCondition> {}

extension CurrencyProfileQuerySortBy
    on QueryBuilder<CurrencyProfile, CurrencyProfile, QSortBy> {
  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> sortByShortForm(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy>
      sortByShortFormDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> sortBySymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> sortBySymbolDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension CurrencyProfileQuerySortThenBy
    on QueryBuilder<CurrencyProfile, CurrencyProfile, QSortThenBy> {
  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> thenByShortForm(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy>
      thenByShortFormDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> thenBySymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> thenBySymbolDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension CurrencyProfileQueryWhereDistinct
    on QueryBuilder<CurrencyProfile, CurrencyProfile, QDistinct> {
  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterDistinct>
      distinctByShortForm({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterDistinct>
      distinctBySymbol({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrencyProfile, CurrencyProfile, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }
}

extension CurrencyProfileQueryProperty1
    on QueryBuilder<CurrencyProfile, CurrencyProfile, QProperty> {
  QueryBuilder<CurrencyProfile, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CurrencyProfile, String, QAfterProperty> shortFormProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CurrencyProfile, String, QAfterProperty> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CurrencyProfile, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension CurrencyProfileQueryProperty2<R>
    on QueryBuilder<CurrencyProfile, R, QAfterProperty> {
  QueryBuilder<CurrencyProfile, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CurrencyProfile, (R, String), QAfterProperty>
      shortFormProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CurrencyProfile, (R, String), QAfterProperty> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CurrencyProfile, (R, String), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension CurrencyProfileQueryProperty3<R1, R2>
    on QueryBuilder<CurrencyProfile, (R1, R2), QAfterProperty> {
  QueryBuilder<CurrencyProfile, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CurrencyProfile, (R1, R2, String), QOperations>
      shortFormProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CurrencyProfile, (R1, R2, String), QOperations>
      symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CurrencyProfile, (R1, R2, String), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}
