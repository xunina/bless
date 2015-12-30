/**
 * Created by nina.xu on 2015/12/29.
 */
package shape {
import shape.Shape;

public class SimpleShapeFactory {
    public function createShape(radius:Number,type:String):Shape{
        var newShape:Shape;
        if(type == Test.CIRCLE){
            newShape = new Circle(radius,type);
        }else if(type == Test.SQUARE){
            newShape = new Square(radius,type);
        }
        return newShape;
    }
}
}
