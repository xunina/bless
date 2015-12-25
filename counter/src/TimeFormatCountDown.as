/**
 * Created by nina.xu on 2015/12/24.
 */
package {
import flash.display.Sprite;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.utils.Timer;



public class TimeFormatCountDown extends Sprite{
    private var _myTimer:Timer;
    private var _countDownText:TextField;//显示倒计时
    private var _formatCountDownText:TextField;//显示时间格式的倒计时
    private var _inputCountDownTime:TextField;//输入倒计时时间的文本框

    private var _countDownTime:uint;//倒计时的时间
    private var _minuteTime:uint;//分钟
    private var _secondTime:uint;//秒数

    public function TimeFormatCountDown() {

        _countDownTime = getCountDownTime();


    }
    //显示及文本框输入响应事件
    public  function getCountDownTime(){
        _countDownText = new TextField();
        _countDownText.text = "请输入倒计时的秒数";
        _countDownText.x = _countDownText.y = 60;
        this.addChild(_countDownText);

        _formatCountDownText = new TextField();
        _formatCountDownText.x = 60;
        _formatCountDownText.y = 80;
        this.addChild(_formatCountDownText);

        _inputCountDownTime = new TextField();
        _inputCountDownTime.x = _inputCountDownTime.width = 50;
        _inputCountDownTime.y = _inputCountDownTime.height = 30;
        _inputCountDownTime.background = true;
        _inputCountDownTime.backgroundColor = 0x999999;
        _inputCountDownTime.type = TextFieldType.INPUT;
        _inputCountDownTime.addEventListener(Event.CHANGE,onTextChange);
        this.addChild(_inputCountDownTime);
    }
    //文本改变时，重置计时器;获取倒计时时间
    public function onTextChange(e:Event){
        //如果计时器正在运行，则停止计时器，并将 currentCount 属性设回为 0，这类似于秒表的重置按钮。
        // 然后，在调用 start() 后，将运行计时器实例，运行次数为指定的重复次数（由 repeatCount 值设置）。
        if(_myTimer != null){//重置计时器
            _myTimer.reset();
        }
        try {
            _countDownTime = (uint)(_inputCountDownTime.text);//currentCount比倒计时时间少1秒
            if(_countDownTime > 0){
                init();
            }else{
                _countDownText.text = "请输入正数";
            }
        } catch (e:Error) {
            _countDownText.text = "请输入正数";
        }



    }
    //构造计时器
    public function init(){
        _countDownText.text = "";//计时器重新开始，将文本框置为空
        _formatCountDownText.text = "";

        _minuteTime = _countDownTime/60;//获取分钟
        _secondTime = _countDownTime%60;//获取秒数

        _myTimer = new Timer(1000,_countDownTime+1);//比倒计时的时间多1秒，因为它要静止在0秒
        _myTimer.addEventListener(TimerEvent.TIMER,onTimer);
        _myTimer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
        _myTimer.start();
    }
    //计时器响应事假  先赋给文本框，再改变其值
    public function onTimer(te:TimerEvent){
        _countDownText.text = "倒计时"+_countDownTime+"秒";
        var spaceTime:uint = _countDownTime--;

        _formatCountDownText.text = _minuteTime+":"+_secondTime;
        if(spaceTime % 60 ==0){//如果剩余一个整的分钟，则将分钟-1，秒钟变59
            _minuteTime = _minuteTime - 1;
            _secondTime = 59;
        }else {//如果不是整的一分钟，则秒数--，分数不变
            _secondTime--;
        }
    }
    //计时器停止
    public function onTimerComplete(te:TimerEvent){
        _countDownText.text = "时间用完了哦(⊙o⊙)哦";
    }

}
}
