import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/constants/gradient_color.dart';
import 'package:youthopia_2022_app/services/events.dart';

import '../constants/color_theme.dart';
import '../services/supabase.dart';
import '../services/users.dart';
import '../widgets/snack_bar.dart';
import 'nav_bar_screen.dart';

class DITTeamRegFormScreen extends StatefulWidget {
  const DITTeamRegFormScreen(this.event, {super.key});

  final Event event;

  @override
  State<DITTeamRegFormScreen> createState() => _DITTeamRegFormScreenState();
}

class _DITTeamRegFormScreenState extends State<DITTeamRegFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String leaderName = UserProfile.currentUser!.userName;
  String leaderPhone = UserProfile.currentUser!.userPhone;
  String uuid = UserProfile.currentUser!.userId;
  String leaderEmail = UserProfile.currentUser!.userEmail;
  String leaderId = "";
  String teamName = "";
  String eventId = "";
  late List members;
  bool isDIT =
      (UserProfile.currentUser!.userCollege == 'DIT University') ? true : false;
  bool isProcessing = false;
  File? image;

  @override
  void initState() {
    eventId = widget.event.eventId;
    members = List.filled(widget.event.eventMaxMembers - 1, null);
    super.initState();
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
                  const Align(
                    alignment: Alignment.center,
                    child: GradientText(
                      'Team Details',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Team Name',
                    style: TextStyle(fontSize: 24, color: ColourTheme.white),
                  ),
                  TextFormField(
                    initialValue: teamName,
                    validator: (String? value) {
                      String name = value!.trim();
                      return (name.isEmpty) ? 'Enter valid Team Name' : null;
                    },
                    onChanged: (String value) {
                      teamName = value;
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(5))),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Leader Name',
                    style: TextStyle(fontSize: 24, color: ColourTheme.white),
                  ),
                  TextFormField(
                    initialValue: leaderName,
                    validator: (String? value) {
                      String name = value!.trim();
                      return (name.isEmpty ||
                              !RegExp(r'^[A-Za-z ]+$').hasMatch(name))
                          ? 'Enter valid Name'
                          : null;
                    },
                    onChanged: (String value) {
                      leaderName = value;
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(5))),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    (isDIT) ? 'Leader Student ID' : 'Aadhaar card number',
                    style: TextStyle(fontSize: 24, color: ColourTheme.white),
                  ),
                  TextFormField(
                    onChanged: (String value) {
                      leaderId = value;
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
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(5))),
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
                              height: 10,
                            ),
                            (image != null)? Column(
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image(
                                    image: FileImage(
                                      image!
                                    ),
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
                              height: 10,
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
                    'Leader Phone Number',
                    style: TextStyle(fontSize: 24, color: ColourTheme.white),
                  ),
                  TextFormField(
                    initialValue: leaderPhone,
                    onChanged: (String value) {
                      leaderPhone = value;
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
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(5))),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: GradientText(
                      'Member Details',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: ((widget.event.eventMaxMembers - 1) * 125),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.event.eventMaxMembers - 1,
                        itemBuilder: (BuildContext context, int index) {
                          int memNum = index + 1;
                          String labelText = "Member $memNum name";
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                labelText,
                                style: TextStyle(
                                    fontSize: 24, color: ColourTheme.white),
                              ),
                              TextFormField(
                                validator: (String? value) {
                                  String name = value!.trim();
                                  return (name.isEmpty ||
                                          !RegExp(r'^[A-Za-z ]+$')
                                              .hasMatch(name))
                                      ? (name.isEmpty)
                                          ? null
                                          : 'Enter valid Name'
                                      : null;
                                },
                                onChanged: (String value) {
                                  members[index] = value;
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: ColourTheme.lightGrey),
                                        borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: ColourTheme.lightGrey),
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          );
                        }),
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
    } else {
      if (_formKey.currentState!.validate()) {
        int memCount = 1;
        for (int i = 0; i < members.length; i++) {
          (members[i] == '') ? null : members[i];
          if(members[i] != null) memCount++;
        }
        if(memCount < widget.event.eventMinMembers) {
          setState(() {
            isProcessing = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(snackBarMinMembers).toString();
          return;
        }
        debugPrint(teamName);
        debugPrint(leaderName);
        debugPrint(leaderId);
        debugPrint(leaderPhone);
        debugPrint(members.toString());

        String orderId = '$eventId-$leaderId';

        try {
          final check = await supabase
              .from('registrations')
              .select('order_id')
              .eq('order_id', orderId);

          if (check.toString() == '[]') {
            if (!isDIT) {
              await supabase.storage
                  .from('participant-identity-proof')
                  .upload('$orderId.png', image!);
            }
            await supabase.from('registrations').insert({
              'order_id': orderId,
              'event_id': eventId,
              'participant_email': leaderEmail,
              'participant_name': leaderName,
              'participant_phone': leaderPhone,
              'participant_identity': leaderId,
              'event_isTeamEvent': true,
              'team_name': teamName,
              'team_members_name': members
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
            Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                  builder: (context) => const NavBarScreen(true)),
              (Route<dynamic> route) => false,
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
    }
    setState(() {
      isProcessing = false;
    });
  }
}
