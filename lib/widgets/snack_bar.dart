import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

var snackBarSignupSuccess = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Success !! ',
    message: 'Verify your email and login again',
    contentType: ContentType.success,
  ),
);

var snackBarEmailExists = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Error !! ',
    message: 'This Email already exists! ',
    contentType: ContentType.failure,
  ),
);

var snackBarNoInternet = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Oh No!',
    message: '  ⚡  Please Check your Internet Connection and Try Again',
    contentType: ContentType.failure,
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

var snackBarInvalidCredentials = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Oh Uh!',
    message: 'Invalid Credentials!',
    contentType: ContentType.failure,
  ),
);

var snackBarRegistrationSuccess = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Success!',
    message: 'Successfully registered!',
    contentType: ContentType.success,
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
