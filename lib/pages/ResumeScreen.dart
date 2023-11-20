import 'package:flutter/material.dart';

import '../model/Resume .dart';

class ResumeScreen extends StatelessWidget {
  final Resume resume;

  const ResumeScreen({required this.resume});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            elevation: 8,
            title: const Text('Resume',
                style: TextStyle(color: Colors.black, fontSize: 20)),
            backgroundColor: Colors.white,
            centerTitle: true,
            toolbarHeight: 60,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20), top: Radius.circular(20)),
            ),
          ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${resume.name} ${resume.surname}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Phone: ${resume.phone}'),
            Text('Location: ${resume.city}, ${resume.district}'),
            Text('Birthdate: ${resume.birthDate.toString()}'),
            SizedBox(height: 16),
            Text('LinkedIn: ${resume.linkedinUrl}'),
            Text('GitHub: ${resume.githubUrl}'),
            SizedBox(height: 16),
            Text(
              'Objective',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(resume.objective),
            SizedBox(height: 16),
            Text(
              'Education',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: resume.educationList.map((education) {
                return ListTile(
                  title: Text('${education.university}, ${education.city}'),
                  subtitle: Text(
                      '${education.department} | ${education.startDate.year}-${education.endDate.year}'),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Skills',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8,
              children: resume.skills
                  .map((skill) => Chip(
                        label: Text(skill),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: resume.projects.map((project) {
                return ListTile(
                  title: Text(project.title),
                  subtitle: Text(project.description),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Experience',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: resume.experiences.map((experience) {
                return ListTile(
                  title: Text('${experience.company}, ${experience.position}'),
                  subtitle: Text(
                      '${experience.startDate.year}-${experience.endDate.year}'),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'References',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: resume.references
                  .map((reference) => Text(reference))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
