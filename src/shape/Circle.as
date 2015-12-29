/**
 * Created by nina.xu on 2015/12/18.
 */
package shape {
import flash.display.Sprite;

public class Circle extends Sprite implements IArea{
    static private var _type:String = "circle";
    var area:Number;
    public function Circle(r:Number,_type) {
        getArea(r);
    }
    public  function getArea(r:Number){
        area=3.14*r;
        trace(area+"circle");
    }
    public function get type():String {
        return _type;
    }
}
}
