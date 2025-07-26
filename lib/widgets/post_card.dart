import 'package:bartr/const/consts.dart';
import 'package:bartr/const/lists.dart';
import 'package:bartr/widgets/round_button.dart';

Widget postCard({index}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
    child: Container(
      height: 269,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 1)],
        color: fontWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // LEFT COLUMN
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(imgPCycle),
                      ),
                      8.widthBox,

                      // Name + Distance + Pending response
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                pUserName[index].text.size(14).bold.make(),
                                SizedBox(width: 10),
                                "8 km".text.size(10).color(darkFontGrey).make(),
                              ],
                            ),

                            // Pending response aligned under Sarah
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.centerLeft,
                              child:
                                  pStatus[index].text
                                      .size(8) // starting size
                                      .color(darkFontGrey)
                                      .make(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  // Image aligned with avatar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      pImages[index],
                      fit: BoxFit.fill,
                      height: 160,
                      width: 150,
                    ),
                  ),
                ],
              ),
            ),

            // RIGHT COLUMN
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(icChat),
                        Image.asset(icWorkflowAutomation),
                        Image.asset(icCircularArrow),
                      ],
                    ),
                    20.heightBox,
                    pTitle[index].text.size(12).bold.color(fontBlack).make(),
                    5.heightBox,
                    "+ 4 others".text.size(10).color(darkFontGrey).make(),
                    12.heightBox,
                    RoundButton(
                      title: "Trade",
                      titleColor: fontWhite,
                      color: fontBlue,
                      fontSize: 10.0,
                      height: 26.0,
                      enabledBorder: false,
                      ontap: () {},
                    ),
                    15.heightBox,
                    RoundButton(
                      title: "Reject",
                      titleColor: fontBlack,
                      color: fontWhite,
                      fontSize: 10.0,
                      height: 26.0,
                      enabledBorder: true,
                      ontap: () {},
                    ),
                    12.heightBox,
                    Container(
                      alignment: Alignment.centerRight,
                      width: 100,
                      height:20,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            "View Details ".text.size(8).color(fontBlack).make(),
                            Image.asset(icArrow),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
