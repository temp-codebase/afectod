import 'package:afectod/app/common/constants/afectod_colors.dart';
import 'package:afectod/app/common/extensions/custom_colors.dart';
import 'package:afectod/app/common/widgets/bottom_sheet/bottom_sheet_container.dart';
import 'package:afectod/app/common/widgets/gap/afectod_gap.dart';
import 'package:afectod/app/common/widgets/textfield/afectod_textfield.dart';
import 'package:afectod/core/helpers/border/border_helper.dart';
import 'package:afectod/core/helpers/padding/padding_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afectod/app/common/generated/l10n/app_localizations.dart';

class CreateListBottomSheet extends StatefulWidget {
  final Function(String name, String? description) onCreateList;

  const CreateListBottomSheet({super.key, required this.onCreateList});

  @override
  State<CreateListBottomSheet> createState() => _CreateListBottomSheetState();
}

class _CreateListBottomSheetState extends State<CreateListBottomSheet> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BottomSheetContainer(
        title: l10n.createListTitle,
        child: Form(
          key: _formKey,
          child: Column(
            spacing: PaddingHelper.twelve.value,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AfectodTextField(
                controller: _nameController,
                label: l10n.createListName,
                prefixIcon: CupertinoIcons.list_bullet,
                validator: (value) {
                  if (value == null || value.isEmpty) return l10n.createListNameRequired;
                  return null;
                },
              ),
              AfectodTextField(
                controller: _descriptionController,
                label: l10n.createListDescription,
                prefixIcon: CupertinoIcons.text_alignleft,
                maxLines: 3,
              ),
              AfectodGap(4),
              Row(
                spacing: PaddingHelper.twelve.value,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.router.pop(),
                      style: OutlinedButton.styleFrom(
                        padding: PaddingHelper.sixteen.onlyVertical,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderHelper.twentyFive.circular,
                        ),
                      ),
                      child: Text(
                        l10n.cancel,
                        style: TextStyle(color: context.customColors.profileTextPrimary),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _handleCreate,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AfectodColors.navyBlue,
                        foregroundColor: Colors.white,
                        padding: PaddingHelper.sixteen.onlyVertical,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderHelper.twentyFive.circular,
                        ),
                      ),
                      child: Text(l10n.create, style: const TextStyle(color: AfectodColors.white)),
                    ),
                  ),
                ],
              ),
              AfectodGap(20),
            ],
          ),
        ),
      ),
    );
  }

  void _handleCreate() {
    if (_formKey.currentState!.validate()) {
      widget.onCreateList(
        _nameController.text,
        _descriptionController.text.isEmpty ? null : _descriptionController.text,
      );
      context.router.pop();
    }
  }
}

