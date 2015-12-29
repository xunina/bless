/**
 * Created by nina.xu on 2015/12/25.
 */
package countDown {
import flash.display.Sprite;
import flash.events.MouseEvent;

public class MainCountDown extends Sprite{
    private var leftTime:uint = 123;
    private var oneButton:OneButton;
    private var timeFormatCountDown:TimeFormatCountDown;

    public function MainCountDown() {
        init();
        oneButton.addEventListener(MouseEvent.CLICK, onButtonClickHandler);
    }

    private function onButtonClickHandler(e:MouseEvent){
        timeFormatCountDown.init(leftTime);
    }

    private function init(){
        oneButton = new OneButton();
        this.addChild(oneButton);
        timeFormatCountDown = new TimeFormatCountDown();
        this.addChild(timeFormatCountDown);

        timeFormatCountDown.displayList(leftTime);
    }
}
}
