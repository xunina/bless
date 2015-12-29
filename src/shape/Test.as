/**
 * Created by nina.xu on 2015/12/18.
 */
package shape {
import flash.display.Sprite;

public class Test extends Sprite{
    var newShape:IArea;
    var r:Number;
    private var _area:Number;
    private var _type:String;

    public function Test() {
        r = 123;
        _type = "square";
        addShape(r,_type);
    }

    public function addShape(r,_type){
        newShape = new Square(r,_type);
    }

}
}
