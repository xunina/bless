/**
 * Created by nina.xu on 2015/12/24.
 */
package {
import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class OneButton extends Sprite{
    public function OneButton() {
        init();
    }
    private function init():void
    {
        var a:Sprite = new Sprite();        //��ţ̌��ʱ��ʾ״̬
        huitu(a,0x11ff55);
        var b:Sprite = new Sprite();        //�ŵ���ť����ʾ״̬
        huitu(b,0xff1155);
        var c:Sprite = new Sprite();        //���°�ť��ʾ״̬
        huitu(c,0x1155ff);
        var d:Sprite = new Sprite();
        huitu(d,0xffffff);
        //CuPlayer.com��ʾ:������ť����
        var abc:SimpleButton = new SimpleButton(a,b,c,d);
        abc.x = abc.y = 50;
        this.addChild(abc);
    }
    //CuPlayer.com��ʾ:ͳһ���õĻ�ͼ��ť����
    private function huitu(obj:Sprite, col:uint):void
    {
        obj.graphics.beginFill(col);
        obj.graphics.drawRoundRect(0,0,100,100,20,20);
        obj.graphics.endFill();
    }




}
}
