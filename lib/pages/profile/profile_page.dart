import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/navigation/routes.dart';
import 'package:dnd_helper/pages/profile/profile_cubit.dart';
import 'package:dnd_helper/pages/profile/profile_state.dart';
import 'package:dnd_helper/pages/profile/image_picker/profile_image.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/dung.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Pallete.transparent,
        appBar: AppBar(
          backgroundColor: Pallete.transparent,
          title: const Text(
            'Profile',
            style: TextStyle(color: Pallete.primaryWhiteText),
          ),
          actions: [
            IconButton.outlined(
              onPressed: () =>
                  context.go('${AppRoutes.profile}/${AppRoutes.characters}'),
              icon: const Icon(Icons.people_outline),
            ),
          ],
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
              if (state is ProfileInitial || state is ProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ProfileLoaded) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ProfileImage(),
                        Text(
                          state.user.email ?? 'User',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(color: Pallete.primaryWhiteText),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'ID: ${state.user.id}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Pallete.primaryWhiteTextAlpha200,
                              ),
                        ),
                        const SizedBox(height: 48),
                        LiquidContainer(
                          radius: 16,
                          child: ElevatedButton.icon(
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
                              backgroundColor: Pallete.primaryAlpha100,
                              foregroundColor: Pallete.secondaryBG,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
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
      ),
    );
  }
}
