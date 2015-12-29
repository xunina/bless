/**
 * Created by nina.xu on 2015/12/17.
 */
package practiseArrStr {
import flash.display.Sprite;


public class ArrToStr extends Sprite{
    /**原始数组*/
    private var _arr:Array;
    /**原始数组转换的字符串*/
    private var _str:String;
    /**字符转换成的数组*/
    private var _arrI:Array;
    /**输出的字符串*/
    private var _strI:String;
    /**_arrI的下标*/

    public function ArrToStr() {
        _arr=["556","44","5553123"];
        _arrI=new Array();
        _strI=new String();

        //**转换为字符串*/
        //tip 使用数组的join方法
        for(var i:int=0;i<_arr.length;i++){
            if(i==0){//去除前面的null
                _str=_arr[i];
            }else {
                _str += _arr[i];
            }
        }
        var j:int=0;

        for(var i:int=0;i<_str.length;i++){
            //**每3个字符截取一次*/
            if(i%3==2){
                _arrI[j]=_str.substring(i-2,i+1);//0-2,3-5
                _arrI[j]=_arrI[j];
                j++;
            }
            /**若最后余下一个或两个字符，则将其添加进数组*/
            if(_str.length%3==2){
                if(_str.length-i<3){
                    _arrI[j]=_str.substring(i-2,i);
                }
            }else if(_str.length%3==1){
                _arrI[j]=_str.substring(i-1,i);
            }

            //判断到最后一个字符，则打印
            if(i==_str.length-1){
                _strI=_arrI.toString();
                trace(_strI);

            }

        }

        var count = 0;
        for(var i:int = 0;i<10;i++) {
            count ++;
            if(count ==4) {
                count = 0
            }
            else {
            }
        }

        trace(convert(1));
        trace(convert(123));//ecpect 123
        trace(convert(123456));//ecpect 123,456
        trace(convert(3456788994));
        trace(convert(123456789));
    }

    /**
     * 尝试使用String#split()
     * 尝试使用Array#reverse()(倒转数组),Array#join()(将数组中的元素转换为字符串、在元素间插入指定的分隔符、连接这些元素然后返回结果字符串。)
     * 尝试使用字符串拼接
     * Array#push() (将一个或多个元素添加到数组的结尾，并返回该数组的新长度。)
     */
    public function convert(input:uint):String {//uint可表示的最大的32 位无符号整数4,294,967,295
        var str:String;//返回的字符串
        var numToString:String;//数字转成的字符串
        var arr:Array;//数字转成且已翻转的数组
        var arrThree:Array;//三个一组的数组
        var strJoin:String;
        numToString = input.toString();
        arr = numToString.split("").reverse();
        arrThree = new Array();
        for(var i:int = 0;i<arr.length;i++){
            if(i % 3 == 0 && i != 0){
                arrThree.push(arr[i]);//每三个分完一组后，将下一个内容放入数组当前下标的下一个位置中
            }
            else{
                if(!arrThree.length) {
                    arrThree.push("");//arrayThree为空数组，则添加一个空字符串
                }
                arrThree[arrThree.length - 1] += arr[i];//为当前下标中的内容追加字符串
            }
        }
        strJoin = arrThree.join(",");
        str = strJoin.split("").reverse().join("");
        return str;



    }


}
}

/**
 * 先将数组循环，然后将其内容取出来放入string中，循环每3个字符后添加一个，
 * 数组转换字符串有逗号：str=arr.toString();会再每个元素之间加上逗号
 * 复杂字符串实现是一种绳状结构，当+时，只是进行连接，不需频繁生成新的不变对象
 * */
