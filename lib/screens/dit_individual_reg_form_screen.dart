import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/screens/nav_bar_screen.dart';
import 'package:youthopia_2022_app/services/events.dart';
import 'package:youthopia_2022_app/services/supabase.dart';
import '../constants/color_theme.dart';
import '../services/users.dart';
import '../widgets/snack_bar.dart';

class DITIndividualRegFormScreen extends StatefulWidget {
  const DITIndividualRegFormScreen(
      this.event,
      {super.key});

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
  String uuid = UserProfile.currentUser!.userId;
  String id = "";

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
          padding:
          const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name',
                    style:
                    TextStyle(fontSize: 24, color: ColourTheme.white),
                  ),
                  TextFormField(
                    initialValue: name,
                    validator: (String? value) {
                      String name = value!.trim();
                      return (name.isEmpty ||
                          !RegExp(r'^[A-Za-z]+$').hasMatch(name))
                          ? 'Enter valid Name'
                          : null;
                    },
                    onChanged: (String value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      disabledBorder:  OutlineInputBorder(
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
                    'SAP ID',
                    style:
                    TextStyle(fontSize: 18, color: ColourTheme.white),
                  ),
                  TextFormField(
                    onChanged: (String value) {
                      id = value;
                    },
                    validator: (String? value) {
                      if (value!.length != 10 ||
                          !RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Enter valid Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Phone Number',
                    style:
                    TextStyle(fontSize: 18, color: ColourTheme.white),
                  ),
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
                        disabledBorder:  OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: ColourTheme.lightGrey),
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async {
                          if(_formKey.currentState!.validate()) {
                            debugPrint(id);
                            debugPrint(phone);
                            debugPrint(name);
                            debugPrint(uuid);
                            debugPrint(widget.event.eventId);

                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                                snackBarRegistrationSuccess)
                                .toString();
                            try {
                              final resParticipants = await supabase
                                  .from('events')
                                  .select('registered_participants')
                                  .eq('event_id', widget.event.eventId);

                              List participants = resParticipants[0]['registered_participants'];
                              participants.add(uuid);
                              await supabase
                                  .from('events')
                                  .update({'registered_participants' : participants})
                                  .eq('event_id', widget.event.eventId);
                              final resEvents = await supabase
                                  .from('profiles')
                                  .select('events_registered')
                                  .eq('user_id', uuid);

                              List events = resEvents[0]['events_registered'];
                              events.add(widget.event.eventId);
                              await supabase
                                  .from('profiles')
                                  .update({'events_registered' : events})
                                  .eq('user_id', uuid);

                              // final data = await supabase
                              //     .from('registrations')
                              //     .upsert({ 'event_id': widget.event.eventId,
                              //   'message': 'foo', 'username': 'supabot' });

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const NavBarScreen()),
                                    (Route<dynamic> route) => false,
                              );
                          } on PostgrestException catch (error) {
                              debugPrint(error.toString());
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                                snackBarInvalidCredentials)
                                .toString();
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20))),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(
                                ColourTheme.blue),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(
                                ColourTheme.white)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),

    );
  }
}
