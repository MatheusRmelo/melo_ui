import 'package:flutter/material.dart';
import 'package:melo_ui/src/widgets/containers/meloui_table_container.dart';
import 'package:melo_ui/src/widgets/meloui_button.dart';
import 'package:melo_ui/src/widgets/meloui_text_field.dart';

class MeloUIAppContainer extends StatefulWidget {
  const MeloUIAppContainer({super.key, required this.child, this.onSearch});
  final Widget child;
  final void Function(String search)? onSearch;

  @override
  State<MeloUIAppContainer> createState() => _MeloUIAppContainerState();
}

class _MeloUIAppContainerState extends State<MeloUIAppContainer> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: MeloUITextField(
                label: 'Pesquise',
                placeholder: 'Digite sua busca',
                controller: searchController,
                suffixIcon: IconButton(
                    onPressed: widget.onSearch == null
                        ? null
                        : () {
                            widget.onSearch!(searchController.text);
                          },
                    icon: const Icon(Icons.search_rounded)),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            //Expanded(child: Align(child: Text('PROFILE')))
          ],
        ),
        Expanded(child: widget.child)
      ]),
    );
  }
}
