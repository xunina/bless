/**
 * Created by nina.xu on 2015/12/31.
 */
package combineUseStarlingAndFeathers {
import feathers.controls.Button;
import feathers.controls.text.TextBlockTextRenderer;
import feathers.core.ITextRenderer;

import flash.display.BitmapData;

import flash.display.Sprite;

import flash.events.TimerEvent;
import flash.text.engine.ElementFormat;
import flash.text.engine.FontDescription;

import flash.utils.Timer;


import starling.display.Image;

import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;


public class MainView extends starling.display.Sprite{
    private var _timeButton:Button;
    private var _shapeButton:Button;

    private var _countDownText:TextField;
    private var _formatCountDownText:TextField;

    private var _myTimer:Timer;
    private var _countDownTime:uint = 10;

    private var TEXT_WIDTH = 100;
    private var TEXT_HEIGHT = 25;
    internal static var TEXTURE_WIDTH:int = 100;//按钮纹理的宽与高
    internal static var TEXTURE_HEIGHT:int = 50;

    private static var area:Number = 0;

    public function MainView() {
        init();
    }
    private function init(){
        displayButton();
        displayTimeText(_countDownTime);




    }
    private function displayButton(){
        _timeButton = new Button();
        _timeButton.y = TEXTURE_HEIGHT;
        var texture:Texture = Texture.fromColor(TEXTURE_WIDTH,TEXTURE_HEIGHT,0xaaff0000);//纹理，创建某一尺寸、颜色的空纹理
        _timeButton.defaultSkin = new Image(texture);//为按钮设置默认的皮肤，，Feathers组件没有默认的皮肤
        this.addChild(_timeButton);
        _timeButton.label = "begin/pause";
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
        _shapeButton.y = TEXTURE_HEIGHT + TEXTURE_WIDTH;
        var textureTwo:Texture = Texture.fromColor(TEXTURE_WIDTH,TEXTURE_HEIGHT,0xaa0000ff);
        _shapeButton.defaultSkin = new Image(textureTwo);
        this.addChild(_shapeButton);
        _shapeButton.label = "create shape";
        _shapeButton.addEventListener(Event.TRIGGERED,onShapeButtonTriggeredHandler);
        _shapeButton.labelFactory = function():ITextRenderer
        {
            var textRenderer:TextBlockTextRenderer = new TextBlockTextRenderer();
            textRenderer.styleProvider = null;
            var font:FontDescription = new FontDescription( "_sans" );
            textRenderer.elementFormat = new ElementFormat( font, 20, 0x444444 );
            return textRenderer;
        }
    }

    private function onTimeButtonTriggeredHandler(event:Event):void{
        initCountDown();
    }
    private function onShapeButtonTriggeredHandler(event:Event):void{
        ShapeImage();
    }

    //如何实现重置
    //请封装
    private function ShapeImage()
    {
        //图形的填充颜色
        var col:uint = Math.random() * 1000000 + Math.random() * 100;
        //纹理对象的宽与高
        var bitmapDataWidth:Number = 1 + Math.random() * 100;//加上常数1，使其在任何情况下都不为0

        var nBox:Sprite = new Sprite();
        nBox.graphics.beginFill(col, 0.5);

        var flag:Number = Math.random();//标志是圆形还是方形
        if(flag < 0.5){
            nBox.graphics.drawCircle(bitmapDataWidth/2,bitmapDataWidth/2,bitmapDataWidth/2);
        }else{
            nBox.graphics.drawRect(0,0,bitmapDataWidth,bitmapDataWidth);
        }
        nBox.graphics.endFill();

        //使用 BitmapData 类，您可以处理 Bitmap 对象的数据（像素）。
        var nBMP_D:BitmapData = new BitmapData(bitmapDataWidth, bitmapDataWidth, true, 0x00FFFFFF);//创建一个具有指定的宽度和高度的BitmapData对象
        nBMP_D.draw(nBox);

        var nTxtr:Texture = Texture.fromBitmapData(nBMP_D, false, false);//通过BitmapData来创建纹理对象
        var img:Image = new Image(nTxtr);  //参数只为Texture，即纹理
        img.x = TEXTURE_WIDTH + bitmapDataWidth/2 + Math.random()*TEXTURE_WIDTH*3;
        img.y = TEXTURE_HEIGHT + Math.random()*TEXTURE_HEIGHT*3;
        this.addChild(img);

        trace(getArea(flag,bitmapDataWidth));

    }
    private function getArea(flag:uint,bitmapDataWidth:Number):Number{
        //area 是全局变量
        //封装更多图形
        //0.5?
        if(flag < 0.5){//圆
            area += Math.PI * bitmapDataWidth/2 *bitmapDataWidth/2
        }else{
            area += bitmapDataWidth *bitmapDataWidth
        }
        return area;
    }


//以下为计时器使用的所有的方法
    private function displayTimeText(leftTime:uint){
        _countDownText = new TextField(TEXT_WIDTH, TEXT_HEIGHT, "", "Verdana", 16, 0, true);
        _countDownText.y = MainView.TEXTURE_HEIGHT*2;
        this.addChild(_countDownText);

        _formatCountDownText = new TextField(TEXT_WIDTH, TEXT_HEIGHT, "", "Verdana", 16, 0, true);
        _formatCountDownText.y =_countDownText.y + _countDownText.height;
        this.addChild(_formatCountDownText);

        setText();
    }
    private function initCountDown(){
        if(_myTimer != null){
            if(_myTimer.running == true){
                _myTimer.stop();
                return;
            }else if(_myTimer.running == false){
                _myTimer.start();
                return;
            }
        }
        _myTimer = new Timer(1000,_countDownTime+1);//比倒计时的时间多1秒，因为它要静止在0秒
        _myTimer.addEventListener(TimerEvent.TIMER,onTimer);
        _myTimer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
        _myTimer.start();
    }
    //计时器响应事假  先赋给文本框，再改变其值
    private function onTimer(te:TimerEvent){
        if(_countDownTime<=0)return;
        _countDownTime--;
        setText();
    }
    private function formatTime(leftTime:uint):String{
        var min:uint = leftTime /60;
        var second:uint = leftTime%60;
        var result:String= "";
        if(min<10){
            result += "0"+min;
        }
        else
        {
            result += min;
        }

        result += ":";
        if(second<10){
            result += "0"+second;
        }
        else{
            result += second;
        }

        return result;

    }
    //计时器停止
    public function onTimerComplete(te:TimerEvent){
        _timeButton.label = "Time is over";
    }
    private function setText(){
        _countDownText.text = _countDownTime+"";
        _formatCountDownText.text = formatTime(_countDownTime);//_minuteTime+":"+_secondTime;
    }

}
}
