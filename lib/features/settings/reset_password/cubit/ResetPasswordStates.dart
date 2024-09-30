

import 'package:flutter/material.dart';

abstract class ResetPasswordStates{}

class ResetLoadingState extends ResetPasswordStates{}

class ResetInitialState extends ResetPasswordStates{}

class ResetDoneSuccessfully extends ResetPasswordStates{}

class ResetErrorOccured extends ResetPasswordStates{
  final String error;

  ResetErrorOccured({required this.error});
}

class ResetChangePasswordVisibility extends ResetPasswordStates{
  final IconData icon;

  ResetChangePasswordVisibility({required this.icon});
}