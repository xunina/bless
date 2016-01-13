/**
 * Created by nina.xu on 2015/12/31.
 */
package combineUseStarlingAndFeathers {

import combineUseStarlingAndFeathers.time.CountDown;

import feathers.controls.Button;
import feathers.controls.text.TextFieldTextRenderer;
import feathers.core.ITextRenderer;
import feathers.skins.FunctionStyleProvider;

import flash.text.TextFormat;

import starling.display.Image;
import starling.display.Quad;

import starling.events.Event;
import starling.text.TextField;



public class MainView extends starling.display.Sprite{
    private var countDown:CountDown;

    private var mainShape:MainShape;


    private var _timeButton:Button;
    private var _shapeButton:Button;
    private var _deleteShapeArea:TextField;
    private var _resetButton:Button;

    private var _countDownTime:uint = 10;

    private static var _BUTTON_WIDTH:int = 100;//按钮纹理的宽与高
    private static var _BUTTON_HEIGHT:int = 50;

    public function MainView() {
        initButtonTheme();
        init();
    }

    private function initButtonTheme():void{
        Button.globalStyleProvider = new FunctionStyleProvider(skinButton);
    }
    private function skinButton(button:Button):void{
        button.defaultSkin = new Quad(_BUTTON_WIDTH,_BUTTON_HEIGHT,0X5555ff);
        button.downSkin = new Quad(_BUTTON_WIDTH,_BUTTON_HEIGHT,0x55ff55);
        button.labelFactory = function():ITextRenderer
        {
            return new TextFieldTextRenderer();
        };
        button.defaultLabelProperties.textFormat = new TextFormat("_sans",20,0xffffff);
    };

    private function init():void{
        displayLeft();
    }

    private function displayLeft():void{
        mainShape = new MainShape();
        mainShape.mainView = this;
        this.addChild(mainShape);

        _timeButton = new Button();
        _timeButton.y = _BUTTON_HEIGHT;
        _timeButton.label = "beg/pau";
        this.addChild(_timeButton);
        _timeButton.addEventListener(Event.TRIGGERED,onTimeButtonTriggeredHandler);

        countDown = new CountDown();
        countDown.y = _BUTTON_HEIGHT*2;//左上角留了一个高为50的位置
        countDown.displayTimeText(_countDownTime);
        this.addChild(countDown);


        _shapeButton = new Button();
        _shapeButton.y = _BUTTON_HEIGHT * 3;
        this.addChild(_shapeButton);
        _shapeButton.label = "create";
        _shapeButton.addEventListener(Event.TRIGGERED,onShapeButtonTriggeredHandler);

        _deleteShapeArea = new TextField(_BUTTON_WIDTH, _BUTTON_HEIGHT, "", "Verdana", 16, 0, true);
        _deleteShapeArea.y = _BUTTON_HEIGHT * 4;
        _deleteShapeArea.text = 0 + "";
        this.addChild(_deleteShapeArea);


        _resetButton = new Button();
        _resetButton.y = _BUTTON_HEIGHT * 5;
        this.addChild(_resetButton);
        _resetButton.label = "reset";
        _resetButton.addEventListener(Event.TRIGGERED,onResetButtonTriggeredHandler);
    }

    private function onTimeButtonTriggeredHandler(event:Event):void{
        countDown.initCountDown();
    }

    private function onShapeButtonTriggeredHandler(event:Event):void{
        mainShape.shapeController();
        addEventListener(Event.ENTER_FRAME,enterFrameHandler);
    }

    private function onResetButtonTriggeredHandler(event:Event):void{
        countDown.reset(_countDownTime);
        _deleteShapeArea.text = "0";
        mainShape.resetShape();
    }

    private function enterFrameHandler(e:Event):void{
        mainShape.shapeReduce();

    }

    public function  setdeleteShapeAreaText(text:String):void{
    _deleteShapeArea.text =text;
    }

}
}
