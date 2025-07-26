import 'package:bartr/const/consts.dart';

class RoundButton extends StatelessWidget {
   RoundButton({
    super.key,
    required this.title,
    this.titleColor,
    this.height,
    this.width,
    this.fontSize,
    this.color,
    required this.enabledBorder,
    required this.ontap,
  });
  final String title;
  final Color? titleColor;
  final VoidCallback ontap;
  final height;
  final width;
  final fontSize;
  final color;
  bool enabledBorder = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
           border: enabledBorder ? Border.all(width: 1) :  Border.all(width: 0)),

        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
