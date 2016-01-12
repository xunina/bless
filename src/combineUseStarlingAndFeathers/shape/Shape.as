
package combineUseStarlingAndFeathers.shape {
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;

public class Shape extends Sprite  implements IArea  {

    
    public function get type():String {
        return "";
    }

    public function get area():Number {
        return 0;
    }

    public function drawShape():void {}

    public static const SHAPE_DELETED:String = "SHAPE_DELETED";
    public function shapeReduce():void {
        if(this.scaleX < 0){
            dispatchEvent(new Event(SHAPE_DELETED,true,this));//true，允许冒泡，即事件从子类到父类
        }else{//是所有的shape都缩小
            this.scaleX = this.scaleY = this.scaleX - 0.01;
        }
    }

    public function destroy():void {
        if(this.parent){
            this.parent.removeChild(this);
        }
    }


}
}
