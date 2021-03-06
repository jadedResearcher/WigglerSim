import 'package:CommonLib/Random.dart';
import 'package:DollLibCorrect/DollRenderer.dart';
import 'dart:html';
import 'dart:async';
import 'dart:math' as Math;
import "../GameShit/GameObject.dart";
import "Troll.dart";
import 'package:LoaderLib/src/loader.dart';

class Sign {

    static String PROSPIT = "PROSPIT";
    static String DERSE = "DERSE";
    static String TIME = "TIME";
    static String BREATH = "BREATH";
    static String DOOM = "DOOM";
    static String BLOOD = "BLOOD";
    static String HEART = "HEART";
    static String SPACE = "SPACE";
    static String MIND = "MIND";
    static String LIGHT = "LIGHT";
    static String VOID = "VOID";
    static String RAGE = "RAGE";
    static String HOPE = "HOPE";
    static String LIFE = "LIFE";
    // let these come from HomestuckTrollDoll
    static String BURGUNDY = HomestuckTrollDoll.BURGUNDY;
    static String BRONZE = HomestuckTrollDoll.BRONZE;
    static String GOLD = HomestuckTrollDoll.GOLD;
    static String LIME = HomestuckTrollDoll.LIME;
    static String OLIVE = HomestuckTrollDoll.OLIVE;
    static String JADE = HomestuckTrollDoll.JADE;
    static String TEAL = HomestuckTrollDoll.TEAL;
    static String CERULEAN = HomestuckTrollDoll.CERULEAN;
    static String INDIGO = HomestuckTrollDoll.INDIGO;
    static String PURPLE = HomestuckTrollDoll.PURPLE;
    static String VIOLET = HomestuckTrollDoll.VIOLET;
    static String FUCHSIA = HomestuckTrollDoll.FUCHSIA;

    String filePath = "images/Homestuck/ZodiacCards/";
    int width = 80;
    int height = 80;

    //convinience
    static int signNumber = 1;

    //each time i make a sign just blindly add it here
    static List<Sign> allSigns = new List<Sign>();


    static int getSignByCriteria(String caste, String aspect, String lunarSway) {
        if(caste == HomestuckTrollDoll.MUTANT) caste = HomestuckTrollDoll.LIME; //all mutants given a lime sign
        if(allSigns.isEmpty) Sign.initAllSigns();
        int ret =  allSigns.where((Sign c) => c.caste == caste).where((Sign c) => c.aspect == aspect).where((Sign c) => c.lunarSway == lunarSway).first.imgNum;
       // print("My caste is $caste, my aspect is $aspect and my lunary sway is $lunarSway.  I picked sign $ret");
        return ret;
    }


    String caste;
    String lunarSway;
    String aspect;
    int imgNum;

    Sign(this.caste, this.aspect, this.lunarSway) {
        //easier than always adding by hand.
        imgNum = Sign.signNumber;
        Sign.signNumber ++;
        allSigns.add(this);
    }

    //http://hs.hiveswap.com/ezodiac/
    //http://farragofiction.com/DollSim/image_browser.html?canonsymbols=true
    static initAllSigns() {
        //pattern is, start with this castes canon aspect and moon
        //then keep moon constant till you run out of aspects (then repeat aspects in same order with other moon)
        //aspect order is canon caste order, backwards. so after time (aradia) is life (feferi), after life is hope (eridan) etc.
        new Sign(Sign.BURGUNDY, Sign.TIME, Sign.DERSE);
        new Sign(Sign.BURGUNDY, Sign.LIFE, Sign.DERSE);
        new Sign(Sign.BURGUNDY, Sign.HOPE, Sign.DERSE);
        new Sign(Sign.BURGUNDY, Sign.RAGE, Sign.DERSE);
        new Sign(Sign.BURGUNDY, Sign.VOID, Sign.DERSE);
        new Sign(Sign.BURGUNDY, Sign.LIGHT, Sign.DERSE);
        new Sign(Sign.BURGUNDY, Sign.MIND, Sign.DERSE);
        new Sign(Sign.BURGUNDY, Sign.SPACE, Sign.DERSE);
        new Sign(Sign.BURGUNDY, Sign.HEART, Sign.DERSE);
        new Sign(Sign.BURGUNDY, Sign.BLOOD, Sign.DERSE);
        new Sign(Sign.BURGUNDY, Sign.DOOM, Sign.DERSE);
        new Sign(Sign.BURGUNDY, Sign.BREATH, Sign.DERSE);
        new Sign(Sign.BURGUNDY, Sign.TIME, Sign.PROSPIT);
        new Sign(Sign.BURGUNDY, Sign.LIFE, Sign.PROSPIT);
        new Sign(Sign.BURGUNDY, Sign.HOPE, Sign.PROSPIT);
        new Sign(Sign.BURGUNDY, Sign.RAGE, Sign.PROSPIT);
        new Sign(Sign.BURGUNDY, Sign.VOID, Sign.PROSPIT);
        new Sign(Sign.BURGUNDY, Sign.LIGHT, Sign.PROSPIT);
        new Sign(Sign.BURGUNDY, Sign.MIND, Sign.PROSPIT);
        new Sign(Sign.BURGUNDY, Sign.SPACE, Sign.PROSPIT);
        new Sign(Sign.BURGUNDY, Sign.HEART, Sign.PROSPIT);
        new Sign(Sign.BURGUNDY, Sign.BLOOD, Sign.PROSPIT);
        new Sign(Sign.BURGUNDY, Sign.DOOM, Sign.PROSPIT);
        new Sign(Sign.BURGUNDY, Sign.BREATH, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.BREATH, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.TIME, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.LIFE, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.HOPE, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.RAGE, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.VOID, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.LIGHT, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.MIND, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.SPACE, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.HEART, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.BLOOD, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.DOOM, Sign.PROSPIT);
        new Sign(Sign.BRONZE, Sign.BREATH, Sign.DERSE);
        new Sign(Sign.BRONZE, Sign.TIME, Sign.DERSE);
        new Sign(Sign.BRONZE, Sign.LIFE, Sign.DERSE);
        new Sign(Sign.BRONZE, Sign.HOPE, Sign.DERSE);
        new Sign(Sign.BRONZE, Sign.RAGE, Sign.DERSE);
        new Sign(Sign.BRONZE, Sign.VOID, Sign.DERSE);
        new Sign(Sign.BRONZE, Sign.LIGHT, Sign.DERSE);
        new Sign(Sign.BRONZE, Sign.MIND, Sign.DERSE);
        new Sign(Sign.BRONZE, Sign.SPACE, Sign.DERSE);
        new Sign(Sign.BRONZE, Sign.HEART, Sign.DERSE);
        new Sign(Sign.BRONZE, Sign.BLOOD, Sign.DERSE);
        new Sign(Sign.BRONZE, Sign.DOOM, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.DOOM, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.BREATH, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.TIME, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.LIFE, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.HOPE, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.RAGE, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.VOID, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.LIGHT, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.MIND, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.SPACE, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.HEART, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.BLOOD, Sign.DERSE);
        new Sign(Sign.GOLD, Sign.DOOM, Sign.PROSPIT);
        new Sign(Sign.GOLD, Sign.BREATH, Sign.PROSPIT);
        new Sign(Sign.GOLD, Sign.TIME, Sign.PROSPIT);
        new Sign(Sign.GOLD, Sign.LIFE, Sign.PROSPIT);
        new Sign(Sign.GOLD, Sign.HOPE, Sign.PROSPIT);
        new Sign(Sign.GOLD, Sign.RAGE, Sign.PROSPIT);
        new Sign(Sign.GOLD, Sign.VOID, Sign.PROSPIT);
        new Sign(Sign.GOLD, Sign.LIGHT, Sign.PROSPIT);
        new Sign(Sign.GOLD, Sign.MIND, Sign.PROSPIT);
        new Sign(Sign.GOLD, Sign.SPACE, Sign.PROSPIT);
        new Sign(Sign.GOLD, Sign.HEART, Sign.PROSPIT);
        new Sign(Sign.GOLD, Sign.BLOOD, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.BLOOD, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.DOOM, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.BREATH, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.TIME, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.LIFE, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.HOPE, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.RAGE, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.VOID, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.LIGHT, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.MIND, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.SPACE, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.HEART, Sign.PROSPIT);
        new Sign(Sign.LIME, Sign.BLOOD, Sign.DERSE);
        new Sign(Sign.LIME, Sign.DOOM, Sign.DERSE);
        new Sign(Sign.LIME, Sign.BREATH, Sign.DERSE);
        new Sign(Sign.LIME, Sign.TIME, Sign.DERSE);
        new Sign(Sign.LIME, Sign.LIFE, Sign.DERSE);
        new Sign(Sign.LIME, Sign.HOPE, Sign.DERSE);
        new Sign(Sign.LIME, Sign.RAGE, Sign.DERSE);
        new Sign(Sign.LIME, Sign.VOID, Sign.DERSE);
        new Sign(Sign.LIME, Sign.LIGHT, Sign.DERSE);
        new Sign(Sign.LIME, Sign.MIND, Sign.DERSE);
        new Sign(Sign.LIME, Sign.SPACE, Sign.DERSE);
        new Sign(Sign.LIME, Sign.HEART, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.HEART, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.BLOOD, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.DOOM, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.BREATH, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.TIME, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.LIFE, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.HOPE, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.RAGE, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.VOID, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.LIGHT, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.MIND, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.SPACE, Sign.DERSE);
        new Sign(Sign.OLIVE, Sign.HEART, Sign.PROSPIT);
        new Sign(Sign.OLIVE, Sign.BLOOD, Sign.PROSPIT);
        new Sign(Sign.OLIVE, Sign.DOOM, Sign.PROSPIT);
        new Sign(Sign.OLIVE, Sign.BREATH, Sign.PROSPIT);
        new Sign(Sign.OLIVE, Sign.TIME, Sign.PROSPIT);
        new Sign(Sign.OLIVE, Sign.LIFE, Sign.PROSPIT);
        new Sign(Sign.OLIVE, Sign.HOPE, Sign.PROSPIT);
        new Sign(Sign.OLIVE, Sign.RAGE, Sign.PROSPIT);
        new Sign(Sign.OLIVE, Sign.VOID, Sign.PROSPIT);
        new Sign(Sign.OLIVE, Sign.LIGHT, Sign.PROSPIT);
        new Sign(Sign.OLIVE, Sign.MIND, Sign.PROSPIT);
        new Sign(Sign.OLIVE, Sign.SPACE, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.SPACE, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.HEART, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.BLOOD, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.DOOM, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.BREATH, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.TIME, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.LIFE, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.HOPE, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.RAGE, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.VOID, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.LIGHT, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.MIND, Sign.PROSPIT);
        new Sign(Sign.JADE, Sign.SPACE, Sign.DERSE);
        new Sign(Sign.JADE, Sign.HEART, Sign.DERSE);
        new Sign(Sign.JADE, Sign.BLOOD, Sign.DERSE);
        new Sign(Sign.JADE, Sign.DOOM, Sign.DERSE);
        new Sign(Sign.JADE, Sign.BREATH, Sign.DERSE);
        new Sign(Sign.JADE, Sign.TIME, Sign.DERSE);
        new Sign(Sign.JADE, Sign.LIFE, Sign.DERSE);
        new Sign(Sign.JADE, Sign.HOPE, Sign.DERSE);
        new Sign(Sign.JADE, Sign.RAGE, Sign.DERSE);
        new Sign(Sign.JADE, Sign.VOID, Sign.DERSE);
        new Sign(Sign.JADE, Sign.LIGHT, Sign.DERSE);
        new Sign(Sign.JADE, Sign.MIND, Sign.DERSE);
        new Sign(Sign.TEAL, Sign.MIND, Sign.PROSPIT);
        new Sign(Sign.TEAL, Sign.SPACE, Sign.PROSPIT);
        new Sign(Sign.TEAL, Sign.HEART, Sign.PROSPIT);
        new Sign(Sign.TEAL, Sign.BLOOD, Sign.PROSPIT);
        new Sign(Sign.TEAL, Sign.DOOM, Sign.PROSPIT);
        new Sign(Sign.TEAL, Sign.BREATH, Sign.PROSPIT);
        new Sign(Sign.TEAL, Sign.TIME, Sign.PROSPIT);
        new Sign(Sign.TEAL, Sign.LIFE, Sign.PROSPIT);
        new Sign(Sign.TEAL, Sign.HOPE, Sign.PROSPIT);
        new Sign(Sign.TEAL, Sign.RAGE, Sign.PROSPIT);
        new Sign(Sign.TEAL, Sign.VOID, Sign.PROSPIT);
        new Sign(Sign.TEAL, Sign.LIGHT, Sign.PROSPIT);
        new Sign(Sign.TEAL, Sign.MIND, Sign.DERSE);
        new Sign(Sign.TEAL, Sign.SPACE, Sign.DERSE);
        new Sign(Sign.TEAL, Sign.HEART, Sign.DERSE);
        new Sign(Sign.TEAL, Sign.BLOOD, Sign.DERSE);
        new Sign(Sign.TEAL, Sign.DOOM, Sign.DERSE);
        new Sign(Sign.TEAL, Sign.BREATH, Sign.DERSE);
        new Sign(Sign.TEAL, Sign.TIME, Sign.DERSE);
        new Sign(Sign.TEAL, Sign.LIFE, Sign.DERSE);
        new Sign(Sign.TEAL, Sign.HOPE, Sign.DERSE);
        new Sign(Sign.TEAL, Sign.RAGE, Sign.DERSE);
        new Sign(Sign.TEAL, Sign.VOID, Sign.DERSE);
        new Sign(Sign.TEAL, Sign.LIGHT, Sign.DERSE);
        new Sign(Sign.CERULEAN, Sign.LIGHT, Sign.PROSPIT);
        new Sign(Sign.CERULEAN, Sign.MIND, Sign.PROSPIT);
        new Sign(Sign.CERULEAN, Sign.SPACE, Sign.PROSPIT);
        new Sign(Sign.CERULEAN, Sign.HEART, Sign.PROSPIT);
        new Sign(Sign.CERULEAN, Sign.BLOOD, Sign.PROSPIT);
        new Sign(Sign.CERULEAN, Sign.DOOM, Sign.PROSPIT);
        new Sign(Sign.CERULEAN, Sign.BREATH, Sign.PROSPIT);
        new Sign(Sign.CERULEAN, Sign.TIME, Sign.PROSPIT);
        new Sign(Sign.CERULEAN, Sign.LIFE, Sign.PROSPIT);
        new Sign(Sign.CERULEAN, Sign.HOPE, Sign.PROSPIT);
        new Sign(Sign.CERULEAN, Sign.RAGE, Sign.PROSPIT);
        new Sign(Sign.CERULEAN, Sign.VOID, Sign.PROSPIT);
        new Sign(Sign.CERULEAN, Sign.LIGHT, Sign.DERSE);
        new Sign(Sign.CERULEAN, Sign.MIND, Sign.DERSE);
        new Sign(Sign.CERULEAN, Sign.SPACE, Sign.DERSE);
        new Sign(Sign.CERULEAN, Sign.HEART, Sign.DERSE);
        new Sign(Sign.CERULEAN, Sign.BLOOD, Sign.DERSE);
        new Sign(Sign.CERULEAN, Sign.DOOM, Sign.DERSE);
        new Sign(Sign.CERULEAN, Sign.BREATH, Sign.DERSE);
        new Sign(Sign.CERULEAN, Sign.TIME, Sign.DERSE);
        new Sign(Sign.CERULEAN, Sign.LIFE, Sign.DERSE);
        new Sign(Sign.CERULEAN, Sign.HOPE, Sign.DERSE);
        new Sign(Sign.CERULEAN, Sign.RAGE, Sign.DERSE);
        new Sign(Sign.CERULEAN, Sign.VOID, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.VOID, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.LIGHT, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.MIND, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.SPACE, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.HEART, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.BLOOD, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.DOOM, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.BREATH, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.TIME, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.LIFE, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.HOPE, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.RAGE, Sign.DERSE);
        new Sign(Sign.INDIGO, Sign.VOID, Sign.PROSPIT);
        new Sign(Sign.INDIGO, Sign.LIGHT, Sign.PROSPIT);
        new Sign(Sign.INDIGO, Sign.MIND, Sign.PROSPIT);
        new Sign(Sign.INDIGO, Sign.SPACE, Sign.PROSPIT);
        new Sign(Sign.INDIGO, Sign.HEART, Sign.PROSPIT);
        new Sign(Sign.INDIGO, Sign.BLOOD, Sign.PROSPIT);
        new Sign(Sign.INDIGO, Sign.DOOM, Sign.PROSPIT);
        new Sign(Sign.INDIGO, Sign.BREATH, Sign.PROSPIT);
        new Sign(Sign.INDIGO, Sign.TIME, Sign.PROSPIT);
        new Sign(Sign.INDIGO, Sign.LIFE, Sign.PROSPIT);
        new Sign(Sign.INDIGO, Sign.HOPE, Sign.PROSPIT);
        new Sign(Sign.INDIGO, Sign.RAGE, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.RAGE, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.VOID, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.LIGHT, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.MIND, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.SPACE, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.HEART, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.BLOOD, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.DOOM, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.BREATH, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.TIME, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.LIFE, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.HOPE, Sign.PROSPIT);
        new Sign(Sign.PURPLE, Sign.RAGE, Sign.DERSE);
        new Sign(Sign.PURPLE, Sign.VOID, Sign.DERSE);
        new Sign(Sign.PURPLE, Sign.LIGHT, Sign.DERSE);
        new Sign(Sign.PURPLE, Sign.MIND, Sign.DERSE);
        new Sign(Sign.PURPLE, Sign.SPACE, Sign.DERSE);
        new Sign(Sign.PURPLE, Sign.HEART, Sign.DERSE);
        new Sign(Sign.PURPLE, Sign.BLOOD, Sign.DERSE);
        new Sign(Sign.PURPLE, Sign.DOOM, Sign.DERSE);
        new Sign(Sign.PURPLE, Sign.BREATH, Sign.DERSE);
        new Sign(Sign.PURPLE, Sign.TIME, Sign.DERSE);
        new Sign(Sign.PURPLE, Sign.LIFE, Sign.DERSE);
        new Sign(Sign.PURPLE, Sign.HOPE, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.HOPE, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.RAGE, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.VOID, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.LIGHT, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.MIND, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.SPACE, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.HEART, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.BLOOD, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.DOOM, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.BREATH, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.TIME, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.LIFE, Sign.DERSE);
        new Sign(Sign.VIOLET, Sign.HOPE, Sign.PROSPIT);
        new Sign(Sign.VIOLET, Sign.RAGE, Sign.PROSPIT);
        new Sign(Sign.VIOLET, Sign.VOID, Sign.PROSPIT);
        new Sign(Sign.VIOLET, Sign.LIGHT, Sign.PROSPIT);
        new Sign(Sign.VIOLET, Sign.MIND, Sign.PROSPIT);
        new Sign(Sign.VIOLET, Sign.SPACE, Sign.PROSPIT);
        new Sign(Sign.VIOLET, Sign.HEART, Sign.PROSPIT);
        new Sign(Sign.VIOLET, Sign.BLOOD, Sign.PROSPIT);
        new Sign(Sign.VIOLET, Sign.DOOM, Sign.PROSPIT);
        new Sign(Sign.VIOLET, Sign.BREATH, Sign.PROSPIT);
        new Sign(Sign.VIOLET, Sign.TIME, Sign.PROSPIT);
        new Sign(Sign.VIOLET, Sign.LIFE, Sign.PROSPIT);
        new Sign(Sign.FUCHSIA, Sign.LIFE, Sign.DERSE);
        new Sign(Sign.FUCHSIA, Sign.HOPE, Sign.DERSE);
        new Sign(Sign.FUCHSIA, Sign.RAGE, Sign.DERSE);
        new Sign(Sign.FUCHSIA, Sign.VOID, Sign.DERSE);
        new Sign(Sign.FUCHSIA, Sign.LIGHT, Sign.DERSE);
        new Sign(Sign.FUCHSIA, Sign.MIND, Sign.DERSE);
        new Sign(Sign.FUCHSIA, Sign.SPACE, Sign.DERSE);
        new Sign(Sign.FUCHSIA, Sign.HEART, Sign.DERSE);
        new Sign(Sign.FUCHSIA, Sign.BLOOD, Sign.DERSE);
        new Sign(Sign.FUCHSIA, Sign.DOOM, Sign.DERSE);
        new Sign(Sign.FUCHSIA, Sign.BREATH, Sign.DERSE);
        new Sign(Sign.FUCHSIA, Sign.TIME, Sign.DERSE);
        new Sign(Sign.FUCHSIA, Sign.LIFE, Sign.PROSPIT);
        new Sign(Sign.FUCHSIA, Sign.HOPE, Sign.PROSPIT);
        new Sign(Sign.FUCHSIA, Sign.RAGE, Sign.PROSPIT);
        new Sign(Sign.FUCHSIA, Sign.VOID, Sign.PROSPIT);
        new Sign(Sign.FUCHSIA, Sign.LIGHT, Sign.PROSPIT);
        new Sign(Sign.FUCHSIA, Sign.MIND, Sign.PROSPIT);
        new Sign(Sign.FUCHSIA, Sign.SPACE, Sign.PROSPIT);
        new Sign(Sign.FUCHSIA, Sign.HEART, Sign.PROSPIT);
        new Sign(Sign.FUCHSIA, Sign.BLOOD, Sign.PROSPIT);
        new Sign(Sign.FUCHSIA, Sign.DOOM, Sign.PROSPIT);
        new Sign(Sign.FUCHSIA, Sign.BREATH, Sign.PROSPIT);
        new Sign(Sign.FUCHSIA, Sign.TIME, Sign.PROSPIT);

    }

    String addZeroes(int num, [int numDigits = 2])

    {
        String ret = "$num";
        ret = ret.padLeft(numDigits,"0");
        return ret;
    }

    @override
    String toString() {
        return "Sign: Caste: $caste, Aspect: $aspect, Moon: $lunarSway, img number: $imgNum";
    }

    static List<Sign> get completedSigns {
        List<Sign> ret = new List<Sign>();
        if(Sign.allSigns.isEmpty) Sign.initAllSigns();
        //print("getting completed signs, allSigns is ${allSigns.length}");
        for(Sign s in allSigns) {
           // print("is sign $s complete?");
            List<Object> alumniWithSign = GameObject.instance.player.petInventory.alumniWithSign(s.imgNum);
            if(alumniWithSign.isNotEmpty) {
               // print("sign $s is complete");
                ret.add(s);
            }
        }
        return ret;
    }

    static List<String> get completedCastes {
        List<String> ret = new List<String>();
        List<Sign> cache = completedSigns;
        //print("all completed signs is $cache");
        for(String caste in HomestuckTrollDoll.castes) {
            //print("have i completed $caste?");
            if(isCasteComplete(caste, cache)) ret.add(caste);
        }
        return ret;
    }

    static bool isCasteComplete(String caste, List<Sign> signs) {
        int amount = 0;
        int goal = 24;
        for(Sign s in signs) {
            if(s.caste == caste) amount ++;
        }
        //print("the number of signs for $caste i have is $amount and completed signs was ${signs.length}");
        return amount == goal;
    }

    @override
    Future<Null> draw(Element container, Element alumniContainer) async {
        //padding: 0px;
        //vertical-align: bottom;

        int index = imgNum -1;
        int firstNumInt = (index / 24).floor()+1;
        int secondNumInt = (index % 24)+1;
        String firstNum = addZeroes(firstNumInt);
        String secondNum= addZeroes(secondNumInt);
        String fileName = "sign_${firstNum}_${secondNum}.png";
        //print("$index: $fileName");
        ImageElement imageElement = await Loader.getResource(("$filePath${fileName}"));
        imageElement.style.padding = "0px";
        imageElement.style.verticalAlign = "bottom";
        imageElement.height = width;
        imageElement.width = height;
        Random rand = new Random();
        rand.nextInt();
        List<Object> alumniWithSign = GameObject.instance.player.petInventory.alumniWithSign(imgNum);
        if(alumniWithSign.length == 0) {
            imageElement.style.opacity = "0.3";
        }else {
            ImageElement imageElementBig = new ImageElement();
            imageElementBig.src = imageElement.src;

            imageElement.onClick.listen((e) {
                for (Element e in alumniContainer.children) {
                    e.remove();
                }

                alumniContainer.append(imageElementBig);

                GameObject.instance.player.petInventory.drawAlumni(alumniContainer, alumniWithSign);
               window.scrollTo(500,3500);
                print("$this clicked.");

            });
        }

        container.append(imageElement);
    }

}