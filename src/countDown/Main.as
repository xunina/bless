package countDown {

import countDown.OneButton;

import flash.display.Loader;
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.text.TextField;

public class Main extends Sprite {
    private var loader:Loader;
    private const FILE_PATH:String = "./myTextElement.swf";

    public function Main() {

        loader= new Loader();
        //加载的路径是相对于输出目录的，所以将其放在了输出目录下
        var url:URLRequest = new URLRequest(FILE_PATH);//
        loader.load(url);
        this.addChild(loader);
        loader.x = 400;
        loader.y = 400;
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
        /*按钮*/
        var oneButton:OneButton = new OneButton();
        oneButton.addEventListener(MouseEvent.CLICK,onClick);
        this.addChild(oneButton);
    }
    public function loaded(event:Event):void{
        var loadedSWF = event.target;
        var domin:ApplicationDomain =
                loadedSWF.applicationDomain as ApplicationDomain;
        var BallClass:Class = domin.getDefinition ("myTextElement") as Class; //myTextElement是as链接名
        var myTextA:MovieClip = (new BallClass()) as MovieClip;
        myTextA.x = 250,myTextA.y = 250;
        myTextA.myText.textColor = 0xFFFFFF;
        myTextA.myText.text = "159123456";
        myTextA.myText.background = true;
        myTextA.myText.backgroundColor = 0x125678;
        addChild(myTextA);
        trace(myTextA.myText.text);

        }
    public function onClick(e:MouseEvent){
        trace("dianjian");
    }


    //下面两个方法已经不再使用
    public function drawRoundRect():Shape{
        var textField:TextField = new TextField();
        textField.x = 120;
        textField.y = 110;
        textField.text="点击";
        this.addChild(textField);

        var roundRect:Shape = new Shape();
        roundRect.graphics.beginFill(0xff0000,0.5);
        roundRect.graphics.drawRoundRect(100,100,100,50,30,30);
        roundRect.graphics.endFill();
        this.addChild(roundRect);
        return roundRect;
    }
    public function loadSwf():Loader{
        var loader:Loader = new Loader();
        //加载的路径是相对于输出目录的，所以将其放在了输出目录下
        var url:URLRequest = new URLRequest(FILE_PATH);//
        loader.load(url);
        this.addChild(loader);
        loader.x = 250;
        loader.y = 250;
        return loader;
    }
}
}