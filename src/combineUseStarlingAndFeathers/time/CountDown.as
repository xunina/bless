/**
 * Created by nina.xu on 2016/1/4.
 */
package combineUseStarlingAndFeathers.time {

import flash.events.TimerEvent;
import flash.utils.Timer;

import starling.display.Sprite;

import starling.text.TextField;

public class CountDown extends Sprite{
    private var _countDownText:TextField;
    private var _formatCountDownText:TextField;

    private var _myTimer:Timer;
    private var _countDownTime:uint = 10;

    private var TEXT_WIDTH:uint = 100;
    private var TEXT_HEIGHT:uint = 25;
    public function displayTimeText(leftTime:uint):void{
        _countDownText = new TextField(TEXT_WIDTH, TEXT_HEIGHT, "", "Verdana", 16, 0, true);
        this.addChild(_countDownText);

        _formatCountDownText = new TextField(TEXT_WIDTH, TEXT_HEIGHT, "", "Verdana", 16, 0, true);
        _formatCountDownText.y =_countDownText.y + _countDownText.height;
        this.addChild(_formatCountDownText);

        setText();
    }
    public function initCountDown():void{
        if(_myTimer != null){
            if(_myTimer.running == true){
                _myTimer.stop();
                return;
            }else if(_myTimer.running == false){
                _myTimer.start();
                return;
            }
        }
        _myTimer = new Timer(1000,_countDownTime+1);//比倒计时的时间多1秒，因为它要静止在0秒
        _myTimer.addEventListener(TimerEvent.TIMER,onTimer);
        _myTimer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
        _myTimer.start();
    }
    //计时器响应事假  先赋给文本框，再改变其值
    private function onTimer(te:TimerEvent):void{
        if(_countDownTime<=0)return;
        _countDownTime--;
        setText();
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
    public function onTimerComplete(te:TimerEvent):void{
        _countDownText.text = "over";
    }
    private function setText(time:uint = 0):void{
        if(time != 0){
            _countDownTime = time;
        }
        _countDownText.text = _countDownTime+"";
        _formatCountDownText.text = formatTime(_countDownTime);//_minuteTime+":"+_secondTime;
    }
    public function reset(time:uint):void {
        if(!_myTimer){
            return;
        }
        setText(time);
        _myTimer.reset();


    }
}
}
