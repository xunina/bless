/**
 * Created by nina.xu on 2015/12/18.
 */
package shape {

import flash.display.Sprite;

public class Test extends Sprite{
    private var factory:SimpleShapeFactory;
    private var newShape:Shape;
    private var shapeList:Vector.<Shape>;

    public function Test(){
        init();
        addShape("Circle");
        trace(getArea());
    }

    public function init(){
        factory = new SimpleShapeFactory();
        shapeList = new Vector.<Shape>();
    }

    public function addShape(_type:String){
        newShape = factory.createShape(_type);
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



