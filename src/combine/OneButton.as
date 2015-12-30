/**
 * Created by nina.xu on 2015/12/24.
 */
package combine {
import flash.display.SimpleButton;
import flash.display.Sprite;

public class OneButton extends Sprite{
    public function OneButton() {
        init();
    }
    private function init():void
    {
        var a:Sprite = new Sprite();        //按钮抬起时显示状态
        drawRoundRect(a,0x11ff55);
        var b:Sprite = new Sprite();        //放到按钮上显示状态
        drawRoundRect(b,0xff1155);
        var c:Sprite = new Sprite();        //按下按钮显示状态
        drawRoundRect(c,0x1155ff);
        var d:Sprite = new Sprite();
        drawRoundRect(d,0xffffff);
        //创建按钮对象
        var abc:SimpleButton = new SimpleButton(a,b,c,d);

        this.addChild(abc);
    }
    //统一调用的绘图按钮方法
    private function drawRoundRect(obj:Sprite, col:uint):void
    {
        obj.graphics.beginFill(col);
        obj.graphics.drawRoundRect(0,0,100,50,20,20);
        obj.graphics.endFill();
    }



}
}
