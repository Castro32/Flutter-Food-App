import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_4/services/auth/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    
    // Check if user is logged in
    if (currentUser == null) {
      return const Scaffold(
        body: Center(
          child: Text('Please log in to view your profile'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () async {
              // Sign out functionality
              await AuthService().signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('userData')
            .doc(currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(
              child: Text('No user data found'),
            );
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                
                // Profile Icon
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // User Information Cards
                _buildInfoCard(
                  context,
                  'Name',
                  userData['userName'] ?? 'No name provided',
                  Icons.person,
                ),
                
                const SizedBox(height: 15),
                
                _buildInfoCard(
                  context,
                  'Email',
                  userData['email'] ?? currentUser.email ?? 'No email',
                  Icons.email,
                ),
                
                const SizedBox(height: 15),
                
                _buildInfoCard(
                  context,
                  'Member Since',
                  _formatDate(userData['signUpDate'] ?? currentUser.metadata.creationTime),
                  Icons.calendar_today,
                ),
                
                const SizedBox(height: 30),
                
                // Edit Profile Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to edit profile page
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: const Text('Edit Profile'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String label, String value, IconData icon) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(dynamic timestamp) {
    if (timestamp == null) return 'Unknown';
    
    try {
      DateTime date;
      if (timestamp is Timestamp) {
        date = timestamp.toDate();
      } else if (timestamp is DateTime) {
        date = timestamp;
      } else {
        return 'Unknown';
      }
      
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return 'Unknown';
    }
  }
}