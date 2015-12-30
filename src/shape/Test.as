/**
 * Created by nina.xu on 2015/12/18.
 */
package shape {

import flash.display.Sprite;

public class Test extends Sprite{
    private var factory:SimpleShapeFactory;
    private var newShape:Shape;
    private var shapeList:Vector.<Shape>;

    public static const CIRCLE:String = "Circle";
    public static const SQUARE:String = "Square";

    public function Test(){
        init();
        for(var i:int =0 ;i<10;i++){
            var radius:int = Math.random()*100;
            addShape(radius,SQUARE);
            trace(radius,getArea());
        }
    }

    public function init(){
        factory = new SimpleShapeFactory();
        shapeList = new Vector.<Shape>();
    }

    public function addShape(radius:uint,type:String){
        newShape = factory.createShape(radius,type);
        shapeList.push(newShape);

        var copyNewShape:Sprite = new Sprite();
        drawRectOrCircle(copyNewShape,0x456321,type,radius);

    }
    private function drawRectOrCircle(obj:Sprite, col:uint,type:String,radius:uint):void
    {
        if(type == SQUARE){
            obj.graphics.beginFill(col);
            obj.alpha = 0.5;
            obj.graphics.drawRect(100+Math.random()*100,0,radius,radius);
            obj.graphics.endFill();
            this.addChild(obj);
        }else if(type == CIRCLE){
            obj.graphics.beginFill(col);
            obj.alpha = 0.5;
            obj.graphics.drawCircle(100+Math.random()*100,0,radius);
            obj.graphics.endFill();
            this.addChild(obj);
        }

    }


    public function getArea():Number{
        //基本数据结构的初始化习惯上不适用new来创建
        var area:Number = 0;
        for(var i:uint = 0;i<shapeList.length;i++){
             area += shapeList[i].area;
        }
        return area;
    }


}
}



