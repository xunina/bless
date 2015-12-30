/**
 * Created by nina.xu on 2015/12/18.
 */
package combine {
import shape.*;

import flash.display.Sprite;

public class ShapeTest extends Sprite{
    private var factory:SimpleShapeFactory;
    private var newShape:Shape;
    static private var shapeList:Vector.<Shape>;
    static private var area:Number = 0;

    public static const CIRCLE:String = "Circle";
    public static const SQUARE:String = "Square";

    public function countAndDraw(type:String,col:uint){
        init();
        var radius:int = Math.random()*100+Math.random()*50;
        addShape(type,radius,col);
        trace(radius,getArea());

    }

    private function init(){
        factory = new SimpleShapeFactory();
        shapeList = new Vector.<Shape>();
    }

    private function addShape(type:String,radius:uint,col:uint){
        newShape = factory.createShape(radius,type);
        shapeList.push(newShape);

        var copyNewShape:Sprite = new Sprite();
        drawRectOrCircle(copyNewShape,col,type,radius);

    }
    private function drawRectOrCircle(obj:Sprite, col:uint,type:String,radius:uint):void
    {
        if(type == SQUARE){
            obj.graphics.beginFill(col);
            obj.alpha = 0.5;
            obj.graphics.drawRect(100,0,radius,radius);
            obj.graphics.endFill();
        }else if(type == CIRCLE){
            obj.graphics.beginFill(col);
            obj.alpha = 0.5;
            obj.graphics.drawCircle(radius+110,0,radius);
            obj.graphics.endFill();
        }
        this.addChild(obj);
    }


    private function getArea():Number{
        //基本数据结构的初始化习惯上不适用new来创建

        for(var i:uint = 0;i<shapeList.length;i++){
             area += shapeList[i].area;
        }
        return area;
    }


}
}



