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
        var a:Sprite = new Sprite();        //按钮抬起时显示状态
        huitu(a,0x11ff55);
        var b:Sprite = new Sprite();        //放到按钮上显示状态
        huitu(b,0xff1155);
        var c:Sprite = new Sprite();        //按下按钮显示状态
        huitu(c,0x1155ff);
        var d:Sprite = new Sprite();
        huitu(d,0xffffff);
        //CuPlayer.com提示:创建按钮对象
        var abc:SimpleButton = new SimpleButton(a,b,c,d);
        abc.x = abc.y = 50;
        this.addChild(abc);
    }
    //CuPlayer.com提示:统一调用的绘图按钮方法
    private function huitu(obj:Sprite, col:uint):void
    {
        obj.graphics.beginFill(col);
        obj.graphics.drawRoundRect(0,0,100,100,20,20);
        obj.graphics.endFill();
    }




}
}
