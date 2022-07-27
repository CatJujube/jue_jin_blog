import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jue_jin_blog/bean/UserBean.dart';
import 'package:jue_jin_blog/nav/NavUtils.dart';
import 'package:jue_jin_blog/pages/setting_pages/InfoModifyPage.dart';
import 'package:jue_jin_blog/res/color/BColors.dart';
import 'package:jue_jin_blog/res/color/BFontSize.dart';
import 'package:jue_jin_blog/res/color/BMargin.dart';
import 'package:jue_jin_blog/res/color/BSize.dart';
import 'package:jue_jin_blog/widget/EasyAvator.dart';
import 'package:jue_jin_blog/widget/EasyButton.dart';
import 'package:jue_jin_blog/widget/EasyCell.dart';
import 'package:jue_jin_blog/widget/EasyTopBar.dart';
import "package:image_picker/image_picker.dart";
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class EditInfoPage extends StatefulWidget {
  EditInfoPage(this._userBean,{Key? key}) : super(key: key);

  UserBean? _userBean;

  @override
  _EditInfoPageState createState() => _EditInfoPageState();
}

class _EditInfoPageState extends State<EditInfoPage> {
  bool saveButtonEnabel = false;

  Image? imageFile = null;

  @override
  void initState() {
    imageFile = Image.network(widget._userBean?.headerUrl ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasyTopBar.commonAppBar(context,"编辑资料",[]),
      backgroundColor: BColors.COMMON_GREY_BG_COLOR,
      body: pageBody(),
    );
  }

  Widget pageBody(){
    return Container(
      child: IntrinsicHeight(
        child: Column(
          children: wigetList(),
        ),
      )
    );
  }

  List<Widget> wigetList(){
    List<Widget> retList = [];
    retList.add(
      Container(
        margin: EdgeInsets.only(top: 16,bottom: 16),
        color: Colors.white,
        child: InkWell(
          child: Container(
            margin: BMargin.COMMON_LEFT_RIGHT_MARGIN,
            height: 72,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("头像",style: TextStyle(fontSize: BFontSize.FONT_SIZE_NORMAL),maxLines: 1,overflow: TextOverflow.ellipsis,),
                ),
                Flexible(fit:FlexFit.tight,child: SizedBox()),
                Align(
                  alignment: Alignment.centerLeft,
                  child: EasyAvator.circleAvator(imageFile)


                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: arrow(),
                ),
              ],
            ),
          ),
          onTap: () async{
            // getImage();
            var file = await getWechatImage();
            setState(() {
              if(file!=null){
                imageFile =  Image.file(file,fit: BoxFit.cover,);
              }
            });
          },
        )
      )
    );
    retList.add(
      EasyCell(leftText: "用户名",rightText: widget._userBean?.userName,onTap: () async {
        var result = await NavUtils.navToWithStringResult(context, InfoModifyPage("用户名", widget._userBean?.userName));
            if(result.isNotEmpty == true){
              widget._userBean?.userName = result;
              modifyUserBean(widget._userBean);
            }
      })
    );
    retList.add(
        EasyCell(leftText: "职位",rightText: widget._userBean?.userName)
    );
    retList.add(
        EasyCell(leftText: "公司",rightText: widget._userBean?.userName)
    );
    retList.add(
        EasyCell(leftText: "简介",rightText: widget._userBean?.userName)
    );
    retList.add(
        EasyCell(leftText: "博客地址",rightText: widget._userBean?.headerUrl)
    );
    retList.add(
      Container(
          margin: EdgeInsets.only(left: BSize.COMMON_LEFT_SPAN,right: BSize.COMMON_RIGHT_SPAN,top: 20),
          child:       EasyButton("保存", (){},backgroundColor: Colors.blueAccent,enable: saveButtonEnabel,)
      )
    );
    return retList;
  }

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    // // // Pick an image
    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // // Capture a photo
    // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    // // Pick a video
    // final XFile? image = await _picker.pickVideo(source: ImageSource.gallery);
    // // Capture a video
    // final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    // Pick multiple images
    final List<XFile>? images = await _picker.pickMultiImage();
    return images;
  }

  Future<File?> getWechatImage() async{
    AssetPickerConfig config = AssetPickerConfig(maxAssets: 1);
    final List<AssetEntity>? result = await AssetPicker.pickAssets(context,pickerConfig: config);
    if(result!= null && result.length > 0){
      File? file = (await result[0].file) as File?;
      return file;
    }
    return null;
  }

  void modifyUserBean(UserBean? userBean){
    setState(() {
      widget._userBean = userBean;
      saveButtonEnabel = true;
    });
  }

  Widget arrow(){
      return Container(
          margin: EdgeInsets.only(left: 8),
          child:  Icon(Icons.keyboard_arrow_right_rounded,size: BSize.COMMON_BACK_ICON_SIZE)
      );
  }
}
