abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangVisibilityState extends AppStates {}

class LoginLoadingState extends AppStates {}

class LoginGoogleLoadingState extends AppStates {}

class LoginSuccessState extends AppStates {}

class LoginErrorState extends AppStates {}

class RegisterLoadingState extends AppStates {}

class RegisterSuccessState extends AppStates {}

class RegisterErrorState extends AppStates {}

class NotValidState extends AppStates {}

//////////////////////////////

class FavoritesInitial extends AppStates {}

class GetFavoritesLoading extends AppStates {}

class GetFavoritesError extends AppStates {}

class GetFavoritesSuccess extends AppStates {}

class PutInFavoritesLoading extends AppStates {}

class PutInFavoritesError extends AppStates {}

class PutInFavoritesSuccess extends AppStates {}

class PutInFavoritesAlreadyExisted extends AppStates {}

class DeleteFromFavoritesLoading extends AppStates {}

class DeleteFromFavoritesError extends AppStates {}

class DeleteFromFavoritesSuccess extends AppStates {}

class ChangeFavoriteIcons extends AppStates {}

class DetailsNewItem extends AppStates {}
