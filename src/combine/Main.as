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
    private var leftTime:uint = 125;//计时器倒计时的秒数
    private var shapeTest:ShapeTest;

    public function Main() {
        initView();
    }

    private function initView(){
        buttonCountDown = new OneButton();
        this.addChild(buttonCountDown);
        buttonCountDown.addEventListener(MouseEvent.CLICK, onButtonCountDownClickHandler);

        timeFormatCountDown = new TimeFormatCountDown();
        timeFormatCountDown.y = buttonCountDown.height;//紧邻buttonCountDo
        this.addChild(timeFormatCountDown);
        timeFormatCountDown.displayList(leftTime);

        buttonAddShape = new OneButton();
        buttonAddShape.y = buttonCountDown.height + timeFormatCountDown.height;//紧邻timeFormatCountDown
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
        setShapeTestXY();

        this.addChild(shapeTest);
    }
    public function setShapeTestXY(){
        shapeTest.x = Math.random()*OneButton.ONE_BUTTON_WIDTH+Math.random()+OneButton.ONE_BUTTON_HEIGHT;
        shapeTest.y = OneButton.ONE_BUTTON_WIDTH+Math.random()*OneButton.ONE_BUTTON_WIDTH;
    }


}
}
