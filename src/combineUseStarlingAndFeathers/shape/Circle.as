/**
 * Created by nina.xu on 2016/1/4.
 */
package combineUseStarlingAndFeathers.shape {
import combineUseStarlingAndFeathers.MainView;

import flash.display.BitmapData;
import flash.display.Sprite;

import starling.display.Image;
import starling.textures.Texture;

public class Circle extends Shape{
    private var scaleShapeX:Number;
    private var scaleShapeY:Number;
    private var radius:Number;
    private var _type:String;

    public function Circle(radius:Number,_type:String){
        this.radius = radius;
        this._type = _type;
        this.scaleShapeX = this.scaleShapeY = 1;

    }

    override public function get type():String {
        return _type;
    }

    override public function get area():Number {
        return Math.PI * radius * radius;
    }

    override public function drawShape():void{
        trace("Circle.drawShape")
        var color:uint = Math.random() * 1000000;

        var circle:Sprite = new Sprite();
        circle.graphics.beginFill(color,0.5);
        circle.graphics.drawCircle(radius,radius,radius);
        circle.graphics.endFill();

        var bitmapData:BitmapData = new BitmapData(radius * 2, radius * 2, true, 0x00FFFFFF);//创建一个具有指定的宽度和高度的BitmapData对象
        bitmapData.draw(circle);
        var nTxtr:Texture = Texture.fromBitmapData(bitmapData, false, false);//通过BitmapData来创建纹理对象
        var img:Image = new Image(nTxtr);  //参数只为Texture，即纹理

        img.x = Math.random() * Math.PI * radius;
        img.y = Math.random() * Math.PI * radius;
        this.addChild(img);
    }

    override public function shapeReduce():void{
        this.scaleX = this.scaleY = this.scaleX - 0.01;
    }

    override public function destroy():void {
        if(this.parent){
            this.parent.removeChild(this);
        }
    }
}
}
