import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:started_project/core/module/dialogs.dart';
import 'package:started_project/core/theme/color.dart';
import 'package:started_project/core/utils/responsif_desain.dart';

import '../core/module/buttons.dart';
import '../core/module/cards.dart';
import '../core/module/dropdowns.dart';
import '../core/module/forms.dart';
import '../core/module/snackbars.dart';
import '../core/module/switchs.dart';

class WidgetTest extends StatelessWidget {
  const WidgetTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("GF Appbar"),
        actions: <Widget>[
          GFIconButton(
            icon: Icon(Icons.favorite, color: Colors.black),
            onPressed: () {},
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: CustomScrollView(
          slivers: [
            SliverList.list(
              children: [
                Button(
                  label: 'Test Dialog',
                  action: () {
                    showGWDialog(
                      type: GWDialogType.primary,
                      title: 'This is raised primary dialog',
                      message:
                          'First you need import component to your code. Default props can be omitted.',
                    );
                  },
                ),

                SizedBox(height: 10 * scales(context)),

                Button(
                  label: 'Test Alert',
                  action: () {
                    showSnackbar(
                      title: 'Board deleted successfully',
                      message: "'CEO Summary' has been deleted from your reports.",
                      type: AlertType.success,
                      actionText: 'Okay',
                    );
                  },
                ),

                SizedBox(height: 10 * scales(context)),

                Forms(controller: TextEditingController()),

                SizedBox(height: 10 * scales(context)),

                Cards(child: Text('card')),

                SizedBox(height: 10 * scales(context)),

                Switchs(isOn: false, action: () {}, borderColor: white),
                SizedBox(height: 10 * scales(context)),

                GSingleSelectDropdown<String>(
                  hint: 'Select category',
                  selected: null,
                  searchable: true,
                  items: [
                    GDropdownItem(value: 'science', title: 'Science 🔬'),
                    GDropdownItem(value: 'education', title: 'Education 🎓'),
                    GDropdownItem(value: 'art', title: 'Art 🎨'),
                    GDropdownItem(value: 'sport', title: 'Sport ⚽'),
                    GDropdownItem(value: 'games', title: 'Games 🎮'),
                  ],
                  onChanged: (val) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
