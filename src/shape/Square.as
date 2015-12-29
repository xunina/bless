/**
 * Created by nina.xu on 2015/12/18.
 */
package shape {

public class Square extends Shape{
    private var width:Number;
    private var _type:String;

    public function Square(width:Number,_type:String){
        this.width = width;
        this._type = _type;
    }

    override public function get type():String {
        return _type;
    }

    override public function get getArea():Number {
        return width * width;
    }
}
}
