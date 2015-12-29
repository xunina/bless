/**
 * Created by nina.xu on 2015/12/21.
 */
package practiseArrStr.practice {
import flash.display.Sprite;

public class ArrayJoin  extends Sprite{
    public function ArrayJoin(){
        var phoneString:String = "(888) 867-5309";

        var specialChars:Array = new Array("(", ")", "-", " ");
        var myStr:String = phoneString;

        var ln:uint = specialChars.length;
        for(var i:uint; i < ln; i++) {
            myStr = myStr.split(specialChars[i]).join("");//split()后，变为数组，join()后再转换成string
        }

        var phoneNumber:Number = new Number(myStr);

        trace(phoneString); // (888) 867-5309
        trace(phoneNumber); // 8888675309

    }
}
}
