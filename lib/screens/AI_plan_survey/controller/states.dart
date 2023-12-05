abstract class AIPlanSurveyStates {}

class AIPlanInitial extends AIPlanSurveyStates {}

class CreateAIPlanLoading extends AIPlanSurveyStates {}

class CreateAIPlanError extends AIPlanSurveyStates {}

class CreateAIPlanSuccess extends AIPlanSurveyStates {}

class NoTValidFormField extends AIPlanSurveyStates {}

class DetermineStatePosition extends AIPlanSurveyStates {}
