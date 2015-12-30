/**
 * Created by nina.xu on 2015/12/29.
 */
package shape {
import shape.Shape;

public class SimpleShapeFactory {
    public function createShape(type:String):Shape{
        var newShape:Shape = null;
        if(type == "Circle"){
            newShape = new Circle(10,type);
        }else if(type == "Square"){
            newShape = new Square(12,type);
        }
        return newShape;
    }
}
}
