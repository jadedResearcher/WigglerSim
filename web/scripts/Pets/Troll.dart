import "Pet.dart";
import 'package:DollLibCorrect/DollRenderer.dart';
import 'package:json_object/json_object.dart';
import 'dart:async';
import 'dart:html';



class Troll extends Pet{
    
    
    @override
    int millisecondsToChange = 1*10*60* 1000;

    //what happened to the troll now that they go off on their own?
    String epilogue;

    @override
    String type = Pet.TROLL;
    Troll(Doll doll, {health: 100, boredom: 0}) : super(doll, health: health, boredom: boredom) {
        //turns grub into troll., later will calc sign
        this.doll = Doll.convertOneDollToAnother(doll, new HomestuckTrollDoll());
        print("doll for troll is $doll");
    }

    Troll.fromJSON(String json, [JsonObject jsonObj]) : super(null){
        loadFromJSON(json, jsonObj);
        this.doll = Doll.convertOneDollToAnother(doll, new HomestuckTrollDoll());
        print("doll for troll is $doll");
        print ("loaded $name");
    }

    String getLusus() {
        HomestuckTrollDoll t = doll as HomestuckTrollDoll;
        HomestuckTrollPalette p = t.palette as HomestuckTrollPalette;
        Random rand = new Random();
        //purple bloods have 50% chance of seadweller lusi
        if(t.bloodColorToWord(p.aspect_light) == HomestuckTrollDoll.VIOLET || t.bloodColorToWord(p.aspect_light) == HomestuckTrollDoll.FUCHSIA || (t.bloodColorToWord(p.aspect_light) == HomestuckTrollDoll.PURPLE && rand.nextBool())) {
            return trollLusus();
        }else {
            return seaTrollLusus();
        }
    }

    String getCaregiverPhrase() {
        Random rand = new Random();
        List<String> badThing = <String>["threats","danger","enemies","predators","drones","other trolls","other lusii"];
        List<String> goodThing = <String>["vegetables","food","safety","water","shelter","meat","friends","self-esteem"];
        List<String> lifeSkill = <String>["fight","scavenge","hide","forage","collect","hoard resources","share","cooperate","hunt"];
        List<String> violentLifeSkill = <String>["fight","strife","kill","murder","hunt","assasinate"];


        List<String> actions1 = <String>["protected them from ${rand.pickFrom(badThing)}","made sure they got enough ${rand.pickFrom(goodThing)}","taught them how to ${rand.pickFrom(lifeSkill)}","made sure they knew how to ${rand.pickFrom(violentLifeSkill)}"];
        List<String> actions2 = <String>["trained them to ${rand.pickFrom(violentLifeSkill)} ${rand.pickFrom(badThing)}","supplied them with enough ${rand.pickFrom(goodThing)}","showed them how to avoid ${rand.pickFrom(badThing)} and find ${goodThing}"];

        if(rand.nextBool()) {
            return "${rand.pickFrom(actions2)} and ${rand.pickFrom(actions1)}";
        }else {
            return "${rand.pickFrom(actions1)} and ${rand.pickFrom(actions2)}";
        }
    }

    String trollLusus() {
        Random rand = new Random();
        List<String> firstNames = <String>["Scale","Ram","Nut","Thief","March","Feather","Slither","Claw","Tooth","Meow","Woof","Sand","Mud","Water","Hoof","Muscle","Rage","Dig","Waddle","Run"];
        List<String> lastNames = <String>["Creature","Beast","Bug"];
        return "${rand.pickFrom(firstNames)} ${rand.pickFrom(lastNames)}";
    }

    String seaTrollLusus() {
        Random rand = new Random();
        List<String> firstNames = <String>["Swim", "Zap","Cuttle","Fin","Sea","Tentacle","Mud","Waddle","Water","Lake","Ocean","River","Swamp","Waterfall","Horror","Depth"];
        List<String> optionalSecondNames = <String>["Scale","Ram","Nut","Thief","March","Feather","Slither","Claw","Tooth","Meow","Woof","Sand","Mud","Water","Hoof","Muscle","Rage","Dig","Waddle","Run"];

        List<String> lastNames = <String>["Creature","Beast","Bug","Terror"];
        if(rand.nextBool()) {
            return "${rand.pickFrom(firstNames)} ${rand.pickFrom(optionalSecondNames)} ${rand.pickFrom(lastNames)}";

        }else {
            return "${rand.pickFrom(firstNames)} ${rand.pickFrom(lastNames)}";
        }
    }

    String getBegining() {
        String lusus = getLusus();
        String lususCaregivingThing = getCaregiverPhrase();
        return "${name} was taken in by a ${lusus} Lusus, who ${lususCaregivingThing}. ";
    }

    String getEnding() {
        Random rand = new Random();
        HomestuckTrollDoll t = doll as HomestuckTrollDoll;
        HomestuckTrollPalette p = t.palette as HomestuckTrollPalette;
        String colorWord = t.bloodColorToWord(p.aspect_light);
        int min = getMinNumberOfSweepsExpected(colorWord);
        int max = getMaxNumberOfSweepsExpected(colorWord);
        int lifeSpan =  rand.nextInt(max - min) + min;
        int numberOfSweeps = lifeSpan;
        //TODO use stats to decide if they die early.
        String causeOfDeath = "It was a natural death.";
        return "They died after living ${numberOfSweeps} sweeps. ${causeOfDeath}";

    }

    //http://zetasession.proboards.com/thread/270/blood-caste-lifespans
    int getMinNumberOfSweepsExpected(String colorWord) {
        if(colorWord == HomestuckTrollDoll.BURGUNDY) return 12;
        if(colorWord == HomestuckTrollDoll.BRONZE) return 14;
        if(colorWord == HomestuckTrollDoll.GOLD) return 20;
        if(colorWord == HomestuckTrollDoll.LIME) return 30;
        if(colorWord == HomestuckTrollDoll.OLIVE) return 50;
        if(colorWord == HomestuckTrollDoll.JADE) return 90;
        if(colorWord == HomestuckTrollDoll.TEAL) return 130;
        if(colorWord == HomestuckTrollDoll.CERULEAN) return 400;
        if(colorWord == HomestuckTrollDoll.INDIGO) return 600;
        if(colorWord == HomestuckTrollDoll.PURPLE) return 700;
        if(colorWord == HomestuckTrollDoll.VIOLET) return 4000;
        if(colorWord == HomestuckTrollDoll.FUCHSIA) return 6000;
        return 1;
    }

    //http://zetasession.proboards.com/thread/270/blood-caste-lifespans
    int getMaxNumberOfSweepsExpected(String colorWord) {
        if(colorWord == HomestuckTrollDoll.BURGUNDY) return 24;
        if(colorWord == HomestuckTrollDoll.BRONZE) return 34;
        if(colorWord == HomestuckTrollDoll.GOLD) return 40;
        if(colorWord == HomestuckTrollDoll.LIME) return 60;
        if(colorWord == HomestuckTrollDoll.OLIVE) return 70;
        if(colorWord == HomestuckTrollDoll.JADE) return 100;
        if(colorWord == HomestuckTrollDoll.TEAL) return 150;
        if(colorWord == HomestuckTrollDoll.CERULEAN) return 500;
        if(colorWord == HomestuckTrollDoll.INDIGO) return 800;
        if(colorWord == HomestuckTrollDoll.PURPLE) return 900;
        if(colorWord == HomestuckTrollDoll.VIOLET) return 5000;
        if(colorWord == HomestuckTrollDoll.FUCHSIA) return 8000;
        return 10;
    }

    void createEpilogue() {
        epilogue = "You have a vision of the future: \n\n";

        String begining = getBegining();
        String middle = "Their life was uneventful"; //populate later from stats
        String end = getEnding();
        /*
            Brainstorming epilogue format. 
            Begining, middle, end. 
            You have a vision of the future: 
            NAME was taken in by a LUSUSTYPE Lusus, who <lusus caregiving thing>. 
            Their life was uneventful. (no stat shit yet)
            They died after living (number of sweeps in range for caste, less if they have violent stats) sweeps.
         */
        epilogue  += "${begining}\n\n${middle}\n\n${end}";
    }

    @override
    Future<CanvasElement> drawStats() async {
        if(epilogue == null) createEpilogue();
        //never cache
        CanvasElement textCanvas = new CanvasElement(width: textWidth, height: textHeight);
        textCanvas.context2D.fillStyle = "#d2ac7c";
        textCanvas.context2D.strokeStyle = "#2c1900";
        textCanvas.context2D.lineWidth = 3;


        textCanvas.context2D.fillRect(0, 0, width, textHeight);
        textCanvas.context2D.strokeRect(0, 0, width, textHeight);

        textCanvas.context2D.fillStyle = "#2c1900";

        int fontSize = 20;
        textCanvas.context2D.font = "${fontSize}px Strife";
        int y = 330;
        int x = 10;
        Renderer.wrap_text(textCanvas.context2D,name,x,y,fontSize,400,"center");

        y = y + fontSize*2;
        fontSize = 12;

        int buffer = 10;
        y = y + fontSize+buffer;
        Renderer.wrap_text(textCanvas.context2D,epilogue,x,y,fontSize,400,"left");

        return textCanvas;
    }
}