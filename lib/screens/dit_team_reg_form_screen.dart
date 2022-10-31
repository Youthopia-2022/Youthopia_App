import 'package:flutter/material.dart';
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
  String leaderId = "";
  String teamName = "";
  late List members;

  @override
  void initState() {
    debugPrint(widget.event.eventMembers.toString());
    members = List.filled(widget.event.eventMembers - 1, null);
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
                              !RegExp(r'^[A-Za-z]+$').hasMatch(name))
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
                    'Leader SAP ID',
                    style: TextStyle(fontSize: 24, color: ColourTheme.white),
                  ),
                  TextFormField(
                    onChanged: (String value) {
                      leaderId = value;
                    },
                    validator: (String? value) {
                      if (value!.length != 10 ||
                          !RegExp(r'^[0-9]+$').hasMatch(value) ||
                          value.substring(0, 5) != "10000") {
                        return 'Enter valid SAP ID';
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
                    height: ((widget.event.eventMembers - 1) * 125),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.event.eventMembers - 1,
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
                                  // bool flag = false;
                                  // for(int i = 0; i < index; i++) {

                                  //   if(members[i] == null || members[i] == '') {
                                  //     flag = true ;
                                  //   }
                                  //   if(flag == true && members[i] != null)
                                  //     return 'Eeee';
                                  // }
                                  return (name.isEmpty ||
                                          !RegExp(r'^[A-Za-z]+$')
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
                  /*Text(
                        'Add Team members',
                        style: TextStyle(
                            fontSize: 18, color: ColourTheme.white),
                      ),
                      QuantityInput(
                          value: _teamMembers,
                          onChanged: (value) => setState(() => _teamMembers = int.parse(value.replaceAll(',', ''))),
                        buttonColor: ColourTheme.grey,
                        iconColor: ColourTheme.white,
                        type: QuantityInputType.int,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: ColourTheme.lightGrey),
                                  borderRadius: BorderRadius.circular(5))),

                      ),*/
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            for (int i = 0; i < members.length; i++) {
                              (members[i] == '') ? null : members[i];
                            }
                            debugPrint(teamName);
                            debugPrint(leaderName);
                            debugPrint(leaderId);
                            debugPrint(leaderPhone);
                            debugPrint(members.toString());


                            try {
                              final resParticipants = await supabase
                                  .from('events')
                                  .select('registered_participants')
                                  .eq('event_id', widget.event.eventId);

                              List participants =
                                  resParticipants[0]['registered_participants'];
                              participants.add(uuid);
                              await supabase.from('events').update({
                                'registered_participants': participants
                              }).eq('event_id', widget.event.eventId);
                              final resEvents = await supabase
                                  .from('profiles')
                                  .select('events_registered')
                                  .eq('user_id', uuid);

                              List events = resEvents[0]['events_registered'];
                              events.add(widget.event.eventId);
                              await supabase
                                  .from('profiles')
                                  .update({'events_registered': events})
                                  .eq('user_id', uuid);

                              // final data = await supabase
                              //     .from('registrations')
                              //     .upsert({ 'event_id': widget.event.eventId,
                              //   'message': 'foo', 'username': 'supabot' });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBarRegistrationSuccess)
                                  .toString();

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NavBarScreen()),
                                (Route<dynamic> route) => false,
                              );
                            } on PostgrestException catch (error) {
                              debugPrint(error.toString());
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBarInvalidCredentials)
                                .toString();
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                ColourTheme.blue),
                            foregroundColor: MaterialStateProperty.all<Color>(
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
