/**
 * Created by nina.xu on 2015/12/18.
 */
package shape {

public class Circle extends Shape{
    private var radius:Number;
    private var _type:String;

    public function Circle(radius:Number,_type:String){
        this.radius = radius;
        this._type = _type;
    }

    override public function get type():String {
        return _type;
    }

    override public function get area():Number {
        return Math.PI * radius * radius;
    }
}
}
