import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/screens/nav_bar_screen.dart';
import 'package:youthopia_2022_app/services/events.dart';
import 'package:youthopia_2022_app/services/supabase.dart';
import '../constants/color_theme.dart';
import '../services/users.dart';
import '../widgets/snack_bar.dart';

class DITIndividualRegFormScreen extends StatefulWidget {
  const DITIndividualRegFormScreen(this.event, {super.key});

  final Event event;

  @override
  State<DITIndividualRegFormScreen> createState() =>
      _DITIndividualRegFormScreenState();
}

class _DITIndividualRegFormScreenState
    extends State<DITIndividualRegFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = UserProfile.currentUser!.userName;
  String phone = UserProfile.currentUser!.userPhone;
  String email = UserProfile.currentUser!.userEmail;
  String uuid = UserProfile.currentUser!.userId;
  String identity = "";
  bool isDIT =
      (UserProfile.currentUser!.userCollege == 'DIT University') ? true : false;
  String eventId = "";
  bool isProcessing = false;
  File? image;
  late final bytes;

  @override
  void initState() {
    super.initState();
    eventId = widget.event.eventId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourTheme.black,
      appBar: AppBar(
        title: Text(
          'Registration Form',
          style: TextStyle(
            color: ColourTheme.white,
          ),
        ),
        backgroundColor: ColourTheme.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 24, color: ColourTheme.white),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    initialValue: name,
                    enabled: false,
                    validator: (String? value) {
                      String name = value!.trim();
                      return (name.isEmpty ||
                              !RegExp(r'^[A-Za-z ]+$').hasMatch(name))
                          ? 'Enter valid Name'
                          : null;
                    },
                    onChanged: (String value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(15))),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    (isDIT) ? 'Student ID' : 'Aadhaar card number',
                    style: TextStyle(fontSize: 24, color: ColourTheme.white),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (String value) {
                      identity = value;
                    },
                    validator: (String? value) {
                      if (isDIT) {
                        if (value!.length != 10 ||
                            !RegExp(r'^[0-9]+$').hasMatch(value) ||
                            value.substring(0, 5) != "10000") {
                          return 'Enter valid Student ID';
                        }
                        return null;
                      } else {
                        if (value!.length != 12) {
                          return 'Enter valid Aadhaar number';
                        }
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(15))),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  (!isDIT)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Upload Identity Proof',
                              style: TextStyle(
                                  fontSize: 24, color: ColourTheme.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            (image != null)
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image(
                                          image: FileImage(image!),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  )
                                : const SizedBox(height: 0),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  gradient: ColourTheme.buttonGradient,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.5),
                                      blurRadius: 1.5,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(50)),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    onTap: () async {
                                      try {
                                        final image = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery);
                                        if (image == null) return;
                                        setState(() {
                                          this.image = File(image.path);
                                        });
                                        bytes = await image.readAsBytes();
                                      } on PlatformException {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBarPermission)
                                            .toString();
                                      }
                                    },
                                    child: const Center(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                        "Upload from Gallery",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                    ))),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  gradient: ColourTheme.buttonGradient,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.5),
                                      blurRadius: 1.5,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(50)),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    onTap: () async {
                                      try {
                                        final image = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);
                                        if (image == null) return;
                                        setState(() {
                                          this.image = File(image.path);
                                        });
                                        bytes = await image.readAsBytes();
                                      } on PlatformException {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBarPermission)
                                            .toString();
                                      }
                                    },
                                    child: const Center(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                        "Upload from Camera",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                    ))),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        )
                      : const SizedBox(
                          height: 30,
                        ),
                  Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 24, color: ColourTheme.white),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    initialValue: phone,
                    onChanged: (String value) {
                      phone = value;
                    },
                    validator: (String? value) {
                      if (value!.length != 10 ||
                          !RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Enter valid Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(15))),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    decoration: BoxDecoration(
                        gradient: ColourTheme.buttonGradient,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.5),
                            blurRadius: 1.5,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50)),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () async {
                            (isProcessing) ? null : buttonPress();
                          },
                          child: Center(
                              child: (isProcessing)
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                        "SUBMIT",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                    ))),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Future buttonPress() async {
    setState(() {
      isProcessing = true;
    });
    if (!isDIT && image == null) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarImage).toString();
      setState(() {
        isProcessing = false;
      });
    } else {
      if (_formKey.currentState!.validate()) {
        debugPrint(identity);
        debugPrint(phone);
        debugPrint(name);
        debugPrint(email);
        debugPrint(widget.event.eventId);

        String orderId = '$eventId-$identity';

        try {
          final check = await supabase
              .from('registrations')
              .select('order_id')
              .eq('order_id', orderId);
          
          final dat = await supabase
              .from('registrations')
              .select()
          .match({'participant_email': email, 'participant_name': name, 'event_id' : eventId});

          if(dat.toString() != '[]') {
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarAlreadyRegistered)
                .toString();
            setState(() {
              isProcessing = false;
            });
            return;
          }

          if (check.toString() == '[]') {
            if (!isDIT) {

              int sizeInBytes = image!.lengthSync();
              double sizeInMb = sizeInBytes/(1024 * 1024);
              if(sizeInMb > 3) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context)
                    .showSnackBar(snackBarImageTooLarge)
                    .toString();
                setState(() {
                  isProcessing = false;
                });
                return;
              } else {
                await supabase.storage
                    .from('participant-identity-proof')
                    .uploadBinary(
                  '$orderId.png',
                  bytes,
                  fileOptions: const FileOptions(contentType: 'image/png'),
                ); 
              }
            }

            await supabase.from('registrations').insert({
              'order_id': orderId,
              'event_id': eventId,
              'participant_email': email,
              'participant_name': name,
              'participant_phone': phone,
              'participant_identity': identity,
              'event_isTeamEvent': false,
              'team_name': null,
              'team_members_name': null
            });

            final resParticipants = await supabase
                .from('events')
                .select('registered_participant')
                .eq('event_id', widget.event.eventId);

            List participants = resParticipants[0]['registered_participant'];
            participants.add(orderId);
            await supabase
                .from('events')
                .update({'registered_participant': participants}).eq(
                    'event_id', widget.event.eventId);

            debugPrint("added in events");

            final resEvents = await supabase
                .from('profiles')
                .select('events_registered')
                .eq('user_id', uuid);

            List events = resEvents[0]['events_registered'];
            events.add(widget.event.eventId);
            UserProfile.currentUser!.registeredEvents = events;
            await supabase
                .from('profiles')
                .update({'events_registered': events}).eq('user_id', uuid);

            debugPrint("added in profiles");

            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarRegistrationSuccess)
                .toString();

            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => const NavBarScreen(true)),
            );
          } else {
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context)
                .showSnackBar(snackBarAlreadyRegistered)
                .toString();
          }
        } on PostgrestException catch (error) {
          debugPrint(error.toString());
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBarInvalidCredentials)
            .toString();
      }
      setState(() {
        isProcessing = false;
      });
    }
  }
}
