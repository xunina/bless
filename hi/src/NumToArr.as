/**
 * Created by nina.xu on 2015/12/18.
 */
package {
import flash.display.Sprite;

/**数字转换成string（toString()），charAt()顺序取出放入数组中*/
public class NumToArr extends Sprite{
    //tip 类的成员属性需要加访问修饰符
    /**原始的数字*/
    private var num:int;
    /**数字转换成的String*/
    private var numStr:String;
    /**string转换成的字符*/
    private var numArr:Array;
    public function NumToArr() {
        num=123455;
        numStr=num.toString();
        numArr=new Array();
        strNumToChar(numStr,numStr.length);
        numToStrArr(1234);//希望得到=>[1,2,3,4] 不是['1','2','3','4'];
    }
    /**将string转换为字符串并输出*/
    public function strNumToChar(str:String,length){
        for(var i:int=0;i<length;i++){
            numArr[i]=str.charAt(i);
        }
        trace(numArr);
    }

    //tip 尝试使用string#split方法和Array#map方法
    //返回的数组每一项需要是int类型
    public function numToStrArr(input:uint):Array
    {
        return [];
    }
}
}
