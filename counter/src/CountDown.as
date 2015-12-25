/**
 * Created by nina.xu on 2015/12/24.
 */
package {
import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.utils.Timer;

public class CountDown extends Sprite{
    public var mytimer:Timer;//定时器
    public var time:TextField;//读秒
    public var i:uint = 29;//30秒---0-29

    public function CountDown()
    {
        time=new TextField();//时间显示框
        time.x=200;
        time.y=100;
        //每1秒事件执行1次，事件共执行30次，刚好30秒
        mytimer=new Timer(1000,30); //设置时间(计时器事件间的延迟；指定重复次数，为0：则重复无限次)
        mytimer.addEventListener(TimerEvent.TIMER,timerEventHandle);
        mytimer.start();//计时开始
        addChild(time);

    }

    public function timerEventHandle(te:TimerEvent):void //时间事件的响应函数
    {
        time.text="倒计时："+i+"秒";
        /*if(i==0)
            mytimer.stop();*/ //该判断语句起到与重复次数同样的作用，当i==0时，事件执行次数刚好完成
        i--;
    }
}
}
