import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget{

  final String text;

  const CustomDropdown({Key? key, required this.text}) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>{

  late GlobalKey actionKey;
  late double height, width, xPosition, yPosition;
  bool isDropdownOpened = false;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData(){
    final context = actionKey.currentContext;
    if(context != null){
      final renderBox = context.findRenderObject();
      if(renderBox is RenderBox){
        height = renderBox.size.height;
        width = renderBox.size.width;
        Offset offset = renderBox.localToGlobal(Offset.zero);
        xPosition = offset.dx;
        yPosition = offset.dy;
        print(height);
        print(width);
        print(xPosition);
        print(yPosition);
      }else{
        print('RenderObject is not a RenderBox');
      }
    }else{
      print('Context is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: (){
        setState(() {
          findDropdownData();
          isDropdownOpened = !isDropdownOpened;
        });
      },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red.shade600
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(
                widget.text.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Kantumruy_Pro'
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              )
            ],
          ),
        )
    );
  }
}