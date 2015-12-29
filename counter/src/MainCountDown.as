/**
 * Created by nina.xu on 2015/12/25.
 */
package {
import flash.display.Sprite;
import flash.events.MouseEvent;

public class MainCountDown extends Sprite{
    private var leftTime:uint;
    private var oneButton:OneButton;
    private var timeFormatCountDown:TimeFormatCountDown;

    public function MainCountDown() {
        init();
        oneButton.addEventListener(MouseEvent.CLICK, onButtonClickHandler);
    }

    private function onButtonClickHandler(e:MouseEvent){
        leftTime = 123;
        timeFormatCountDown.init(leftTime);
    }

    private function init(){
        oneButton = new OneButton();
        this.addChild(oneButton);
        timeFormatCountDown = new TimeFormatCountDown();
        this.addChild(timeFormatCountDown);
        //TODO 需要在这里显示计时器,但是不要开始倒计时
    }
}
}
