import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'],
      phoneNumber: map['phoneNumber'],
    );
  }

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source));
}

Future<void> saveContact(Contact contact) async {
  final prefs = await SharedPreferences.getInstance();
  final contactsJson = prefs.getStringList('contacts') ?? [];
  contactsJson.add(contact.toJson());
  await prefs.setStringList('contacts', contactsJson);
}

Future<List<Contact>> getContacts() async {
  final prefs = await SharedPreferences.getInstance();
  final contactsJson = prefs.getStringList('contacts') ?? [];
  return contactsJson.map((json) => Contact.fromJson(json)).toList();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/addContact': (context) => AddContactPage(),
        '/contactDetail': (context) => ContactDetailPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Contact>> _contactsFuture;

  @override
  void initState() {
    super.initState();
    _contactsFuture = getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        future: _contactsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final contacts = snapshot.data!;
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  title: Text(contact.name),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/contactDetail',
                      arguments: contact,
                    );
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addContact');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final name = _nameController.text;
                final phoneNumber = _phoneNumberController.text;
                final newContact = Contact(
                  name: name,
                  phoneNumber: phoneNumber,
                );
                await saveContact(newContact);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}

class ContactDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Contact? contact = ModalRoute.of(context)!.settings.arguments as Contact?;
    if (contact == null) {
      // Handle the case when contact is null, such as displaying an error message or navigating back
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error: Contact not found'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${contact.name}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8.0),
            Text(
              'Phone Number: ${contact.phoneNumber}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}