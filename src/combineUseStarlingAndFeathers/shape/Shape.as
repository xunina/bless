/**
 * Created by nina.xu on 2016/1/4.
 */
package combineUseStarlingAndFeathers.shape {
import starling.display.Sprite;

public class Shape extends Sprite  implements IArea  {

    
    public function get type():String {
        return "";
    }

    public function get area():Number {
        return 0;
    }

    public function drawShape() {
    }


    public function set scaleShape(scaleXY:Number) {
    }

    public function get scaleShapeXY() {
    }
}
}
