import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';
import '../constants/color_theme.dart';
import '../constants/gradient_color.dart';

class DITRegistrationForm extends StatefulWidget {

  const DITRegistrationForm(
      this.isTeamEvent,
      {super.key});

  final bool isTeamEvent;


  @override
  State<DITRegistrationForm> createState() => _DITRegistrationFormState();
}

class _DITRegistrationFormState extends State<DITRegistrationForm>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    debugPrint(widget.isTeamEvent.toString());
    setState(() {
      _tabController = TabController(length: 2, vsync: this, initialIndex:(widget.isTeamEvent)? 0:1);
      _tabController.addListener(onTap);
    });
  }

  List<bool> _isDisabled = [true, false];

  final List<Tab> tabs = <Tab>[
    const Tab(
      child: GradientText('Team',
          //gradient: ColourTheme.primaryGradient,
          style: TextStyle(fontSize: 20)),
    ),
    const Tab(
      child: GradientText('Individual',
          //gradient: ColourTheme.primaryGradient,
          style: TextStyle(fontSize: 20)),
    ),
  ];

  onTap() {
      int index = _tabController.previousIndex;
      setState(() {
        _tabController.index = index;
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          bottom: TabBar(
              controller: _tabController,
              indicatorColor: ColourTheme.pink,
              tabs: tabs),
        ),
        body:  TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: <Widget>[
                ListView(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Form(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Team Name',
                          style:
                              TextStyle(fontSize: 18, color: ColourTheme.white),
                        ),
                        TextFormField(
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
                          'Team Leader\'s Name',
                          style:
                              TextStyle(fontSize: 18, color: ColourTheme.white),
                        ),
                        TextFormField(
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
                          'Team Leader\'s SAP ID',
                          style:
                              TextStyle(fontSize: 18, color: ColourTheme.white),
                        ),
                        TextFormField(
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
                          'Team Leader\'s Phone Number',
                          style:
                              TextStyle(fontSize: 18, color: ColourTheme.white),
                        ),
                        TextFormField(
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
                          'Team Member 1 Name',
                          style:
                              TextStyle(fontSize: 18, color: ColourTheme.white),
                        ),
                        TextFormField(
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
                          'Team Member 1 SAP ID',
                          style:
                              TextStyle(fontSize: 18, color: ColourTheme.white),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: ColourTheme.lightGrey),
                                  borderRadius: BorderRadius.circular(5))),
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
                              onPressed: () {},
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                ]),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Name',
                        style:
                            TextStyle(fontSize: 18, color: ColourTheme.white),
                      ),
                      TextFormField(
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
                        'SAP ID',
                        style:
                            TextStyle(fontSize: 18, color: ColourTheme.white),
                      ),
                      TextFormField(
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
                        decoration: InputDecoration(
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
                            onPressed: () {},
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
                )
              ]));
  }
}
