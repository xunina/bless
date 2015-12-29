/**
 * Created by nina.xu on 2015/12/24.
 */
package countDown.practice {
import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFieldType;
import flash.utils.Timer;

public class Timer_constructorExample extends Sprite{
    private var statusTextField:TextField = new TextField();//显示时间的文本框
    private var inputTextField:TextField = new TextField();//输入文本框
    private var delay:uint = 30000;//计时器事件间的延迟为30秒
    private var repeat:uint = 3;//计时器重复3次
    private var myTimer:Timer = new Timer(delay, repeat);//实例化计时器，计时器不会自启，必须调用start（）

    public function Timer_constructorExample() {
        inputTextField.x = 10;//相对于父级本地坐标的x坐标
        inputTextField.y = 10;
        inputTextField.border = true;//指定文本字段是否具有边框，true：有；
        inputTextField.background = true;//指定文本字段是否具有背景填充
        inputTextField.height = 200;//显示对象的高度，以对象为单位
        inputTextField.width = 200;
        inputTextField.multiline = true;//设置字段为多行文本字段
        inputTextField.wordWrap = true;//设置文本字段自动换行
        inputTextField.type = TextFieldType.INPUT;//指定文本字段类型为输入文本字段，DYNAMIC为无法编辑的动态文本字段

        statusTextField.x = 10;
        statusTextField.y = 220;
        statusTextField.background = true;
        statusTextField.autoSize = TextFieldAutoSize.LEFT;//将文本视为左对齐文本，这意味着该文本字段的左边距保持固定

        myTimer.start();//如果计时器尚未运行，则启动计时器
        statusTextField.text = "You have " + ((delay * repeat) / 1000)//初始化为90
                + " seconds to enter your response.";
        //每30秒执行一次
        myTimer.addEventListener(TimerEvent.TIMER, timerHandler);//事件类型名称，用来处理事件的侦听器
        //计时器停止后
        myTimer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);

        addChild(inputTextField);//将显示对象加入显示列表
        addChild(statusTextField);
    }
    //每30秒执行一次，更改一次文本框的内容
    private function timerHandler(e:TimerEvent):void{
        repeat--;
        statusTextField.text = ((delay * repeat) / 1000) + " seconds left.";
    }
    //设置文本提示时间到了，将输入文本框变为不可输入文本框
    private function completeHandler(e:TimerEvent):void {
        statusTextField.text = "Times Up.";
        inputTextField.type = TextFieldType.DYNAMIC;
    }

}
}
