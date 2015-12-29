/**
 * Created by nina.xu on 2015/12/24.
 */
package countDown {
import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.utils.Timer;



public class TimeFormatCountDown extends Sprite{
    private var _myTimer:Timer;
    private var _countDownText:TextField;//显示倒计时
    private var _formatCountDownText:TextField;//显示时间格式的倒计时
    private var _countDownTime:uint;//倒计时的时间

    /**
     * 传入倒计时时间，计时器初始化
     * @param leftTime
     */
    public function init(leftTime:uint){
        if(_myTimer != null){
            _myTimer.reset()
        }

        _countDownTime = leftTime;

        _myTimer = new Timer(1000,_countDownTime+1);//比倒计时的时间多1秒，因为它要静止在0秒
        _myTimer.addEventListener(TimerEvent.TIMER,onTimer);
        _myTimer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
        _myTimer.start();
    }
    /**
     * 显示对象显示在显示列表中
     */
    public function displayList(leftTime:uint){
        _countDownText = new TextField();
        _formatCountDownText = new TextField();

        setText(leftTime);

        _countDownText.x = _countDownText.y = 60;
        this.addChild(_countDownText);

        _formatCountDownText.x = 60;
        _formatCountDownText.y = 80;
        this.addChild(_formatCountDownText)
    }
    //计时器响应事假  先赋给文本框，再改变其值
    private function onTimer(te:TimerEvent){
        if(_countDownTime<=0)return;
        _countDownTime--;
        setText(_countDownTime);
    }
    private function formatTime(leftTime:uint):String{
        var min:uint = leftTime /60;
        var second:uint = leftTime%60;
        var result:String= "";
        if(min<10){
            result += "0"+min;
        }
        else
        {
            result += min;
        }

        result += ":";
        if(second<10){
            result += "0"+second;
        }
        else{
            result += second;
        }

        return result;

    }
    //计时器停止
    public function onTimerComplete(te:TimerEvent){
        _countDownText.text = "时间用完了哦(⊙o⊙)哦";
    }
    private function setText(leftTime:uint){
        _countDownTime = leftTime;
        _countDownText.text = "倒计时"+_countDownTime+"秒";
        _formatCountDownText.text = formatTime(_countDownTime);//_minuteTime+":"+_secondTime;
    }
}
}
