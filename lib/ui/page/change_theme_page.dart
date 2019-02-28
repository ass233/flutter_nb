import 'package:flutter/material.dart';
import 'package:flutter_nb/constants/constants.dart';
import 'package:flutter_nb/resource/colors.dart';
import 'package:flutter_nb/ui/page/base/app_state.dart';
import 'package:flutter_nb/ui/widget/more_widgets.dart';
import 'package:flutter_nb/utils/device_util.dart';
import 'package:flutter_nb/utils/interact_vative.dart';
import 'package:flutter_nb/utils/object_util.dart';
import 'package:flutter_nb/utils/sp_util.dart';

/*
* 改变主题
*/
class ChangeThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    DeviceUtil.setBarStatus(true);
    return new ChangeTheme();
  }
}

class ChangeTheme extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ChangeThemeState();
  }
}

class _ChangeThemeState extends AppState<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        theme: ThemeData(
            primaryColor: ObjectUtil.getThemeColor(),
            platform: TargetPlatform.iOS),
        home: new Scaffold(
          backgroundColor: Colors.white,
          primary: true,
          body: SafeArea(
              child: ListView(
            children: <Widget>[
              new Wrap(
                children: themeSwatchColorMap.keys.map((String key) {
                  Color value = themeSwatchColorMap[key];
                  return new InkWell(
                    onTap: () {
                      SPUtil.putString(Constants.KET_THEME_COLOR, key);
                      InteractNative.getAppEventSink()
                          .add(InteractNative.RESET_THEME_COLOR);
                    },
                    child: new Container(
                      margin: EdgeInsets.all(15.0),
                      width: 36.0,
                      height: 36.0,
                      color: value,
                    ),
                  );
                }).toList(),
              )
            ],
          )),
          appBar: MoreWidgets.buildAppBar(
            context,
            '切换主题',
            centerTitle: true,
            elevation: 2.0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ));
  }
}
