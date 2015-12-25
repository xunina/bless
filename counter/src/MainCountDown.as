/**
 * Created by nina.xu on 2015/12/25.
 */
package {
import flash.display.Sprite;
import flash.events.MouseEvent;

public class MainCountDown extends Sprite{
    private var leftTime:uint;
    var oneButton:OneButton;
    var timeFormatCountDown:TimeFormatCountDown;

    public function MainCountDown() {
        displayList();
        oneButton.addEventListener(MouseEvent.CLICK, onClick);
    }

    private function onClick(e:MouseEvent){
        leftTime = 123;
        timeFormatCountDown.init(leftTime);
    }

    private function displayList(){
        oneButton = new OneButton();
        this.addChild(oneButton);
        timeFormatCountDown = new TimeFormatCountDown();
        this.addChild(timeFormatCountDown);
    }
}
}
