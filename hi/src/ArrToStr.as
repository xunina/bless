/**
 * Created by nina.xu on 2015/12/17.
 */
package {
import flash.display.Sprite;


public class ArrToStr extends Sprite{
    /**ԭʼ����*/
    private var _arr:Array;
    /**ԭʼ����ת�����ַ���*/
    private var _str:String;
    /**�ַ�ת���ɵ�����*/
    private var _arrI:Array;
    /**������ַ���*/
    private var _strI:String;
    /**_arrI���±�*/
    var j:int=0;
    public function ArrToStr() {
        _arr=["556","44","5553123"];
        _arrI=new Array();
        _strI=new String();

        //**ת��Ϊ�ַ���*/
        for(var i:int=0;i<_arr.length;i++){
            if(i==0){//ȥ��ǰ���null
                _str=_arr[i];
            }else {
                _str += _arr[i];
            }
        }


        for(var i:int=0;i<_str.length;i++){
            //**ÿ3���ַ���ȡһ��*/
            if(i%3==2){
                _arrI[j]=_str.substring(i-2,i+1);//0-2,3-5
                _arrI[j]=_arrI[j];
                j++;

            }
            /**���������һ���������ַ���������ӽ�����*/
            if(_str.length%3==2){
                if(_str.length-i<3){
                    _arrI[j]=_str.substring(i-2,i);
                }
            }else if(_str.length%3==1){
                _arrI[j]=_str.substring(i-1,i);
            }

            //�жϵ����һ���ַ������ӡ
            if(i==_str.length-1){
                _strI=_arrI.toString();
                trace(_strI);

            }

        }

    }


}
}

/**
 * �Ƚ�����ѭ����Ȼ��������ȡ��������string�У�ѭ��ÿ3���ַ������һ����
 * ����ת���ַ����ж��ţ�str=arr.toString();����ÿ��Ԫ��֮����϶���
 * �����ַ���ʵ����һ����״�ṹ����+ʱ��ֻ�ǽ������ӣ�����Ƶ�������µĲ������
 * */
