/**
 * Created by nina.xu on 2016/1/4.
 */
package combineUseStarlingAndFeathers.shape {

import flash.display.BitmapData;
import flash.display.Sprite;

import starling.display.Image;
import starling.display.Quad;

import starling.textures.Texture;

public class Circle extends Shape{

    private var radius:Number;
    private var _type:String;

    public function Circle(radius:Number,_type:String){
        this.radius = radius;
        this._type = _type;
        this.pivotX = this.pivotY = radius;
        this.x = radius + Math.random() * radius;
        this.y = radius + Math.random() * radius;

    }

    override public function get type():String {
        return _type;
    }

    override public function get area():Number {
        return Math.PI * radius * radius;
    }

    override public function drawShape():void{
        trace("Circle.drawShape")
        var color:uint = Math.random() * 0xFFFFFF;

        var circle:Sprite = new Sprite();
        circle.graphics.beginFill(color,0.5);
        circle.graphics.drawCircle(radius,radius,radius);//圆心相对于父显示对象注册点的位置，但是它的父显示对象不知道是谁？？？？？？断点调试时显示为parent = null
        circle.graphics.endFill();

        var bitmapData:BitmapData = new BitmapData(radius * 2, radius * 2, true, 0x00FFFFFF);//创建一个具有指定的宽度和高度的BitmapData对象
        bitmapData.draw(circle);
        var nTxtr:Texture = Texture.fromBitmapData(bitmapData, false, false);//通过BitmapData来创建纹理对象
        var img:Image = new Image(nTxtr);  //参数只为Texture，即纹理
        this.addChild(img);

    }




}
}
