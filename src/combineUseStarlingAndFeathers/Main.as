/**
 * Created by nina.xu on 2015/12/31.
 */
package combineUseStarlingAndFeathers {
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

import starling.core.Starling;
[SWF(width="960",height="640",frameRate="60",backgroundColor="#DDDDDD")]
public class Main extends Sprite{
    private var _myStarling:Starling;
    public function Main() {
        if(this.stage){
            //一个 StageScaleMode 类中指定要使用哪种缩放模式的值。---StageScaleMode.NO_SCALE  整个应用程序的大小固定
            this.stage.scaleMode = StageScaleMode.NO_SCALE;//EXACT_FIT//NO_SCALE;
            //一个 StageAlign 类中指定舞台在 Flash Player 或浏览器中的对齐方式的值。---StageAlign.TOP_LEFT 顶对齐 左对齐
            this.stage.align = StageAlign.TOP_LEFT;
        }
        this.loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
    }
    public function loaderInfo_completeHandler(e:Event):void{

        _myStarling = new Starling(MainView,this.stage);
        _myStarling.showStats = true;
        _myStarling.start();

        this.stage.addEventListener(Event.RESIZE, stage_resizeHandler, false, int.MAX_VALUE, true);//stage大小改变时调度

    }

    private function stage_resizeHandler(e:Event):void{
        this._myStarling.stage.stageWidth = this.stage.stageWidth;//舞台坐标系的宽度（改变此值，缩放舞台的显示内容），=设置舞台当前的宽度
        this._myStarling.stage.stageHeight = this.stage.stageHeight;
    }
}
}
