import 'package:resumebuilder/pages/resume_builder_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/Resume .dart';
import 'ResumeScreen.dart';

class references_page extends ConsumerStatefulWidget {
  const references_page({Key? key}) : super(key: key);

  @override
  _references_page_State createState() => _references_page_State();
}

class _references_page_State extends ConsumerState<references_page> {
  final Map<String, dynamic> entering = {};
  final _formKey = GlobalKey<FormState>();

  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 8,
            title: const Text('References',
                style: TextStyle(color: Colors.black, fontSize: 20)),
            backgroundColor: Colors.white,
            centerTitle: true,
            toolbarHeight: 60,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20), top: Radius.circular(20)),
            ),
            actions: [
              IconButton(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                iconSize: 35,
                onPressed: () {
                  showAlertDialog(context);
                },
                icon: const Icon(Icons.home),
              ),
            ]),
        body: SafeArea(
            child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 18.0),
                children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        label: const Text('Company Name'),
                      ),
                      onChanged: (newValue) {
                        entering['companyName'] = newValue;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            label: const Text('Contact person')),
                        onChanged: (newValue) {
                          entering['contactPerson'] = newValue;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          label: const Text('Phone number')),
                      onChanged: (newValue) {
                        entering['phoneNumber'] = newValue;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          child: const Text('Create CV'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Colors.black)))),
                          onPressed: () {
                            CreateResume();
                          },
                        )),
                  ],
                ),
              )
            ])));
  }

  void CreateResume() {
    // Create a sample Resume instance
    Resume sampleResume = Resume(
      name: 'John',
      surname: 'Doe',
      phone: '1234567890',
      city: 'New York',
      district: 'Manhattan',
      birthDate: DateTime(1990, 10, 15),
      linkedinUrl: 'https://www.linkedin.com/johndoe',
      githubUrl: 'https://github.com/johndoe',
      objective: 'Seeking a challenging position in the IT industry.',
      educationList: [
        Education(
          university: 'ABC University',
          department: 'Computer Science',
          city: 'New York',
          startDate: DateTime(2010),
          endDate: DateTime(2014),
        ),
        Education(
          university: 'XYZ University',
          department: 'Business Administration',
          city: 'Los Angeles',
          startDate: DateTime(2008),
          endDate: DateTime(2012),
        ),
      ],
      skills: ['Flutter', 'Dart', 'Java', 'Python'],
      projects: [
        Project(
          title: 'Project A',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        ),
        Project(
          title: 'Project B',
          description:
              'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
      ],
      experiences: [
        Experience(
          company: 'ABC Company',
          position: 'Software Developer',
          startDate: DateTime(2014),
          endDate: DateTime(2018),
        ),
        Experience(
          company: 'XYZ Company',
          position: 'Senior Engineer',
          startDate: DateTime(2018),
          endDate: DateTime.now(),
        ),
      ],
      references: [
        'Reference 1',
        'Reference 2',
        'Reference 3',
      ],
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResumeScreen(resume: sampleResume),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        //eski bilgileri getir. !
        _goReferences(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        //değişkenlerde tutulan bilgiler silinecek !
        _goResumeBuilderPage(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: const Text(
          "Are you sure you want to exit? The information you enter will not be saved."),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _goResumeBuilderPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const resume_builder_page(title: 'Resume Builder');
    }));
  }

  void _goReferences(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const references_page();
    }));
  }
}
