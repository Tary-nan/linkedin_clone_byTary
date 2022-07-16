// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class DropdownMenu extends StatefulWidget {
//   const DropdownMenu(
//       {Key? key,
//       required this.options,
//       required this.label,
//       required this.onValidate,
//       required this.defaultOption})
//       : super(key: key);

//   final Function onValidate;
//   final String label;
//   final String? defaultOption;
//   final List<String> options;

//   @override
//   _DropdownMenuState createState() => _DropdownMenuState();
// }

// class _DropdownMenuState extends State<DropdownMenu> {
//   late String _selectedOption;
//   bool? _isValid;
//   String get _keyValue => (widget.key as ValueKey).value as String;

//   set isValid(bool isValid) {
//     _isValid = isValid;
//     widget.onValidate(_keyValue, _isValid, value: _selectedOption);
//   }

//   @override
//   void initState() {
//     super.initState();
//     _selectedOption = widget.defaultOption ?? '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isValid == null && _selectedOption.isNotEmpty) {
//       isValid = true;
//     }
//     var items = _buildMenuItems();
//     //items.forEach((i)=>print("----> ${i.value}"));

//     return Column(
//       // alignment: Alignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         DropdownButtonFormField<dynamic>(
//           key: UniqueKey(),
//           onChanged: (val) {},
//           value: _selectedOption,
//           items: items,
//           validator: _validate,
//           decoration: InputDecoration(
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//             focusedBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: ColorName.skipIn)),
//             errorBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: ColorName.skipIn)),
//             enabledBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: ColorName.skipIn)),
//             border: const OutlineInputBorder(),
//             errorStyle: const TextStyle(color: Colors.transparent),
//             helperText: '',
//             hintText: widget.label,
//             hintStyle: const TextStyle(color: Colors.black),
//           ),
//         ),
//         // const Positioned(
//         //   top: 10,
//         //   right: 15,
//         //   child: Text('▼', style: TextStyle(color: ColorName.skipIn)),
//         // ),
//         GestureDetector(
//           onTap: _showOptions,
//           child: Container(
//             width: double.infinity,
//             height: 60,
//             color: Colors.transparent,
//           ),
//         ),
//       ],
//     );
//   }

//   List<DropdownMenuItem> _buildMenuItems() {
//     var items = widget.options.map((o) {
//       return DropdownMenuItem(
//         value: o,
//         child: Text(o, style: const TextStyle(color: Colors.black)),
//       );
//     }).toList();
//     return items;
//   }

//   String? _validate(value) {
//     if (value == null) {
//       return 'there is an error';
//     } else {
//       return null;
//     }
//   }

//   void _showOptions() async {
//     _selectedOption = await Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DropdownOptions(
//             title: widget.label,
//             selectedOption: _selectedOption,
//             options: widget.options,
//           ),
//         ));
//     if (_selectedOption != null && _selectedOption.isNotEmpty) isValid = true;
//     setState(() {});
//   }
// }

// class DropdownOptions extends StatefulWidget {
//   const DropdownOptions(
//       {Key? key,
//       required this.title,
//       required this.options,
//       this.selectedOption})
//       : super(key: key);

//   final String title;
//   final List<String> options;
//   final String? selectedOption;

//   @override
//   _DropdownOptionsState createState() => _DropdownOptionsState();
// }

// class _DropdownOptionsState extends State<DropdownOptions> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   String? _selectedOption;
//   @override
//   void initState() {
//     _selectedOption = widget.selectedOption ?? '';
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Center(
//             child: Text(widget.title,
//                 style: const TextStyle(color: Colors.black))),
//         actions: <Widget>[
//           FlatButton(
//               onPressed: _sendSelectedOption,
//               child: const Text('Done', style: TextStyle(color: Colors.black)))
//         ],
//         systemOverlayStyle: SystemUiOverlayStyle.dark,
//       ),
//       backgroundColor: const Color(0xfff4f4f4),
//       body: Container(
//         decoration: const BoxDecoration(
//             border: Border(top: BorderSide(color: Colors.grey))),
//         child: Flex(
//           direction: Axis.vertical,
//           children: <Widget>[
//             Expanded(
//               child: ListView(
//                 children: <Widget>[
//                   for (String option in widget.options) _buildOption(option)
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOption(String option) {
//     return GestureDetector(
//       onTap: () => _selectOption(option),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//         decoration: const BoxDecoration(
//             color: Colors.white,
//             border: Border(bottom: BorderSide(color: Colors.grey))),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Text(option, style: const TextStyle(color: Colors.black)),
//             Icon(Icons.check,
//                 color: _selectedOption == option
//                     ? ColorName.skipIn
//                     : Colors.transparent,
//                 size: 40)
//           ],
//         ),
//       ),
//     );
//   }

//   void _sendSelectedOption() {
//     if (_selectedOption != null) {
//       if (_selectedOption!.isNotEmpty) {
//         Navigator.pop(context, _selectedOption);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Select one of the options')));
//       }
//     }
//   }

//   void _selectOption(String option) {
//     setState(() {
//       _selectedOption = option;
//     });
//   }
// }
