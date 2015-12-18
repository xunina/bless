/**
 * Created by nina.xu on 2015/12/16.
 */
package {
import flash.display.Sprite;

public class Main  extends Sprite
{
    private var _arrToStr:ArrToStr;
    private var _numToArr:NumToArr;
    public function Main() {
        trace("Hello world");
        trace("");
        trace("1");
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
