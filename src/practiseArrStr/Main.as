/**
 * Created by nina.xu on 2015/12/16.
 */
package practiseArrStr {
import flash.display.Sprite;

import org.as3commons.lang.StringUtils;

public class Main  extends Sprite
{
    private var _arrToStr:ArrToStr;
    private var _numToArr:NumToArr;
    public function Main() {
        trace("Hello world");
        trace("");
        trace("1");
        trace(StringUtils.trimToEmpty(" tr "));
       // StringUtils.trimToEmpty(null)          = "";
       // StringUtils.trimToEmpty("")            = "";
       // StringUtils.trimToEmpty("     ")       = "";
        //StringUtils.trimToEmpty("abc")         = "abc";
        //StringUtils.trimToEmpty("    abc    ") = "abc";

        _arrToStr= new ArrToStr();
        _numToArr = new NumToArr();


    }
}
}
