/**
 * Created by nina.xu on 2015/12/30.
 */
package combine {

import flash.display.Sprite;
import flash.events.MouseEvent;

public class Main extends Sprite{
    private var buttonCountDown:OneButton;
    private var timeFormatCountDown:TimeFormatCountDown;
    private var buttonAddShape:OneButton;
    private var leftTime:uint = 125;
    private var shapeTest:ShapeTest;

    public function Main() {
        initView();
    }

    private function initView(){
        buttonCountDown = new OneButton();
        this.addChild(buttonCountDown);
        buttonCountDown.addEventListener(MouseEvent.CLICK, onButtonCountDownClickHandler);

        timeFormatCountDown = new TimeFormatCountDown();
        timeFormatCountDown.y = 50;
        this.addChild(timeFormatCountDown);
        timeFormatCountDown.displayList(leftTime);

        buttonAddShape = new OneButton();
        buttonAddShape.y = 150;
        this.addChild(buttonAddShape);
        buttonAddShape.addEventListener(MouseEvent.CLICK, onButtonAddShapeClickHandler);

    }
    private function onButtonCountDownClickHandler(e:MouseEvent){
        timeFormatCountDown.init(leftTime);
    }
    private function onButtonAddShapeClickHandler(e:MouseEvent){
        shapeTest = new ShapeTest();
        var type:String;
        var col:uint;
        if(Math.random()>0.5){
            type = ShapeTest.CIRCLE;
        }else{
            type = ShapeTest.SQUARE;
        }
        col = Math.random()*1000000;
        shapeTest.countAndDraw(type,col);
        shapeTest.x = Math.random()*150+Math.random()*100;
        shapeTest.y = Math.random()*150+Math.random()*100;
        this.addChild(shapeTest);

    }



}
}
