/**
 * Created by nina.xu on 2015/12/18.
 */
package shape {
import flash.display.Sprite;

public class Square extends Sprite implements IArea{
    static private var _type:String = "square";
    var area:Number;

    public function Square(height:Number,_type){
        getArea(height);
    }
    public  function getArea(height:Number){
        area = height * height;
        trace(area+"square");
    }
    public function get type():String {
        return _type;
    }
}
}
