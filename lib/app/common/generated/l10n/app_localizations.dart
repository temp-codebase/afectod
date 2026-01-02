import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In tr, this message translates to:
  /// **'Afectod'**
  String get appTitle;

  /// No description provided for @errorGeneric.
  ///
  /// In tr, this message translates to:
  /// **'Bir hata oluştu'**
  String get errorGeneric;

  /// No description provided for @retryButton.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar Dene'**
  String get retryButton;

  /// No description provided for @cancel.
  ///
  /// In tr, this message translates to:
  /// **'İptal'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In tr, this message translates to:
  /// **'Kapat'**
  String get close;

  /// No description provided for @delete.
  ///
  /// In tr, this message translates to:
  /// **'Sil'**
  String get delete;

  /// No description provided for @create.
  ///
  /// In tr, this message translates to:
  /// **'Oluştur'**
  String get create;

  /// No description provided for @apply.
  ///
  /// In tr, this message translates to:
  /// **'Uygula'**
  String get apply;

  /// No description provided for @remove.
  ///
  /// In tr, this message translates to:
  /// **'Çıkar'**
  String get remove;

  /// No description provided for @movies.
  ///
  /// In tr, this message translates to:
  /// **'film'**
  String get movies;

  /// No description provided for @moviesCount.
  ///
  /// In tr, this message translates to:
  /// **'{count} film'**
  String moviesCount(int count);

  /// No description provided for @resultsCount.
  ///
  /// In tr, this message translates to:
  /// **'{count} sonuç'**
  String resultsCount(int count);

  /// No description provided for @navDiscover.
  ///
  /// In tr, this message translates to:
  /// **'Keşfet'**
  String get navDiscover;

  /// No description provided for @navFavorites.
  ///
  /// In tr, this message translates to:
  /// **'Favoriler'**
  String get navFavorites;

  /// No description provided for @navSettings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get navSettings;

  /// No description provided for @discoverNoMovies.
  ///
  /// In tr, this message translates to:
  /// **'Film bulunamadı'**
  String get discoverNoMovies;

  /// No description provided for @favoritesTitle.
  ///
  /// In tr, this message translates to:
  /// **'Favorilerim'**
  String get favoritesTitle;

  /// No description provided for @favoritesFilter.
  ///
  /// In tr, this message translates to:
  /// **'Filtrele'**
  String get favoritesFilter;

  /// No description provided for @favoritesNewList.
  ///
  /// In tr, this message translates to:
  /// **'Yeni Liste'**
  String get favoritesNewList;

  /// No description provided for @favoritesNoLists.
  ///
  /// In tr, this message translates to:
  /// **'Henüz favori listeniz yok'**
  String get favoritesNoLists;

  /// No description provided for @favoritesNoMoviesInList.
  ///
  /// In tr, this message translates to:
  /// **'Bu listede henüz film yok'**
  String get favoritesNoMoviesInList;

  /// No description provided for @createListTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yeni Liste Oluştur'**
  String get createListTitle;

  /// No description provided for @createListName.
  ///
  /// In tr, this message translates to:
  /// **'Liste Adı'**
  String get createListName;

  /// No description provided for @createListNameRequired.
  ///
  /// In tr, this message translates to:
  /// **'Liste adı giriniz'**
  String get createListNameRequired;

  /// No description provided for @createListDescription.
  ///
  /// In tr, this message translates to:
  /// **'Açıklama (Opsiyonel)'**
  String get createListDescription;

  /// No description provided for @addToListTitle.
  ///
  /// In tr, this message translates to:
  /// **'Listeye Ekle'**
  String get addToListTitle;

  /// No description provided for @addToListNoLists.
  ///
  /// In tr, this message translates to:
  /// **'Henüz liste oluşturmadınız'**
  String get addToListNoLists;

  /// No description provided for @addToListAutomatic.
  ///
  /// In tr, this message translates to:
  /// **'Otomatik liste'**
  String get addToListAutomatic;

  /// No description provided for @selectListTitle.
  ///
  /// In tr, this message translates to:
  /// **'Liste Seç'**
  String get selectListTitle;

  /// No description provided for @deleteListTitle.
  ///
  /// In tr, this message translates to:
  /// **'Listeyi Sil'**
  String get deleteListTitle;

  /// No description provided for @deleteListConfirm.
  ///
  /// In tr, this message translates to:
  /// **'{listName} listesini silmek istediğinize emin misiniz?'**
  String deleteListConfirm(String listName);

  /// No description provided for @removeMovieTitle.
  ///
  /// In tr, this message translates to:
  /// **'Filmı Çıkar'**
  String get removeMovieTitle;

  /// No description provided for @removeMovieConfirm.
  ///
  /// In tr, this message translates to:
  /// **'{movieTitle} filmini listeden çıkarmak istiyor musunuz?'**
  String removeMovieConfirm(String movieTitle);

  /// No description provided for @searchTitle.
  ///
  /// In tr, this message translates to:
  /// **'Film Ara'**
  String get searchTitle;

  /// No description provided for @searchPlaceholder.
  ///
  /// In tr, this message translates to:
  /// **'Film ara...'**
  String get searchPlaceholder;

  /// No description provided for @searchHint.
  ///
  /// In tr, this message translates to:
  /// **'Film aramak için yukarıdaki\narama çubuğunu kullanın'**
  String get searchHint;

  /// No description provided for @searchRecentTitle.
  ///
  /// In tr, this message translates to:
  /// **'Son Aramalar'**
  String get searchRecentTitle;

  /// No description provided for @searchClearAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü Temizle'**
  String get searchClearAll;

  /// No description provided for @searchNoResults.
  ///
  /// In tr, this message translates to:
  /// **'Film bulunamadı.'**
  String get searchNoResults;

  /// No description provided for @filterTitle.
  ///
  /// In tr, this message translates to:
  /// **'Filtrele'**
  String get filterTitle;

  /// No description provided for @filterYear.
  ///
  /// In tr, this message translates to:
  /// **'Yıl'**
  String get filterYear;

  /// No description provided for @filterRating.
  ///
  /// In tr, this message translates to:
  /// **'Puan'**
  String get filterRating;

  /// No description provided for @filterMin.
  ///
  /// In tr, this message translates to:
  /// **'Min'**
  String get filterMin;

  /// No description provided for @filterMax.
  ///
  /// In tr, this message translates to:
  /// **'Max'**
  String get filterMax;

  /// No description provided for @filterYearRange.
  ///
  /// In tr, this message translates to:
  /// **'Yıl: {min} - {max}'**
  String filterYearRange(String min, String max);

  /// No description provided for @filterRatingRange.
  ///
  /// In tr, this message translates to:
  /// **'Puan: {min} - {max}'**
  String filterRatingRange(String min, String max);

  /// No description provided for @sortTitle.
  ///
  /// In tr, this message translates to:
  /// **'Sırala'**
  String get sortTitle;

  /// No description provided for @sortAlphabetical.
  ///
  /// In tr, this message translates to:
  /// **'Alfabetik (A-Z)'**
  String get sortAlphabetical;

  /// No description provided for @sortYear.
  ///
  /// In tr, this message translates to:
  /// **'Yıl'**
  String get sortYear;

  /// No description provided for @sortRating.
  ///
  /// In tr, this message translates to:
  /// **'Puan'**
  String get sortRating;

  /// No description provided for @sortDirection.
  ///
  /// In tr, this message translates to:
  /// **'Sıralama Yönü'**
  String get sortDirection;

  /// No description provided for @sortAZ.
  ///
  /// In tr, this message translates to:
  /// **'A-Z'**
  String get sortAZ;

  /// No description provided for @settingsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get settingsTitle;

  /// No description provided for @settingsAppearance.
  ///
  /// In tr, this message translates to:
  /// **'Görünüm'**
  String get settingsAppearance;

  /// No description provided for @settingsLanguageRegion.
  ///
  /// In tr, this message translates to:
  /// **'Dil ve Bölge'**
  String get settingsLanguageRegion;

  /// No description provided for @settingsAccount.
  ///
  /// In tr, this message translates to:
  /// **'Hesap'**
  String get settingsAccount;

  /// No description provided for @settingsDarkTheme.
  ///
  /// In tr, this message translates to:
  /// **'Koyu Tema'**
  String get settingsDarkTheme;

  /// No description provided for @settingsDarkThemeSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Gözlerinizi koruyun'**
  String get settingsDarkThemeSubtitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In tr, this message translates to:
  /// **'Dil'**
  String get settingsLanguage;

  /// No description provided for @settingsChangePassword.
  ///
  /// In tr, this message translates to:
  /// **'Şifre Değiştir'**
  String get settingsChangePassword;

  /// No description provided for @settingsChangePasswordMessage.
  ///
  /// In tr, this message translates to:
  /// **'Şifre değiştirme sayfası açılıyor...'**
  String get settingsChangePasswordMessage;

  /// No description provided for @settingsLogout.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış Yap'**
  String get settingsLogout;

  /// No description provided for @settingsLogoutConfirm.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış yapmak istediğinizden emin misiniz?'**
  String get settingsLogoutConfirm;

  /// No description provided for @settingsLoggingOut.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış yapılıyor...'**
  String get settingsLoggingOut;

  /// No description provided for @auth_welcome_back.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar Hoşgeldiniz'**
  String get auth_welcome_back;

  /// No description provided for @auth_create_account.
  ///
  /// In tr, this message translates to:
  /// **'Hesap Oluştur'**
  String get auth_create_account;

  /// No description provided for @auth_login_subtitle.
  ///
  /// In tr, this message translates to:
  /// **'Hesabınıza giriş yapın'**
  String get auth_login_subtitle;

  /// No description provided for @auth_register_subtitle.
  ///
  /// In tr, this message translates to:
  /// **'Yeni bir hesap oluşturun'**
  String get auth_register_subtitle;

  /// No description provided for @auth_username.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı Adı'**
  String get auth_username;

  /// No description provided for @auth_username_hint.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı adınızı girin'**
  String get auth_username_hint;

  /// No description provided for @auth_username_required.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı adı gerekli'**
  String get auth_username_required;

  /// No description provided for @auth_username_too_short.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı adı en az 3 karakter olmalı'**
  String get auth_username_too_short;

  /// No description provided for @auth_email.
  ///
  /// In tr, this message translates to:
  /// **'E-posta'**
  String get auth_email;

  /// No description provided for @auth_email_hint.
  ///
  /// In tr, this message translates to:
  /// **'E-posta adresinizi girin'**
  String get auth_email_hint;

  /// No description provided for @auth_email_required.
  ///
  /// In tr, this message translates to:
  /// **'E-posta gerekli'**
  String get auth_email_required;

  /// No description provided for @auth_email_invalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir e-posta adresi girin'**
  String get auth_email_invalid;

  /// No description provided for @auth_password.
  ///
  /// In tr, this message translates to:
  /// **'Şifre'**
  String get auth_password;

  /// No description provided for @auth_password_hint.
  ///
  /// In tr, this message translates to:
  /// **'Şifrenizi girin'**
  String get auth_password_hint;

  /// No description provided for @auth_password_required.
  ///
  /// In tr, this message translates to:
  /// **'Şifre gerekli'**
  String get auth_password_required;

  /// No description provided for @auth_password_too_short.
  ///
  /// In tr, this message translates to:
  /// **'Şifre en az 6 karakter olmalı'**
  String get auth_password_too_short;

  /// No description provided for @auth_confirm_password.
  ///
  /// In tr, this message translates to:
  /// **'Şifre Tekrar'**
  String get auth_confirm_password;

  /// No description provided for @auth_confirm_password_hint.
  ///
  /// In tr, this message translates to:
  /// **'Şifrenizi tekrar girin'**
  String get auth_confirm_password_hint;

  /// No description provided for @auth_confirm_password_required.
  ///
  /// In tr, this message translates to:
  /// **'Şifre tekrarı gerekli'**
  String get auth_confirm_password_required;

  /// No description provided for @auth_passwords_dont_match.
  ///
  /// In tr, this message translates to:
  /// **'Şifreler eşleşmiyor'**
  String get auth_passwords_dont_match;

  /// No description provided for @auth_login.
  ///
  /// In tr, this message translates to:
  /// **'Giriş Yap'**
  String get auth_login;

  /// No description provided for @auth_register.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt Ol'**
  String get auth_register;

  /// No description provided for @auth_dont_have_account.
  ///
  /// In tr, this message translates to:
  /// **'Hesabınız yok mu? Kayıt olun'**
  String get auth_dont_have_account;

  /// No description provided for @auth_already_have_account.
  ///
  /// In tr, this message translates to:
  /// **'Zaten hesabınız var mı? Giriş yapın'**
  String get auth_already_have_account;

  /// No description provided for @auth_email_already_exists.
  ///
  /// In tr, this message translates to:
  /// **'Bu e-posta adresi zaten kullanılıyor'**
  String get auth_email_already_exists;

  /// No description provided for @auth_email_not_found.
  ///
  /// In tr, this message translates to:
  /// **'Bu e-posta adresi kayıtlı değil'**
  String get auth_email_not_found;

  /// No description provided for @auth_password_mismatch.
  ///
  /// In tr, this message translates to:
  /// **'E-posta veya şifre hatalı'**
  String get auth_password_mismatch;

  /// No description provided for @auth_error_occurred.
  ///
  /// In tr, this message translates to:
  /// **'Bir hata oluştu. Lütfen tekrar deneyin'**
  String get auth_error_occurred;

  /// No description provided for @change_password_title.
  ///
  /// In tr, this message translates to:
  /// **'Şifre Değiştir'**
  String get change_password_title;

  /// No description provided for @change_password_subtitle.
  ///
  /// In tr, this message translates to:
  /// **'Güvenliğiniz için güçlü bir şifre seçin'**
  String get change_password_subtitle;

  /// No description provided for @change_password_current.
  ///
  /// In tr, this message translates to:
  /// **'Mevcut Şifre'**
  String get change_password_current;

  /// No description provided for @change_password_current_hint.
  ///
  /// In tr, this message translates to:
  /// **'Mevcut şifrenizi girin'**
  String get change_password_current_hint;

  /// No description provided for @change_password_current_required.
  ///
  /// In tr, this message translates to:
  /// **'Mevcut şifre gerekli'**
  String get change_password_current_required;

  /// No description provided for @change_password_new.
  ///
  /// In tr, this message translates to:
  /// **'Yeni Şifre'**
  String get change_password_new;

  /// No description provided for @change_password_new_hint.
  ///
  /// In tr, this message translates to:
  /// **'Yeni şifrenizi girin'**
  String get change_password_new_hint;

  /// No description provided for @change_password_new_required.
  ///
  /// In tr, this message translates to:
  /// **'Yeni şifre gerekli'**
  String get change_password_new_required;

  /// No description provided for @change_password_confirm.
  ///
  /// In tr, this message translates to:
  /// **'Yeni Şifre Tekrar'**
  String get change_password_confirm;

  /// No description provided for @change_password_confirm_hint.
  ///
  /// In tr, this message translates to:
  /// **'Yeni şifrenizi tekrar girin'**
  String get change_password_confirm_hint;

  /// No description provided for @change_password_confirm_required.
  ///
  /// In tr, this message translates to:
  /// **'Yeni şifre tekrarı gerekli'**
  String get change_password_confirm_required;

  /// No description provided for @change_password_same_as_current.
  ///
  /// In tr, this message translates to:
  /// **'Yeni şifre mevcut şifre ile aynı olamaz'**
  String get change_password_same_as_current;

  /// No description provided for @change_password_button.
  ///
  /// In tr, this message translates to:
  /// **'Şifreyi Değiştir'**
  String get change_password_button;

  /// No description provided for @change_password_success.
  ///
  /// In tr, this message translates to:
  /// **'Şifreniz başarıyla değiştirildi'**
  String get change_password_success;

  /// No description provided for @change_password_current_wrong.
  ///
  /// In tr, this message translates to:
  /// **'Mevcut şifre yanlış'**
  String get change_password_current_wrong;

  /// No description provided for @genreAction.
  ///
  /// In tr, this message translates to:
  /// **'Aksiyon'**
  String get genreAction;

  /// No description provided for @genreAdventure.
  ///
  /// In tr, this message translates to:
  /// **'Macera'**
  String get genreAdventure;

  /// No description provided for @genreAnimation.
  ///
  /// In tr, this message translates to:
  /// **'Animasyon'**
  String get genreAnimation;

  /// No description provided for @genreComedy.
  ///
  /// In tr, this message translates to:
  /// **'Komedi'**
  String get genreComedy;

  /// No description provided for @genreCrime.
  ///
  /// In tr, this message translates to:
  /// **'Suç'**
  String get genreCrime;

  /// No description provided for @genreDocumentary.
  ///
  /// In tr, this message translates to:
  /// **'Belgesel'**
  String get genreDocumentary;

  /// No description provided for @genreDrama.
  ///
  /// In tr, this message translates to:
  /// **'Drama'**
  String get genreDrama;

  /// No description provided for @genreFamily.
  ///
  /// In tr, this message translates to:
  /// **'Aile'**
  String get genreFamily;

  /// No description provided for @genreFantasy.
  ///
  /// In tr, this message translates to:
  /// **'Fantastik'**
  String get genreFantasy;

  /// No description provided for @genreHistory.
  ///
  /// In tr, this message translates to:
  /// **'Tarih'**
  String get genreHistory;

  /// No description provided for @genreHorror.
  ///
  /// In tr, this message translates to:
  /// **'Korku'**
  String get genreHorror;

  /// No description provided for @genreMusic.
  ///
  /// In tr, this message translates to:
  /// **'Müzik'**
  String get genreMusic;

  /// No description provided for @genreMystery.
  ///
  /// In tr, this message translates to:
  /// **'Gizem'**
  String get genreMystery;

  /// No description provided for @genreRomance.
  ///
  /// In tr, this message translates to:
  /// **'Romantik'**
  String get genreRomance;

  /// No description provided for @genreScienceFiction.
  ///
  /// In tr, this message translates to:
  /// **'Bilim Kurgu'**
  String get genreScienceFiction;

  /// No description provided for @genreTvMovie.
  ///
  /// In tr, this message translates to:
  /// **'TV Film'**
  String get genreTvMovie;

  /// No description provided for @genreThriller.
  ///
  /// In tr, this message translates to:
  /// **'Gerilim'**
  String get genreThriller;

  /// No description provided for @genreWar.
  ///
  /// In tr, this message translates to:
  /// **'Savaş'**
  String get genreWar;

  /// No description provided for @genreWestern.
  ///
  /// In tr, this message translates to:
  /// **'Western'**
  String get genreWestern;

  /// No description provided for @genreUnknown.
  ///
  /// In tr, this message translates to:
  /// **'Tür #{id}'**
  String genreUnknown(int id);

  /// No description provided for @detailGenres.
  ///
  /// In tr, this message translates to:
  /// **'Türler'**
  String get detailGenres;

  /// No description provided for @detailAdditionalInfo.
  ///
  /// In tr, this message translates to:
  /// **'Ek Bilgiler'**
  String get detailAdditionalInfo;

  /// No description provided for @detailVideoContent.
  ///
  /// In tr, this message translates to:
  /// **'Video İçeriği'**
  String get detailVideoContent;

  /// No description provided for @detailVideoAvailable.
  ///
  /// In tr, this message translates to:
  /// **'Var'**
  String get detailVideoAvailable;

  /// No description provided for @detailVideoNotAvailable.
  ///
  /// In tr, this message translates to:
  /// **'Yok'**
  String get detailVideoNotAvailable;

  /// No description provided for @detailAgeRestriction.
  ///
  /// In tr, this message translates to:
  /// **'Yaş Sınırı'**
  String get detailAgeRestriction;

  /// No description provided for @detailAdultContent.
  ///
  /// In tr, this message translates to:
  /// **'+18'**
  String get detailAdultContent;

  /// No description provided for @detailGeneralAudience.
  ///
  /// In tr, this message translates to:
  /// **'Genel İzleyici'**
  String get detailGeneralAudience;

  /// No description provided for @detailOverview.
  ///
  /// In tr, this message translates to:
  /// **'Özet'**
  String get detailOverview;

  /// No description provided for @detailReleaseDate.
  ///
  /// In tr, this message translates to:
  /// **'Yayın Tarihi'**
  String get detailReleaseDate;

  /// No description provided for @detailOriginalLanguage.
  ///
  /// In tr, this message translates to:
  /// **'Orijinal Dil'**
  String get detailOriginalLanguage;

  /// No description provided for @detailMovieId.
  ///
  /// In tr, this message translates to:
  /// **'Film ID'**
  String get detailMovieId;

  /// No description provided for @selectLanguage.
  ///
  /// In tr, this message translates to:
  /// **'Dil Seçin'**
  String get selectLanguage;

  /// No description provided for @searchError.
  ///
  /// In tr, this message translates to:
  /// **'Arama sırasında bir hata oluştu'**
  String get searchError;

  /// No description provided for @settingsVersion.
  ///
  /// In tr, this message translates to:
  /// **'Versiyon {version}'**
  String settingsVersion(String version);

  /// No description provided for @settingsCopyright.
  ///
  /// In tr, this message translates to:
  /// **'© 2026 Afectod. Tüm hakları saklıdır.'**
  String get settingsCopyright;

  /// No description provided for @favoritesAllFavorites.
  ///
  /// In tr, this message translates to:
  /// **'Tüm Favoriler'**
  String get favoritesAllFavorites;

  /// No description provided for @favoritesAllFavoritesDescription.
  ///
  /// In tr, this message translates to:
  /// **'Tüm favori filmleriniz'**
  String get favoritesAllFavoritesDescription;

  /// No description provided for @languageEn.
  ///
  /// In tr, this message translates to:
  /// **'İngilizce'**
  String get languageEn;

  /// No description provided for @languageTr.
  ///
  /// In tr, this message translates to:
  /// **'Türkçe'**
  String get languageTr;

  /// No description provided for @languageEs.
  ///
  /// In tr, this message translates to:
  /// **'İspanyolca'**
  String get languageEs;

  /// No description provided for @languageFr.
  ///
  /// In tr, this message translates to:
  /// **'Fransızca'**
  String get languageFr;

  /// No description provided for @languageDe.
  ///
  /// In tr, this message translates to:
  /// **'Almanca'**
  String get languageDe;

  /// No description provided for @languageIt.
  ///
  /// In tr, this message translates to:
  /// **'İtalyanca'**
  String get languageIt;

  /// No description provided for @languageJa.
  ///
  /// In tr, this message translates to:
  /// **'Japonca'**
  String get languageJa;

  /// No description provided for @languageKo.
  ///
  /// In tr, this message translates to:
  /// **'Korece'**
  String get languageKo;

  /// No description provided for @languageZh.
  ///
  /// In tr, this message translates to:
  /// **'Çince'**
  String get languageZh;

  /// No description provided for @languageRu.
  ///
  /// In tr, this message translates to:
  /// **'Rusça'**
  String get languageRu;

  /// No description provided for @languagePt.
  ///
  /// In tr, this message translates to:
  /// **'Portekizce'**
  String get languagePt;

  /// No description provided for @languageAr.
  ///
  /// In tr, this message translates to:
  /// **'Arapça'**
  String get languageAr;

  /// No description provided for @languageHi.
  ///
  /// In tr, this message translates to:
  /// **'Hintçe'**
  String get languageHi;

  /// No description provided for @languageNl.
  ///
  /// In tr, this message translates to:
  /// **'Felemenkçe'**
  String get languageNl;

  /// No description provided for @languageSv.
  ///
  /// In tr, this message translates to:
  /// **'İsveççe'**
  String get languageSv;

  /// No description provided for @languageNo.
  ///
  /// In tr, this message translates to:
  /// **'Norveççe'**
  String get languageNo;

  /// No description provided for @languageDa.
  ///
  /// In tr, this message translates to:
  /// **'Danca'**
  String get languageDa;

  /// No description provided for @languageFi.
  ///
  /// In tr, this message translates to:
  /// **'Fince'**
  String get languageFi;

  /// No description provided for @languagePl.
  ///
  /// In tr, this message translates to:
  /// **'Lehçe'**
  String get languagePl;

  /// No description provided for @languageCs.
  ///
  /// In tr, this message translates to:
  /// **'Çekçe'**
  String get languageCs;

  /// No description provided for @languageHu.
  ///
  /// In tr, this message translates to:
  /// **'Macarca'**
  String get languageHu;

  /// No description provided for @languageRo.
  ///
  /// In tr, this message translates to:
  /// **'Rumence'**
  String get languageRo;

  /// No description provided for @languageEl.
  ///
  /// In tr, this message translates to:
  /// **'Yunanca'**
  String get languageEl;

  /// No description provided for @languageHe.
  ///
  /// In tr, this message translates to:
  /// **'İbranice'**
  String get languageHe;

  /// No description provided for @languageTh.
  ///
  /// In tr, this message translates to:
  /// **'Tayca'**
  String get languageTh;

  /// No description provided for @languageVi.
  ///
  /// In tr, this message translates to:
  /// **'Vietnamca'**
  String get languageVi;

  /// No description provided for @languageId.
  ///
  /// In tr, this message translates to:
  /// **'Endonezce'**
  String get languageId;

  /// No description provided for @languageMs.
  ///
  /// In tr, this message translates to:
  /// **'Malayca'**
  String get languageMs;

  /// No description provided for @detailVotes.
  ///
  /// In tr, this message translates to:
  /// **'oy'**
  String get detailVotes;

  /// No description provided for @detailVotesCount.
  ///
  /// In tr, this message translates to:
  /// **'({count} oy)'**
  String detailVotesCount(int count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
