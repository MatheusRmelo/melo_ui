import 'package:flutter/material.dart';
import 'package:melo_ui/src/widgets/form_fields/meloui_text_field.dart';

class MeloUIAppContainer extends StatefulWidget {
  const MeloUIAppContainer(
      {super.key, required this.child, this.searchController, this.onSearch});
  final Widget child;
  final TextEditingController? searchController;
  final void Function(String search)? onSearch;

  @override
  State<MeloUIAppContainer> createState() => _MeloUIAppContainerState();
}

class _MeloUIAppContainerState extends State<MeloUIAppContainer> {
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
                controller: widget.searchController,
                suffixIcon: IconButton(
                    onPressed: widget.onSearch == null &&
                            widget.searchController == null
                        ? null
                        : () {
                            widget.onSearch!(widget.searchController!.text);
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
