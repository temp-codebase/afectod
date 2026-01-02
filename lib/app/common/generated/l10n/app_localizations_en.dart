// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Afectod';

  @override
  String get errorGeneric => 'An error occurred';

  @override
  String get retryButton => 'Try Again';

  @override
  String get cancel => 'Cancel';

  @override
  String get close => 'Close';

  @override
  String get delete => 'Delete';

  @override
  String get create => 'Create';

  @override
  String get apply => 'Apply';

  @override
  String get remove => 'Remove';

  @override
  String get movies => 'movies';

  @override
  String moviesCount(int count) {
    return '$count movies';
  }

  @override
  String resultsCount(int count) {
    return '$count results';
  }

  @override
  String get navDiscover => 'Discover';

  @override
  String get navFavorites => 'Favorites';

  @override
  String get navSettings => 'Settings';

  @override
  String get discoverNoMovies => 'No movies found';

  @override
  String get favoritesTitle => 'My Favorites';

  @override
  String get favoritesFilter => 'Filter';

  @override
  String get favoritesNewList => 'New List';

  @override
  String get favoritesNoLists => 'You don\'t have any favorite lists yet';

  @override
  String get favoritesNoMoviesInList => 'No movies in this list yet';

  @override
  String get createListTitle => 'Create New List';

  @override
  String get createListName => 'List Name';

  @override
  String get createListNameRequired => 'Please enter list name';

  @override
  String get createListDescription => 'Description (Optional)';

  @override
  String get addToListTitle => 'Add to List';

  @override
  String get addToListNoLists => 'You haven\'t created any lists yet';

  @override
  String get addToListAutomatic => 'Automatic list';

  @override
  String get selectListTitle => 'Select List';

  @override
  String get deleteListTitle => 'Delete List';

  @override
  String deleteListConfirm(String listName) {
    return 'Are you sure you want to delete $listName?';
  }

  @override
  String get removeMovieTitle => 'Remove Movie';

  @override
  String removeMovieConfirm(String movieTitle) {
    return 'Do you want to remove $movieTitle from the list?';
  }

  @override
  String get searchTitle => 'Search Movies';

  @override
  String get searchPlaceholder => 'Search movies...';

  @override
  String get searchHint => 'Use the search bar above\nto search for movies';

  @override
  String get searchRecentTitle => 'Recent Searches';

  @override
  String get searchClearAll => 'Clear All';

  @override
  String get searchNoResults => 'No movies found.';

  @override
  String get filterTitle => 'Filter';

  @override
  String get filterYear => 'Year';

  @override
  String get filterRating => 'Rating';

  @override
  String get filterMin => 'Min';

  @override
  String get filterMax => 'Max';

  @override
  String filterYearRange(String min, String max) {
    return 'Year: $min - $max';
  }

  @override
  String filterRatingRange(String min, String max) {
    return 'Rating: $min - $max';
  }

  @override
  String get sortTitle => 'Sort';

  @override
  String get sortAlphabetical => 'Alphabetical (A-Z)';

  @override
  String get sortYear => 'Year';

  @override
  String get sortRating => 'Rating';

  @override
  String get sortDirection => 'Sort Direction';

  @override
  String get sortAZ => 'A-Z';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsLanguageRegion => 'Language & Region';

  @override
  String get settingsAccount => 'Account';

  @override
  String get settingsDarkTheme => 'Dark Theme';

  @override
  String get settingsDarkThemeSubtitle => 'Protect your eyes';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsChangePassword => 'Change Password';

  @override
  String get settingsChangePasswordMessage => 'Opening change password page...';

  @override
  String get settingsLogout => 'Logout';

  @override
  String get settingsLogoutConfirm => 'Are you sure you want to logout?';

  @override
  String get settingsLoggingOut => 'Logging out...';

  @override
  String get auth_welcome_back => 'Welcome Back';

  @override
  String get auth_create_account => 'Create Account';

  @override
  String get auth_login_subtitle => 'Sign in to your account';

  @override
  String get auth_register_subtitle => 'Create a new account';

  @override
  String get auth_username => 'Username';

  @override
  String get auth_username_hint => 'Enter your username';

  @override
  String get auth_username_required => 'Username is required';

  @override
  String get auth_username_too_short =>
      'Username must be at least 3 characters';

  @override
  String get auth_email => 'Email';

  @override
  String get auth_email_hint => 'Enter your email address';

  @override
  String get auth_email_required => 'Email is required';

  @override
  String get auth_email_invalid => 'Please enter a valid email address';

  @override
  String get auth_password => 'Password';

  @override
  String get auth_password_hint => 'Enter your password';

  @override
  String get auth_password_required => 'Password is required';

  @override
  String get auth_password_too_short =>
      'Password must be at least 6 characters';

  @override
  String get auth_confirm_password => 'Confirm Password';

  @override
  String get auth_confirm_password_hint => 'Re-enter your password';

  @override
  String get auth_confirm_password_required =>
      'Password confirmation is required';

  @override
  String get auth_passwords_dont_match => 'Passwords don\'t match';

  @override
  String get auth_login => 'Login';

  @override
  String get auth_register => 'Register';

  @override
  String get auth_dont_have_account => 'Don\'t have an account? Register';

  @override
  String get auth_already_have_account => 'Already have an account? Login';

  @override
  String get auth_email_already_exists =>
      'This email address is already in use';

  @override
  String get auth_email_not_found => 'This email address is not registered';

  @override
  String get auth_password_mismatch => 'Email or password is incorrect';

  @override
  String get auth_error_occurred => 'An error occurred. Please try again';

  @override
  String get change_password_title => 'Change Password';

  @override
  String get change_password_subtitle =>
      'Choose a strong password for your security';

  @override
  String get change_password_current => 'Current Password';

  @override
  String get change_password_current_hint => 'Enter your current password';

  @override
  String get change_password_current_required => 'Current password is required';

  @override
  String get change_password_new => 'New Password';

  @override
  String get change_password_new_hint => 'Enter your new password';

  @override
  String get change_password_new_required => 'New password is required';

  @override
  String get change_password_confirm => 'Confirm New Password';

  @override
  String get change_password_confirm_hint => 'Re-enter your new password';

  @override
  String get change_password_confirm_required =>
      'New password confirmation is required';

  @override
  String get change_password_same_as_current =>
      'New password cannot be the same as current password';

  @override
  String get change_password_button => 'Change Password';

  @override
  String get change_password_success =>
      'Your password has been changed successfully';

  @override
  String get change_password_current_wrong => 'Current password is incorrect';

  @override
  String get genreAction => 'Action';

  @override
  String get genreAdventure => 'Adventure';

  @override
  String get genreAnimation => 'Animation';

  @override
  String get genreComedy => 'Comedy';

  @override
  String get genreCrime => 'Crime';

  @override
  String get genreDocumentary => 'Documentary';

  @override
  String get genreDrama => 'Drama';

  @override
  String get genreFamily => 'Family';

  @override
  String get genreFantasy => 'Fantasy';

  @override
  String get genreHistory => 'History';

  @override
  String get genreHorror => 'Horror';

  @override
  String get genreMusic => 'Music';

  @override
  String get genreMystery => 'Mystery';

  @override
  String get genreRomance => 'Romance';

  @override
  String get genreScienceFiction => 'Science Fiction';

  @override
  String get genreTvMovie => 'TV Movie';

  @override
  String get genreThriller => 'Thriller';

  @override
  String get genreWar => 'War';

  @override
  String get genreWestern => 'Western';

  @override
  String genreUnknown(int id) {
    return 'Genre #$id';
  }

  @override
  String get detailGenres => 'Genres';

  @override
  String get detailAdditionalInfo => 'Additional Info';

  @override
  String get detailVideoContent => 'Video Content';

  @override
  String get detailVideoAvailable => 'Available';

  @override
  String get detailVideoNotAvailable => 'Not Available';

  @override
  String get detailAgeRestriction => 'Age Restriction';

  @override
  String get detailAdultContent => '+18';

  @override
  String get detailGeneralAudience => 'General Audience';

  @override
  String get detailOverview => 'Overview';

  @override
  String get detailReleaseDate => 'Release Date';

  @override
  String get detailOriginalLanguage => 'Original Language';

  @override
  String get detailMovieId => 'Movie ID';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get searchError => 'An error occurred while searching';

  @override
  String settingsVersion(String version) {
    return 'Version $version';
  }

  @override
  String get settingsCopyright => '© 2026 Afectod. All rights reserved.';

  @override
  String get favoritesAllFavorites => 'All Favorites';

  @override
  String get favoritesAllFavoritesDescription => 'All your favorite movies';

  @override
  String get languageEn => 'English';

  @override
  String get languageTr => 'Turkish';

  @override
  String get languageEs => 'Spanish';

  @override
  String get languageFr => 'French';

  @override
  String get languageDe => 'German';

  @override
  String get languageIt => 'Italian';

  @override
  String get languageJa => 'Japanese';

  @override
  String get languageKo => 'Korean';

  @override
  String get languageZh => 'Chinese';

  @override
  String get languageRu => 'Russian';

  @override
  String get languagePt => 'Portuguese';

  @override
  String get languageAr => 'Arabic';

  @override
  String get languageHi => 'Hindi';

  @override
  String get languageNl => 'Dutch';

  @override
  String get languageSv => 'Swedish';

  @override
  String get languageNo => 'Norwegian';

  @override
  String get languageDa => 'Danish';

  @override
  String get languageFi => 'Finnish';

  @override
  String get languagePl => 'Polish';

  @override
  String get languageCs => 'Czech';

  @override
  String get languageHu => 'Hungarian';

  @override
  String get languageRo => 'Romanian';

  @override
  String get languageEl => 'Greek';

  @override
  String get languageHe => 'Hebrew';

  @override
  String get languageTh => 'Thai';

  @override
  String get languageVi => 'Vietnamese';

  @override
  String get languageId => 'Indonesian';

  @override
  String get languageMs => 'Malay';

  @override
  String get detailVotes => 'votes';

  @override
  String detailVotesCount(int count) {
    return '($count votes)';
  }
}
