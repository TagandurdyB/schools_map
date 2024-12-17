part of 'theme_cubit.dart';

class ThemeState {
  final bool isSystem;
  final bool isLight;
  final Map<int, Map> dictionary;
  // final AddressEntity? address;
  ThemeState({
    this.isSystem = false,
    this.isLight = true,
    this.dictionary = const {},
    // this.address,
  });

  ThemeState copyWith({
    bool? isSystem,
    bool? isLight,
    Map<int, Map>? dictionary,

    // AppLocalizations? dictionary,
    // AddressEntity? address,
  }) {
    return ThemeState(
      isSystem: isSystem ?? this.isSystem,
      isLight: isLight ?? this.isLight,
      dictionary: dictionary ?? this.dictionary,
      // address: address ?? this.address,
    );
  }
}
