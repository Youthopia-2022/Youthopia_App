import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

var snackBar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'On Snap!',
    message: 'Name is not Defined',
    contentType: ContentType.failure,
  ),
);
