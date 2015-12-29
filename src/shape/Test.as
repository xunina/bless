/**
 * Created by nina.xu on 2015/12/18.
 */
package shape {

import flash.display.Sprite;

public class Test extends Sprite{
    private var newShape:Shape;
    private var shapeList:Vector.<Shape>;
    private var _type:String;

    public function Test(){
        addShape("Square");
        trace(getArea());
    }

    public function addShape(_type:String){
        shapeList = new Vector.<Shape>();
        if(_type == "Circle"){
            newShape = new Circle(10,_type);
        }else if(_type == "Square"){
            newShape = new Square(12,_type);
        }
        shapeList.push(newShape);
    }
    public function getArea():Number{
        var area:Number = new Number();
        for(var i:uint = 0;i<shapeList.length;i++){
             area = shapeList[i].getArea;
        }
        return area;
    }

}
}



