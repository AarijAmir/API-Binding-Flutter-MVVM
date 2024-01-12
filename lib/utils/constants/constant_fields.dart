// Navigation Constants
const String kLoginScreen = '/loginScreen';
const String kHomeScreen = '/home_screen';
const String kSignUpScreen = '/sign_up';
const String kSplashScreen = '/';

// Api Constants
String reqresBaseURL = 'https://reqres.in/api/';
String loginEndPoint = '${reqresBaseURL}login';
String signUpEndPoint = '${reqresBaseURL}register';
String moviesBaseURL =
    'https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io/';
String moviesListEndPoint = '${moviesBaseURL}movies_list';

// constants for Shared Preferences
enum SharedPreferencesForUser { token, id }
