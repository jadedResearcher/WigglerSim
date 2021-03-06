import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart';

import '../GameShit/GameObject.dart';
import 'dart:math' as Math;

abstract class LoginHandler {

    static String LOGINLOCATION = "WIGGLERSIMLOGIN";


    static bool hasLogin() {
        return window.localStorage.containsKey(LOGINLOCATION);
    }

    static void storeLogin(String login, String password, String name, String desc, String doll ) {
        print("desc is $desc");
        //    LoginInfo(String this.login, String this.password, String this.name, String this.desc, String this.doll);
        window.localStorage[LOGINLOCATION] = new LoginInfo(login, password, name, desc, doll).toJSON();
    }

    static void clearLogin() {
        window.localStorage.remove(LOGINLOCATION);
    }

    //either who you are currently logged in as and an option to log out
    //or a form for logging in.
    static DivElement loginStatus() {
        if(hasLogin()) {
            return displayLoginDetails();
        }else {
            return displayLogin();

        }
    }

    //the controler itself will handle checking if the info is valid
    static DivElement displayLoginDetails() {
        LoginInfo yourInfo = LoginHandler.fetchLogin();
        DivElement ret = new DivElement()..text = "Greetings, ${yourInfo.login}.";
        ret.style.textAlign = "left";
        ButtonElement button = new ButtonElement()..text = "Log Out (will lose desc)";
        ret.append(button);
        button.onClick.listen((Event e) {
            clearLogin();
            window.location.href = "${window.location.href}";
        });
        return ret;
    }

    static DivElement displayLogin() {
        DivElement ret = new DivElement()..text = "Login to Sweepbook (or create a login).";
        DivElement first = new DivElement()..style.padding="10px";
        ret.append(first);
        DivElement second = new DivElement()..style.padding="10px";
        ret.append(second);
        DivElement third = new DivElement()..style.padding="10px";
        ret.append(third);

        LabelElement labelLogin = new LabelElement()..text = "Login:";
        InputElement login = new InputElement();
        first.append(labelLogin);
        first.append(login);
        LabelElement labelPW = new LabelElement()..text = "Password:";
        InputElement pw = new PasswordInputElement();
        first.append(labelPW);
        first.append(pw);

        LabelElement descLabel = new LabelElement()..text = "Description: (don't be a dick here, ppl can se it)"..style.display="block";
        TextAreaElement desc = new TextAreaElement();
        second.append(descLabel);
        second.append(desc);

        GameObject game = GameObject.instance;



        ButtonElement button = new ButtonElement()..text = "Login to Sweepbook";
        ret.append(button);
        ret.append(new DivElement()..text = "(This is required to engage with the TIMEHOLE now, by Emperial decree.)");
        ret.append(new DivElement()..text = "(WARNING: This is very simple, don't put passwords you use other places here. Also, if you forget your password you're fucked and will have to make a new login.)");

        button.onClick.listen((Event e)
        {
            storeLogin(login.value, pw.value, game.player.name, desc.value, game.player.doll.toDataBytesX());
            //when logged in should probably refresh the page.
            window.location.href = window.location.href;

        });

        return ret;

    }

    static LoginInfo fetchLogin() {
        return LoginInfo.fromJSON(window.localStorage[LOGINLOCATION]);
    }
}

class LoginInfo{
    String website = "https://plaguedoctors.herokuapp.com";
    //String website = "http://localhost:3000";
    String login;
    String password;
    String desc;
    String name;
    String doll;
    LoginInfo(String this.login, String this.password, String this.name, String this.desc, String this.doll);

    Map<String,String> toURL() {
        String breederName = name;
        breederName ??= "UNIMPORTANT";
        int nameLength = Math.max(0,Math.min(breederName.length,113));
        breederName.substring(0,nameLength);
        return {"login":login, "password":password, "desc": desc, "doll":doll, "name": breederName};
    }

    Map<String,String> toMiniURL() {
        return {"login":login, "password":password};
    }

    @override
    String toJSON() {

        String ret = jsonEncode(toURL());
        window.console.log("encoded $ret");
        return ret;
    }

    LoginInfo.fromJSON(String json){
        var tmp = jsonDecode(json);
        print("decoded is: $tmp");
        login = tmp["login"];
        password = tmp["password"];
        desc = tmp["desc"];
        doll = tmp["doll"];
        name = tmp["name"];
    }

    Future<String> confirmedInfo()async {
        //TODO send my info to the server to confirm it.
        //its a get on caretakers/caretakeridbylogin and i pass login and password. i'll get a true/false back
        //if i get a 200 back everything is good, just return 200
        //if i get anything else back return the error message
        LoginInfo yourInfo = LoginHandler.fetchLogin();
        //String url = "https://plaguedoctors.herokuapp.com/caretakers/confirmedLogin";
        String url = "$website/caretakers/confirmedLogin";
        window.console.log("going to $url");

        try {
            Response resp =   await post(url, body: yourInfo.toURL());
            return resp.body;
        }catch(error, trace) {
            return "ERROR: cannot access TIMEHOLE system. $error";
        }
    }

}

class LoadingAnimation {
    CanvasElement petCanvas;
    Element textElement;
    String text;
    bool stopPlz = false;
    int index = 0;
    static LoadingAnimation instance;
    int frameRateInMillis = 100;
    LoadingAnimation(String this.text, CanvasElement this.petCanvas, Element this.textElement) {
        loop();
        instance = this;
    }

    String getCurrentText() {
        return text.substring(0,index);
    }

    void stop() {
        try {
            //GameObject.instance.stopMusic(); why doe sthis STILL crash???
        }catch(error, trace) {
            //sometimes it tries to stop it at the same time it tries to play it and shit gets weird.
            window.console.error(error);
        }
        if(petCanvas != null)petCanvas.remove();
        textElement.remove();
        stopPlz = true;
        return;
    }

    Future<Null> loop() async{
        if(stopPlz){
            return;
        }
        await window.animationFrame;
        textElement.text = getCurrentText();
        index = (index +1)%text.length;
        new Timer(new Duration(milliseconds: frameRateInMillis), () => loop());
    }
}
