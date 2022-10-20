import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

var snackBarSignupSuccess = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Registration Successful',
    message: 'Verify your email and login again',
    contentType: ContentType.success,
  ),
);

var snackBarLoginInvalidCredentials = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Login Failed',
    message: 'Invalid Credentials!',
    contentType: ContentType.failure,
  ),
);

var snackBarLoginEmailNotConfirm = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Login Failed',
    message: 'Verify your Email and try again',
    contentType: ContentType.failure,
  ),
);
