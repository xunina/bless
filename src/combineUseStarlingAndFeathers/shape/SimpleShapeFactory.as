/**
 * Created by nina.xu on 2016/1/4.
 */
package combineUseStarlingAndFeathers.shape {
public class SimpleShapeFactory {

    public static const CIRCLE:String = "Circle";
    public static const SQUARE:String = "Square";

    public function createShape(radius:Number,type:String):Shape{
        var newShape:Shape;
        if(type == CIRCLE){
            newShape = new Circle(radius,type);
        }else if(type == SQUARE){
            newShape = new Square(radius,type);
        }
        return newShape;

    }
}
}
