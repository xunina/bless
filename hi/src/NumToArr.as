/**
 * Created by nina.xu on 2015/12/18.
 */
package {
import flash.display.Sprite;

/**数字转换成string（toString()），charAt()顺序取出放入数组中*/
public class NumToArr extends Sprite{
    /**原始的数字*/
    var num:int;
    /**数字转换成的String*/
    var numStr:String;
    /**string转换成的字符*/
    var numArr:Array;
    public function NumToArr() {
        num=123455;
        numStr=num.toString();
        numArr=new Array();
        strNumToChar(numStr,numStr.length);
    }
    /**将string转换为字符串并输出*/
    public function strNumToChar(str:String,length){
        for(var i:int=0;i<length;i++){
            numArr[i]=str.charAt(i);
        }
        trace(numArr);
    }
}
}
