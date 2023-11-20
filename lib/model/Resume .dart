import 'dart:core';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/foundation.dart';

class Resume with ChangeNotifier {
  String name;
  String surname;
  String phone;
  String city;
  String district;
  DateTime birthDate;
  String linkedinUrl;
  String githubUrl;
  String objective;
  List<Education> educationList;
  List<String> skills;
  List<Project> projects;
  List<Experience> experiences;
  List<String> references;

  Resume({
    required this.name,
    required this.surname,
    required this.phone,
    required this.city,
    required this.district,
    required this.birthDate,
    required this.linkedinUrl,
    required this.githubUrl,
    required this.objective,
    required this.educationList,
    required this.skills,
    required this.projects,
    required this.experiences,
    required this.references,
  });

  Future<void> saveAsPdf() async {
    final pdf = pw.Document();

    // Add the resume data to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Name: $name'),
              pw.Text('Surname: $surname'),
              pw.Text('Phone: $phone'),
              pw.Text('City: $city'),
              pw.Text('District: $district'),
              pw.Text('Birthdate: $birthDate'),
              pw.Text('Linkedin/Github: $linkedinUrl, $githubUrl'),
              pw.Text('Objective: $objective'),
              pw.Text('Education:'),
              for (final education in educationList)
                pw.Column(
                  children: [
                    pw.Text('- University: ${education.university}'),
                    pw.Text('- Department: ${education.department}'),
                    pw.Text('- City: ${education.city}'),
                    pw.Text('- Start Date: ${education.startDate}'),
                    pw.Text('- End Date: ${education.endDate}'),
                  ],
                ),
              pw.Text('Skills: ${skills.join(', ')}'),
              pw.Text('Projects:'),
              for (final project in projects)
                pw.Column(
                  children: [
                    pw.Text('- Title: ${project.title}'),
                    pw.Text('- Description: ${project.description}'),
                  ],
                ),
              pw.Text('Experience:'),
              for (final experience in experiences)
                pw.Column(
                  children: [
                    pw.Text('- Company: ${experience.company}'),
                    pw.Text('- Position: ${experience.position}'),
                    pw.Text('- Start Date: ${experience.startDate}'),
                    pw.Text('- End Date: ${experience.endDate}'),
                  ],
                ),
              pw.Text('References: ${references.join(', ')}'),
            ],
          );
        },
      ),
    );

    // Save the PDF file

    Directory? directory;
    if (Platform.isAndroid) {
      String folderPath = "/Download/Resume/";
      directory = Directory(folderPath);

      // Save the PDF file in the app directory
      final file = File('$directory/resumeBuilder.pdf');
      await file.writeAsBytes(await pdf.save());
    }
  }
}

class Education {
  String university;
  String department;
  String city;
  DateTime startDate;
  DateTime endDate;

  Education({
    required this.university,
    required this.department,
    required this.city,
    required this.startDate,
    required this.endDate,
  });
}

class Project {
  String title;
  String description;

  Project({
    required this.title,
    required this.description,
  });
}

class Experience {
  String company;
  String position;
  DateTime startDate;
  DateTime endDate;

  Experience({
    required this.company,
    required this.position,
    required this.startDate,
    required this.endDate,
  });
}
