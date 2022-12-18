// class AdaptiveBottomSheet extends StatelessWidget {
//   final int index;
//   const AdaptiveBottomSheet({super.key, required this.index});

//   void onTapHandler() {}

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(children: [
//       ..._bottomSheetActionList
//           .map((action) => ListTile(
//                 leading: action['icon'],
//                 onTap: () {
//                   action['onTap'](index);
//                   Navigator.of(context).pop();
//                 },
//                 title: action['title'],
//               ))
//           .toList(),
//     ]);
//   }
// }