/**
 * Created by nina.xu on 2015/12/30.
 */
package combine.practice {
import flash.display.Sprite;

public class DrawShape extends Sprite{
    var circle:Sprite;
    public function DrawShape() {
        circle = new Sprite();
        circle.graphics.beginFill(0x456784);
        circle.alpha = 0.5;
        circle.graphics.drawCircle(0,100+Math.random()*100,45);
        circle.graphics.endFill();
        this.addChild(circle);
    }
}
}
