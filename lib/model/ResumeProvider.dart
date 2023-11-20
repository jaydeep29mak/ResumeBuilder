import 'package:flutter/foundation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

import 'Resume .dart';

class ResumeProvider extends ChangeNotifier {
  Resume? _resume;

  void setResume(Resume resume) {
    _resume = resume;
    notifyListeners();
  }

  Future<void> saveAsPdf() async {
    if (_resume == null) {
      // Resume data not set
      return;
    }

    final pdf = pw.Document();

    // Add the resume data to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Name: ${_resume!.name}'),
              pw.Text('Surname: ${_resume!.surname}'),
              pw.Text('Phone: ${_resume!.phone}'),
              pw.Text('City: ${_resume!.city}'),
              pw.Text('District: ${_resume!.district}'),
              pw.Text('Birthdate: ${_resume!.birthDate}'),
              pw.Text(
                  'Linkedin/Github: ${_resume!.linkedinUrl}, ${_resume!.githubUrl}'),
              pw.Text('Objective: ${_resume!.objective}'),
              pw.Text('Education:'),
              for (final education in _resume!.educationList)
                pw.Column(
                  children: [
                    pw.Text('- University: ${education.university}'),
                    pw.Text('- Department: ${education.department}'),
                    pw.Text('- City: ${education.city}'),
                    pw.Text('- Start Date: ${education.startDate}'),
                    pw.Text('- End Date: ${education.endDate}'),
                  ],
                ),
              pw.Text('Skills: ${_resume!.skills.join(', ')}'),
              pw.Text('Projects:'),
              for (final project in _resume!.projects)
                pw.Column(
                  children: [
                    pw.Text('- Title: ${project.title}'),
                    pw.Text('- Description: ${project.description}'),
                  ],
                ),
              pw.Text('Experience:'),
              for (final experience in _resume!.experiences)
                pw.Column(
                  children: [
                    pw.Text('- Company: ${experience.company}'),
                    pw.Text('- Position: ${experience.position}'),
                    pw.Text('- Start Date: ${experience.startDate}'),
                    pw.Text('- End Date: ${experience.endDate}'),
                  ],
                ),
              pw.Text('References: ${_resume!.references.join(', ')}'),
            ],
          );
        },
      ),
    );

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
