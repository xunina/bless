/**
 * Created by nina.xu on 2015/12/31.
 */
package combineUseStarlingAndFeathers {
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import starling.core.Starling;
[SWF(width="960",height="640",frameRate="60",backgroundColor="#DDDDDD")]
public class Main extends Sprite{
    private var _myStarling:Starling;
    public function Main() {
        init();

    }
    public function init(){
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        _myStarling = new Starling(MainView,stage);
        _myStarling.showStats = true;
        _myStarling.start();


    }
}
}
