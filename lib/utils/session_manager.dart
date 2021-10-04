import 'package:shared_preferences/shared_preferences.dart';
import 'package:nubae/models/User.dart';
import 'package:nubae/firebase_services/subscribe_manager.dart';

enum Login_Status { NEW_USER, LOGGED_IN, LOGGED_OUT }

const String DateFormat = 'yyyy-MM-dd';

class SessionManager {
  static final String KEY_LOGGEDIN = 'logged_in';
  static final String KEY_EMAIL = 'key_email';
  static final String KEY_IMAGE = 'key_image';
  static final String KEY_USER_ID = 'key_user_id';
  static final String KEY_FIRST_NAME = 'key_firstname';
  static final String KEY_LAST_NAME = 'key_lastname';
  static final String KEY_CITY = 'key_city';
  static final String KEY_PHONE = 'key_phone';
  static final String KEY_POSTALCODE = 'key_postalcode';
  static final String KEY_COUNTRY = 'key_country';
  static final String KEY_USER_STATUS = 'key_user_status';

  static SharedPreferences _sharedPrefs;

  static void initialize(SharedPreferences sharedPreferences) {
    _sharedPrefs = sharedPreferences;
  }

  static Login_Status isLogged() {
    var loggedIn = _sharedPrefs.getString(KEY_LOGGEDIN) ?? false;

    if (loggedIn == 'true') {
      return Login_Status.LOGGED_IN;
    } else {
      return Login_Status.LOGGED_OUT;
    }
  }

  static void saveUserInfoToLocal(User userInfo) {
    SessionManager.setUserId(userInfo.uid);
    SessionManager.setFirstName(userInfo.firstName);
    SessionManager.setLastName(userInfo.lastName);
    SessionManager.setImage(userInfo.myimage.myimageURL);
    SessionManager.setCity(userInfo.city);
    SessionManager.setPhone(userInfo.phone.toString());
    SessionManager.setPostalCode(userInfo.postalcode.toString());
    SessionManager.setCountry(userInfo.country);
    SessionManager.setUserPaymentStatus(userInfo.uid);
  }

  static bool isLoggin() {
    if (getUserId().isNotEmpty) return true;
    return false;
  }

  static String getUserId() {
    return _sharedPrefs.getString(KEY_USER_ID) ?? '';
  }

  static void setUserId(String userId) {
    _sharedPrefs.setString(KEY_USER_ID, userId);
  }

  static String getUserStatus() {
    return _sharedPrefs.getString(KEY_USER_STATUS) ?? '';
  }

  static void setUserPaymentStatus(String userId) async {
    String userStatus = "";
    userStatus = await SubscribeManager.getUserStatus(userId);
    _sharedPrefs.setString(KEY_USER_STATUS, userStatus);
  }

  static String getFirstName() {
    return _sharedPrefs.getString(KEY_FIRST_NAME) ?? '';
  }

  static void setFirstName(String firstname) {
    _sharedPrefs.setString(KEY_FIRST_NAME, firstname);
  }

  static String getCountry() {
    return _sharedPrefs.getString(KEY_COUNTRY) ?? '';
  }

  static void setCountry(String country) {
    _sharedPrefs.setString(KEY_COUNTRY, country);
  }

  static String getLastName() {
    return _sharedPrefs.getString(KEY_LAST_NAME) ?? '';
  }

  static void setLastName(String lastname) {
    _sharedPrefs.setString(KEY_LAST_NAME, lastname);
  }

  static String getCity() {
    return _sharedPrefs.getString(KEY_CITY) ?? '';
  }

  static void setCity(String city) {
    _sharedPrefs.setString(KEY_CITY, city);
  }

  static String getPhone() {
    return _sharedPrefs.getString(KEY_PHONE) ?? '';
  }

  static void setPhone(String phone) {
    _sharedPrefs.setString(KEY_PHONE, phone);
  }

  static String getPostalCode() {
    return _sharedPrefs.getString(KEY_POSTALCODE) ?? '';
  }

  static void setPostalCode(String postalcode) {
    _sharedPrefs.setString(KEY_POSTALCODE, postalcode);
  }

  static void hasLoggedIn() {
    _sharedPrefs.setString(KEY_LOGGEDIN, 'true');
  }

  static void hasLoggedOut() {
    _sharedPrefs.setString(KEY_LOGGEDIN, 'false');
    handleClearAllSettging();
  }

  static void handleClearAllSettging() {
    setUserId(null);

    setEmail('');
    setImage('');
  }

  static String getEmail() {
    return _sharedPrefs.getString(KEY_EMAIL) ?? '';
  }

  static void setEmail(String email) {
    _sharedPrefs.setString(KEY_EMAIL, email);
  }

  static String getImage() {
    return _sharedPrefs.getString(KEY_IMAGE) ?? '';
  }

  static void setImage(String image) {
    _sharedPrefs.setString(KEY_IMAGE, image);
  }
}
