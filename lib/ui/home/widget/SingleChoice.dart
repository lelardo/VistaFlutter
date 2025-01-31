import 'package:flutter/material.dart';

enum InfoOptions { mainInfo, editions }

class SingleChoice extends StatelessWidget {
  final InfoOptions selectedOption;
  final ValueChanged<InfoOptions> onOptionChanged;

  const SingleChoice({
    Key? key,
    required this.selectedOption,
    required this.onOptionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<InfoOptions>(
      segments: const <ButtonSegment<InfoOptions>>[
        ButtonSegment<InfoOptions>(
          value: InfoOptions.mainInfo,
          label: Text('Información Principal'),
          icon: Icon(Icons.info),
        ),
        ButtonSegment<InfoOptions>(
          value: InfoOptions.editions,
          label: Text('Ediciones'),
          icon: Icon(Icons.edit),
        ),
      ],
      selected: <InfoOptions>{selectedOption},
      onSelectionChanged: (Set<InfoOptions> newSelection) {
        onOptionChanged(newSelection.first);
      },
    );
  }
}