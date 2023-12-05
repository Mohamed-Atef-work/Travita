abstract class SearchStates {}

class SearchInitial extends SearchStates {}

class GetImageSuccess extends SearchStates {}

class UpLoadImageLoading extends SearchStates {}

class UpLoadImageSuccess extends SearchStates {}

class UpLoadImageError extends SearchStates {}

class UpLoadImageLinkLoading extends SearchStates {}

class UpLoadImageLinkSuccess extends SearchStates {}

class UpLoadImageLinkError extends SearchStates {}

class GetSearchResultLoading extends SearchStates {}

class GetSearchResultSuccess extends SearchStates {}

class GetSearchResultError extends SearchStates {}
