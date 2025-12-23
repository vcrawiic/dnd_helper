import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/profile/profile_cubit.dart';
import 'package:dnd_helper/pages/profile/profile_state.dart';
import 'package:dnd_helper/pages/profile/image_picker/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryBG,
      appBar: AppBar(
        backgroundColor: Pallete.primaryBG,
        title: const Text('Profile'),
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Pallete.primary,
              ),
            );
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
          if (state is ProfileLoaded) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileImage(),
                    Text(
                      state.user.email ?? 'User',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'ID: ${state.user.uid}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 48),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final shouldLogout = await showDialog<bool>(
                          context: context,
                          builder: (dialogContext) => AlertDialog(
                            title: const Text('Logout'),
                            content: const Text(
                              'Are you sure you want to log out?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(dialogContext, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(dialogContext, true),
                                child: const Text('Log out'),
                              ),
                            ],
                          ),
                        );

                        if (shouldLogout == true && context.mounted) {
                          context.read<ProfileCubit>().signOut();
                        }
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text('Log out'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        backgroundColor: Pallete.primary,
                        foregroundColor: Pallete.secondaryBG,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return const Center(child: Text('Unauthorized'));
          },
        ),
      ),
    );
  }
}
