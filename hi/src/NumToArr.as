/**
 * Created by nina.xu on 2015/12/18.
 */
package {
import flash.display.Sprite;

/**����ת����string��toString()����charAt()˳��ȡ������������*/
public class NumToArr extends Sprite{
    /**ԭʼ������*/
    var num:int;
    /**����ת���ɵ�String*/
    var numStr:String;
    /**stringת���ɵ��ַ�*/
    var numArr:Array;
    public function NumToArr() {
        num=123455;
        numStr=num.toString();
        numArr=new Array();
        strNumToChar(numStr,numStr.length);
    }
    /**��stringת��Ϊ�ַ��������*/
    public function strNumToChar(str:String,length){
        for(var i:int=0;i<length;i++){
            numArr[i]=str.charAt(i);
        }
        trace(numArr);
    }
}
}
