/**
 * Created by nina.xu on 2015/12/31.
 */
package combineUseStarlingAndFeathers {
import flash.display.Sprite;

import starling.core.Starling;

public class Main extends Sprite{
    private var _myStarling:Starling;
    public function Main() {
        init();

    }
    public function init(){
        _myStarling = new Starling(MainView,stage);
        _myStarling.showStats = true;
        _myStarling.start();


    }
}
}
