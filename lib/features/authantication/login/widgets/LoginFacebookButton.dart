import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/features/authantication/login/cubit/cubit.dart';
import 'package:edhp/features/authantication/login/widgets/clickable_register_app_container_item.dart';
import 'package:edhp/features/authantication/sign_up/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class LoginFacebookBtton extends StatelessWidget{
  late FacebookLogin plugin;
  FacebookAccessToken? _token;
  FacebookUserProfile? _profile;
  String? _email;
  String? _imageUrl;
  final bool willUsedInLogin ;

  LoginFacebookBtton({required this.willUsedInLogin});

  @override
  Widget build(BuildContext context) {
    return InkWell(child: ClickableRegisterAppContainerItem(appLogoPath: AppPaths.facebookLogoPath,),onTap: (){
      loginWithFacebook(context);
    });
  }

  Future<void> loginWithFacebook(BuildContext context) async {
    plugin = FacebookLogin(debug: true);

    await plugin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    await _updateLoginInfo(context);
  }

  _updateLoginInfo(BuildContext context) async {
    final token = await plugin.accessToken;
    FacebookUserProfile? profile;
    String? email;
    String? imageUrl;

    if (token != null) {

      imageUrl = await plugin.getProfileImageUrl(width: 100);

      plugin.getUserProfile().then((value) => onGetProfile(context,value,token));
    }

    print("profile is : ${_profile}");
    print("token is : ${_token}");
    print("email is : ${_email}");
    print("imageUrl is : ${_imageUrl}");
  }

  onGetProfile(BuildContext context,FacebookUserProfile? profile, FacebookAccessToken token) async{
    if (token.permissions.contains(FacebookPermission.email.name)) {
      plugin.getUserEmail().then((value) => onGetEmail(context,value,profile,token));
    }
  }

  onGetEmail(BuildContext context, String? value, FacebookUserProfile? profile, FacebookAccessToken token) {
    if(willUsedInLogin){
      LoginCubit.get(context).login(username: value!, password: profile!.userId);
    }else{
      SignUpCubit.get(context).signUp(
        name: profile!.name!,
        email: profile!.name!,
        username: profile!.firstName!,
        password: profile!.userId,
        mobileNumber: value??'',
      );
    }
  }
}