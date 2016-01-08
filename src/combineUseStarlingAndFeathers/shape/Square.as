/**
 * Created by nina.xu on 2016/1/4.
 */
package combineUseStarlingAndFeathers.shape {


import flash.display.BitmapData;
import flash.display.Sprite;

import starling.display.Image;

import starling.textures.Texture;

public class Square extends Shape{
    private var scaleShapeX:Number;
    private var scaleShapeY:Number;

    private var _widthSquare:Number;
    private var _type:String;

    public function Square(width:Number,_type:String){
        this._widthSquare = width;
        this._type = _type;
        this.scaleShapeX = this.scaleShapeY = 1;
    }

    override public function get type():String {
        return _type;
    }

    override public function get area():Number {
        return _widthSquare * _widthSquare;
    }

    override public function drawShape(){
        trace("square.drawShape")
        var color:uint = Math.random() * 1000000;

        var Square:Sprite = new Sprite();
        Square.graphics.beginFill(color,0.5);
        Square.graphics.drawRect(_widthSquare/2,_widthSquare/2,_widthSquare,_widthSquare);
        Square.graphics.endFill();

        var bitmapData:BitmapData = new BitmapData(_widthSquare, _widthSquare, true, 0x00FFFFFF);//创建一个具有指定的宽度和高度的BitmapData对象
        bitmapData.draw(Square);
        var nTxtr:Texture = Texture.fromBitmapData(bitmapData, false, false);//通过BitmapData来创建纹理对象
        var img:Image = new Image(nTxtr);  //参数只为Texture，即纹理

        img.x = Math.random() * Math.PI * _widthSquare;
        img.y = Math.random() * Math.PI * _widthSquare;
        this.addChild(img);
    }

    override public function set scaleShape(scanelXY:Number){
        this.scaleShapeX = this.scaleShapeY = scanelXY;
    }
    override public function get scaleShapeXY(){
        return scaleShapeX;
    }

}
}
