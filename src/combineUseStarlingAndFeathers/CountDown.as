/**
 * Created by nina.xu on 2015/12/31.
 */
package combineUseStarlingAndFeathers {
import feathers.controls.Button;
import feathers.controls.Label;
import feathers.controls.text.TextBlockTextRenderer;
import feathers.core.ITextRenderer;

import flash.display.BitmapData;

import flash.display.Sprite;

import flash.display.Sprite;

import flash.text.engine.ElementFormat;

import flash.text.engine.FontDescription;

import starling.display.Image;

import starling.textures.Texture;


public class CountDown extends starling.display.Sprite{
    private var _timeButton:Button;
    private var _countDownText:Label;
    private var _formatCountDownText:Label;

    private var LABEL_HEIGHT = 25;
    public function initHandler(){

    }

    public function initView(){
        var shape:flash.display.Sprite = new flash.display.Sprite();
        shape.graphics.beginFill(0x000000,0.5);
        shape.graphics.drawCircle(0,0,12);
        shape.graphics.endFill();
        var nBMP_D:BitmapData = new BitmapData(100, 100, true, 0x00FFFFFF);//创建一个具有指定的宽度和高度的BitmapData对象
        nBMP_D.draw(shape);

        var nTxtr:Texture = Texture.fromBitmapData(nBMP_D, false, false);//通过BitmapData来创建纹理对象
        var img:Image = new Image(nTxtr);  //参数只为Texture，即纹理
        img.x = 100
        img.y = 100
        this.addChild(img);

        _timeButton = new Button();
        _timeButton.x = 100;
        _timeButton.y = 100;
        var texture:Texture = Texture.fromColor(100,100,0xaaff0000);//纹理，创建某一尺寸、颜色的空纹理
        _timeButton.defaultSkin = new Image(texture);//为按钮设置默认的皮肤，，Feathers组件没有默认的皮肤
        this.addChild(_timeButton);
        _timeButton.label = "nishishu woshishu ";
        _timeButton.labelFactory = function():ITextRenderer
        {
            var textRenderer:TextBlockTextRenderer = new TextBlockTextRenderer();
            textRenderer.styleProvider = null;
            var font:FontDescription = new FontDescription( "_sans" );
            textRenderer.elementFormat = new ElementFormat( font, 20, 0x444444 );
            return textRenderer;
        }

        _countDownText = new Label();

        _countDownText.height = LABEL_HEIGHT;
        _countDownText.x = 100;
        _countDownText.y = 150;
        this.addChild(_countDownText);
        _countDownText.text = "nihaoa";

        _formatCountDownText = new Label();
        _formatCountDownText.text = "nijue de ne ";
        _formatCountDownText.height = LABEL_HEIGHT;
        _formatCountDownText.x = 200;
        _formatCountDownText.y =_countDownText.y + _countDownText.height;
        this.addChild(_formatCountDownText);

    }
}
}
