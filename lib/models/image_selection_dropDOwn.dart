class SelectionOption{
  late String title;
  late String selectiontype;

  SelectionOption(
      this.title,
      this.selectiontype
      );

}
final List<SelectionOption> selectionOption = <SelectionOption>[
  SelectionOption('Prescription', 'Prescription'),
  SelectionOption('Report', 'Report'),

];


class ImageSelectionOption{

  late String selection;


  ImageSelectionOption({

    required this.selection
  });
}
