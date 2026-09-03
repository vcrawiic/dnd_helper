import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/list/character_list_cubit.dart';
import 'package:dnd_helper/pages/char_sheet/list/character_list_state.dart';
import 'package:dnd_helper/pages/navigation/routes.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:dnd_helper/widgets/max_width_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
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
            'My Characters',
            style: TextStyle(color: Pallete.primaryWhiteText),
          ),
          actions: [
            IconButton.outlined(
              onPressed: () => _createCharacter(context),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: BlocConsumer<CharacterListCubit, CharacterListState>(
          listener: (context, state) {
            if (state is CharacterListError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Pallete.primary,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is CharacterListLoading ||
                state is CharacterListInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CharacterListLoaded) {
              if (state.characters.isEmpty) {
                return Center(
                  child: Text(
                    'No characters yet.\nTap + to create one.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Pallete.primaryWhiteTextAlpha200,
                    ),
                  ),
                );
              }

              return MaxWidthContent(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.characters.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final char = state.characters[index];
                    return LiquidContainer(
                      radius: 16,
                      child: ListTile(
                        onTap: () async {
                          final cubit = context.read<CharacterListCubit>();
                          await context.push(
                            '${AppRoutes.characters}/${AppRoutes.charSheet}/${char.id}',
                          );
                          // Список остаётся смонтированным под листом персонажа,
                          // поэтому после возврата перечитываем данные вручную —
                          // иначе правки видны только после hot restart.
                          await cubit.load();
                        },
                        title: Text(
                          char.name.isEmpty ? 'Unnamed' : char.name,
                          style: const TextStyle(
                            color: Pallete.primaryWhiteText,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          '${char.race} ${char.characterClass} · lvl ${char.level} · HP ${char.hpCurrent}/${char.hpMax}',
                          style: const TextStyle(
                            color: Pallete.primaryWhiteText,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Pallete.primaryWhiteText,
                          ),
                          onPressed: () => _confirmDelete(context, char.id),
                        ),
                      ),
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Future<void> _createCharacter(BuildContext context) async {
    final cubit = context.read<CharacterListCubit>();
    final id = await cubit.create();
    if (id != null && context.mounted) {
      await context.push('${AppRoutes.characters}/${AppRoutes.charSheet}/$id');
      // Обновляем список после возврата с листа только что созданного персонажа.
      await cubit.load();
    }
  }

  Future<void> _confirmDelete(BuildContext context, int id) async {
    final cubit = context.read<CharacterListCubit>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete character'),
        content: const Text('Are you sure? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await cubit.remove(id);
    }
  }
}
