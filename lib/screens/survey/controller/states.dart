abstract class SurveyStates {}

class SurveyInitialState extends SurveyStates {}

class GetSurveyLoading extends SurveyStates {}

class GetSurveyError extends SurveyStates {}

class GetSurveySuccess extends SurveyStates {}

class SendSurveyRateLoading extends SurveyStates {}

class SendSurveyRateError extends SurveyStates {}

class SendSurveyRateSuccess extends SurveyStates {}
