// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Afectod';

  @override
  String get errorGeneric => 'Bir hata oluştu';

  @override
  String get retryButton => 'Tekrar Dene';

  @override
  String get cancel => 'İptal';

  @override
  String get close => 'Kapat';

  @override
  String get delete => 'Sil';

  @override
  String get create => 'Oluştur';

  @override
  String get apply => 'Uygula';

  @override
  String get remove => 'Çıkar';

  @override
  String get movies => 'film';

  @override
  String moviesCount(int count) {
    return '$count film';
  }

  @override
  String resultsCount(int count) {
    return '$count sonuç';
  }

  @override
  String get navDiscover => 'Keşfet';

  @override
  String get navFavorites => 'Favoriler';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get discoverNoMovies => 'Film bulunamadı';

  @override
  String get favoritesTitle => 'Favorilerim';

  @override
  String get favoritesFilter => 'Filtrele';

  @override
  String get favoritesNewList => 'Yeni Liste';

  @override
  String get favoritesNoLists => 'Henüz favori listeniz yok';

  @override
  String get favoritesNoMoviesInList => 'Bu listede henüz film yok';

  @override
  String get createListTitle => 'Yeni Liste Oluştur';

  @override
  String get createListName => 'Liste Adı';

  @override
  String get createListNameRequired => 'Liste adı giriniz';

  @override
  String get createListDescription => 'Açıklama (Opsiyonel)';

  @override
  String get addToListTitle => 'Listeye Ekle';

  @override
  String get addToListNoLists => 'Henüz liste oluşturmadınız';

  @override
  String get addToListAutomatic => 'Otomatik liste';

  @override
  String get selectListTitle => 'Liste Seç';

  @override
  String get deleteListTitle => 'Listeyi Sil';

  @override
  String deleteListConfirm(String listName) {
    return '$listName listesini silmek istediğinize emin misiniz?';
  }

  @override
  String get removeMovieTitle => 'Filmı Çıkar';

  @override
  String removeMovieConfirm(String movieTitle) {
    return '$movieTitle filmini listeden çıkarmak istiyor musunuz?';
  }

  @override
  String get searchTitle => 'Film Ara';

  @override
  String get searchPlaceholder => 'Film ara...';

  @override
  String get searchHint =>
      'Film aramak için yukarıdaki\narama çubuğunu kullanın';

  @override
  String get searchRecentTitle => 'Son Aramalar';

  @override
  String get searchClearAll => 'Tümünü Temizle';

  @override
  String get searchNoResults => 'Film bulunamadı.';

  @override
  String get filterTitle => 'Filtrele';

  @override
  String get filterYear => 'Yıl';

  @override
  String get filterRating => 'Puan';

  @override
  String get filterMin => 'Min';

  @override
  String get filterMax => 'Max';

  @override
  String filterYearRange(String min, String max) {
    return 'Yıl: $min - $max';
  }

  @override
  String filterRatingRange(String min, String max) {
    return 'Puan: $min - $max';
  }

  @override
  String get sortTitle => 'Sırala';

  @override
  String get sortAlphabetical => 'Alfabetik (A-Z)';

  @override
  String get sortYear => 'Yıl';

  @override
  String get sortRating => 'Puan';

  @override
  String get sortDirection => 'Sıralama Yönü';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsAppearance => 'Görünüm';

  @override
  String get settingsLanguageRegion => 'Dil ve Bölge';

  @override
  String get settingsAccount => 'Hesap';

  @override
  String get settingsDarkTheme => 'Koyu Tema';

  @override
  String get settingsDarkThemeSubtitle => 'Gözlerinizi koruyun';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get settingsChangePassword => 'Şifre Değiştir';

  @override
  String get settingsChangePasswordMessage =>
      'Şifre değiştirme sayfası açılıyor...';

  @override
  String get settingsLogout => 'Çıkış Yap';

  @override
  String get settingsLogoutConfirm =>
      'Çıkış yapmak istediğinizden emin misiniz?';

  @override
  String get settingsLoggingOut => 'Çıkış yapılıyor...';

  @override
  String get auth_welcome_back => 'Tekrar Hoşgeldiniz';

  @override
  String get auth_create_account => 'Hesap Oluştur';

  @override
  String get auth_login_subtitle => 'Hesabınıza giriş yapın';

  @override
  String get auth_register_subtitle => 'Yeni bir hesap oluşturun';

  @override
  String get auth_username => 'Kullanıcı Adı';

  @override
  String get auth_username_hint => 'Kullanıcı adınızı girin';

  @override
  String get auth_username_required => 'Kullanıcı adı gerekli';

  @override
  String get auth_username_too_short => 'Kullanıcı adı en az 3 karakter olmalı';

  @override
  String get auth_email => 'E-posta';

  @override
  String get auth_email_hint => 'E-posta adresinizi girin';

  @override
  String get auth_email_required => 'E-posta gerekli';

  @override
  String get auth_email_invalid => 'Geçerli bir e-posta adresi girin';

  @override
  String get auth_password => 'Şifre';

  @override
  String get auth_password_hint => 'Şifrenizi girin';

  @override
  String get auth_password_required => 'Şifre gerekli';

  @override
  String get auth_password_too_short => 'Şifre en az 6 karakter olmalı';

  @override
  String get auth_confirm_password => 'Şifre Tekrar';

  @override
  String get auth_confirm_password_hint => 'Şifrenizi tekrar girin';

  @override
  String get auth_confirm_password_required => 'Şifre tekrarı gerekli';

  @override
  String get auth_passwords_dont_match => 'Şifreler eşleşmiyor';

  @override
  String get auth_login => 'Giriş Yap';

  @override
  String get auth_register => 'Kayıt Ol';

  @override
  String get auth_dont_have_account => 'Hesabınız yok mu? Kayıt olun';

  @override
  String get auth_already_have_account => 'Zaten hesabınız var mı? Giriş yapın';

  @override
  String get auth_email_already_exists =>
      'Bu e-posta adresi zaten kullanılıyor';

  @override
  String get auth_email_not_found => 'Bu e-posta adresi kayıtlı değil';

  @override
  String get auth_password_mismatch => 'E-posta veya şifre hatalı';

  @override
  String get auth_error_occurred => 'Bir hata oluştu. Lütfen tekrar deneyin';

  @override
  String get change_password_title => 'Şifre Değiştir';

  @override
  String get change_password_subtitle =>
      'Güvenliğiniz için güçlü bir şifre seçin';

  @override
  String get change_password_current => 'Mevcut Şifre';

  @override
  String get change_password_current_hint => 'Mevcut şifrenizi girin';

  @override
  String get change_password_current_required => 'Mevcut şifre gerekli';

  @override
  String get change_password_new => 'Yeni Şifre';

  @override
  String get change_password_new_hint => 'Yeni şifrenizi girin';

  @override
  String get change_password_new_required => 'Yeni şifre gerekli';

  @override
  String get change_password_confirm => 'Yeni Şifre Tekrar';

  @override
  String get change_password_confirm_hint => 'Yeni şifrenizi tekrar girin';

  @override
  String get change_password_confirm_required => 'Yeni şifre tekrarı gerekli';

  @override
  String get change_password_same_as_current =>
      'Yeni şifre mevcut şifre ile aynı olamaz';

  @override
  String get change_password_button => 'Şifreyi Değiştir';

  @override
  String get change_password_success => 'Şifreniz başarıyla değiştirildi';

  @override
  String get change_password_current_wrong => 'Mevcut şifre yanlış';

  @override
  String get genreAction => 'Aksiyon';

  @override
  String get genreAdventure => 'Macera';

  @override
  String get genreAnimation => 'Animasyon';

  @override
  String get genreComedy => 'Komedi';

  @override
  String get genreCrime => 'Suç';

  @override
  String get genreDocumentary => 'Belgesel';

  @override
  String get genreDrama => 'Drama';

  @override
  String get genreFamily => 'Aile';

  @override
  String get genreFantasy => 'Fantastik';

  @override
  String get genreHistory => 'Tarih';

  @override
  String get genreHorror => 'Korku';

  @override
  String get genreMusic => 'Müzik';

  @override
  String get genreMystery => 'Gizem';

  @override
  String get genreRomance => 'Romantik';

  @override
  String get genreScienceFiction => 'Bilim Kurgu';

  @override
  String get genreTvMovie => 'TV Film';

  @override
  String get genreThriller => 'Gerilim';

  @override
  String get genreWar => 'Savaş';

  @override
  String get genreWestern => 'Western';

  @override
  String genreUnknown(int id) {
    return 'Tür #$id';
  }

  @override
  String get detailGenres => 'Türler';

  @override
  String get detailAdditionalInfo => 'Ek Bilgiler';

  @override
  String get detailVideoContent => 'Video İçeriği';

  @override
  String get detailVideoAvailable => 'Var';

  @override
  String get detailVideoNotAvailable => 'Yok';

  @override
  String get detailAgeRestriction => 'Yaş Sınırı';

  @override
  String get detailAdultContent => '+18';

  @override
  String get detailGeneralAudience => 'Genel İzleyici';

  @override
  String get detailOverview => 'Özet';

  @override
  String get detailReleaseDate => 'Yayın Tarihi';

  @override
  String get detailOriginalLanguage => 'Orijinal Dil';

  @override
  String get detailMovieId => 'Film ID';

  @override
  String get selectLanguage => 'Dil Seçin';

  @override
  String get searchError => 'Arama sırasında bir hata oluştu';

  @override
  String settingsVersion(String version) {
    return 'Versiyon $version';
  }

  @override
  String get settingsCopyright => '© 2026 Afectod. Tüm hakları saklıdır.';

  @override
  String get favoritesAllFavorites => 'Tüm Favoriler';

  @override
  String get favoritesAllFavoritesDescription => 'Tüm favori filmleriniz';

  @override
  String get languageEn => 'İngilizce';

  @override
  String get languageTr => 'Türkçe';

  @override
  String get languageEs => 'İspanyolca';

  @override
  String get languageFr => 'Fransızca';

  @override
  String get languageDe => 'Almanca';

  @override
  String get languageIt => 'İtalyanca';

  @override
  String get languageJa => 'Japonca';

  @override
  String get languageKo => 'Korece';

  @override
  String get languageZh => 'Çince';

  @override
  String get languageRu => 'Rusça';

  @override
  String get languagePt => 'Portekizce';

  @override
  String get languageAr => 'Arapça';

  @override
  String get languageHi => 'Hintçe';

  @override
  String get languageNl => 'Felemenkçe';

  @override
  String get languageSv => 'İsveççe';

  @override
  String get languageNo => 'Norveççe';

  @override
  String get languageDa => 'Danca';

  @override
  String get languageFi => 'Fince';

  @override
  String get languagePl => 'Lehçe';

  @override
  String get languageCs => 'Çekçe';

  @override
  String get languageHu => 'Macarca';

  @override
  String get languageRo => 'Rumence';

  @override
  String get languageEl => 'Yunanca';

  @override
  String get languageHe => 'İbranice';

  @override
  String get languageTh => 'Tayca';

  @override
  String get languageVi => 'Vietnamca';

  @override
  String get languageId => 'Endonezce';

  @override
  String get languageMs => 'Malayca';

  @override
  String get detailVotes => 'oy';

  @override
  String detailVotesCount(int count) {
    return '($count oy)';
  }
}
