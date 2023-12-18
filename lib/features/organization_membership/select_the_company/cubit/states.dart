abstract class CompanyItemsStates {}

class InitiateCompanyItemsState extends CompanyItemsStates {}

class CompanyItemLoadingState extends CompanyItemsStates {}

class CompanyItemSuccessfullyState extends CompanyItemsStates {}

class CompanyItemErrorState extends CompanyItemsStates {}

class ValidateOrganizationMemberLoadingState extends CompanyItemsStates {}

class ValidateOrganizationMemberSuccessfullyState extends CompanyItemsStates {}

class ValidateOrganizationMemberErrorState extends CompanyItemsStates {}