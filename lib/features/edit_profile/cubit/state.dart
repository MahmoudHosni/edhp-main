abstract class EditProfileStates {}

class EditProfileInitiateState extends EditProfileStates {}

class EditProfileLoadingState extends EditProfileStates {}

class EditProfileSuccessfullyState extends EditProfileStates {}

class EditProfileErrorState extends EditProfileStates {}

class EditProfileImagePickedSuccessState extends EditProfileStates {}

class EditProfileImagePickedErrorState extends EditProfileStates {}

class UploadProfileImageLoadingState extends EditProfileStates {}

class UploadProfileImageSuccessfullyState extends EditProfileStates {}

class UploadProfileImageErrorState extends EditProfileStates {}