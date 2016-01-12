/**
 * Created by nina.xu on 2016/1/4.
 */
package combineUseStarlingAndFeathers.shape {


import flash.display.BitmapData;
import flash.display.Sprite;


import starling.display.Image;

import starling.textures.Texture;

public class Square extends Shape{

    private var _widthSquare:Number;
    private var _type:String;

    public function Square(widthTemp:Number,_type:String){
        this._widthSquare = widthTemp;
        this._type = _type;
        /*this.width = widthTemp;
        this.height = widthTemp;*/      //为什么赋值不成功？添加子显示对象后赋值成功，得出结论，一个空的容器无法设置宽与高。。。。
        this.pivotX = this.pivotY = widthTemp/2;//缩小哪个对象，就设置哪个对象的注册点

        this.x = widthTemp/2 + Math.random() * widthTemp;
        this.y = widthTemp/2 + Math.random() * widthTemp;
    }

    override public function get type():String {
        return _type;
    }

    override public function get area():Number {
        return _widthSquare * _widthSquare;
    }

    override public function drawShape():void{
        trace("square.drawShape")
        var color:uint = Math.random() * 0xFFFFFF;

        var Square:Sprite = new Sprite();
        Square.graphics.beginFill(color,0.5);
        Square.graphics.drawRect(0,0,_widthSquare,_widthSquare);
        Square.graphics.endFill();

        var bitmapData:BitmapData = new BitmapData(_widthSquare, _widthSquare, true, 0x55FFFFFF);//创建一个具有指定的宽度和高度的BitmapData对象
        bitmapData.draw(Square);
        var nTxtr:Texture = Texture.fromBitmapData(bitmapData, false, false);//通过BitmapData来创建纹理对象
        var img:Image = new Image(nTxtr);  //参数只为Texture，即纹理

        this.addChild(img);

    }



}
}
