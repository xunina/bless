/**
 * Created by nina.xu on 2015/12/31.
 */
package combineUseStarlingAndFeathers {

import combineUseStarlingAndFeathers.time.CountDown;

import feathers.controls.Button;
import feathers.controls.text.TextBlockTextRenderer;
import feathers.core.ITextRenderer;

import flash.text.engine.ElementFormat;
import flash.text.engine.FontDescription;

import starling.display.Image;

import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;


public class MainView extends starling.display.Sprite{
    private var countDown:CountDown;

    private var mainShape:MainShape;


    private var _timeButton:Button;
    private var _shapeButton:Button;
    private var _deleteShapeArea:TextField;
    private var _resetButton:Button;

    private var _countDownTime:uint = 10;

    private static var _TEXTURE_WIDTH:int = 100;//按钮纹理的宽与高
    private static var TEXTURE_HEIGHT:int = 50;

    public function MainView() {
        init();
    }

    private function init():void{
        displayButton();
        displayTimeText();
    }

    private function displayTimeText():void{
        countDown = new CountDown();
        this.addChild(countDown);

        countDown.y = MainView.TEXTURE_HEIGHT*2;//左上角留了一个高为50的位置

        countDown.displayTimeText(_countDownTime);
    }
    private function displayButton():void{
        mainShape = new MainShape();
        mainShape.mainView = this;
        this.addChild(mainShape);

        _timeButton = new Button();
        _timeButton.y = TEXTURE_HEIGHT;
        var texture:Texture = Texture.fromColor(_TEXTURE_WIDTH,TEXTURE_HEIGHT,0xaaff0000);//纹理，创建某一尺寸、颜色的空纹理
        _timeButton.defaultSkin = new Image(texture);//为按钮设置默认的皮肤，，Feathers组件没有默认的皮肤
        this.addChild(_timeButton);
        _timeButton.label = "beg/pau";
        _timeButton.addEventListener(Event.TRIGGERED,onTimeButtonTriggeredHandler);
        _timeButton.labelFactory = function():ITextRenderer
        {
            var textRenderer:TextBlockTextRenderer = new TextBlockTextRenderer();
            textRenderer.styleProvider = null;
            var font:FontDescription = new FontDescription( "_sans" );
            textRenderer.elementFormat = new ElementFormat( font, 20, 0x444444 );
            return textRenderer;
        }

        _shapeButton = new Button();
        _shapeButton.y = TEXTURE_HEIGHT * 3;
        var textureTwo:Texture = Texture.fromColor(_TEXTURE_WIDTH,TEXTURE_HEIGHT,0xaa0000ff);
        _shapeButton.defaultSkin = new Image(textureTwo);
        this.addChild(_shapeButton);
        _shapeButton.label = "create";
        _shapeButton.addEventListener(Event.TRIGGERED,onShapeButtonTriggeredHandler);
        _shapeButton.labelFactory = function():ITextRenderer
        {
            var textRenderer:TextBlockTextRenderer = new TextBlockTextRenderer();
            textRenderer.styleProvider = null;
            var font:FontDescription = new FontDescription( "_sans" );
            textRenderer.elementFormat = new ElementFormat( font, 20, 0x444444 );
            return textRenderer;
        }

        _deleteShapeArea = new TextField(_TEXTURE_WIDTH, TEXTURE_HEIGHT, "", "Verdana", 16, 0, true);
        _deleteShapeArea.y = TEXTURE_HEIGHT * 4;
        _deleteShapeArea.text = 0 + "";
        this.addChild(_deleteShapeArea);


        _resetButton = new Button();
        _resetButton.y = TEXTURE_HEIGHT * 5;
        var textureThree:Texture = Texture.fromColor(_TEXTURE_WIDTH,TEXTURE_HEIGHT,0xaa00ff00);
        _resetButton.defaultSkin = new Image(textureThree);
        this.addChild(_resetButton);
        _resetButton.label = "reset";
        _resetButton.addEventListener(Event.TRIGGERED,onResetButtonTriggeredHandler);
        _resetButton.labelFactory = function():ITextRenderer//接口：处理回执文本的一般功能
        {
            var textRenderer:TextBlockTextRenderer = new TextBlockTextRenderer();//用于显示大量的文本
            textRenderer.styleProvider = null;
            var font:FontDescription = new FontDescription( "_sans" );//该类说明字体的必要信息
            //ElementFormat 类表示可应用于 ContentElement 的格式设置信息。,可以为 ContentElement 的各个子类创建特定的文本格式。
            textRenderer.elementFormat = new ElementFormat( font, 20, 0x444444 );
            return textRenderer;
        }
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
