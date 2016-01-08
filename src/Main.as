/**
 * User: xuexinli
 * Date: 15/12/29
 * Time: 17:07
 */
package
{
import combine.Main;

import countDown.MainCountDown;

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.MouseEvent;

    import practiseArrStr.ArrToStr;
    import practiseArrStr.NumToArr;

import shape.Test;

public class Main extends Sprite
    {
        public function Main()
        {
            addEventListener(Event.ADDED_TO_STAGE, onAddedHandler)
        }

        private var tasks:Array = [MainCountDown, ArrToStr, NumToArr,Test,combine.Main];
        private var switchButton:Sprite;
        private var currentTaskIndex:int = -1;
        private var currentTask:*;
        private const SWITCH_BUTTON_WIDTH:int = 100;
        private const SWITCH_BUTTON_HEIGHT:int = 50;

        private function init():void
        {
            initView();//完成按钮的显示
            initListener();//当swf的大小改变时，按钮始终位于右侧
            onSwitchTaskHandler(null);//逻辑处理，添加或删除任务
        }

        private function initListener():void
        {
            stage.addEventListener(Event.RESIZE, onResizeHandler);//当 Stage 对象的 scaleMode 属性设置为 StageScaleMode.NO_SCALE 且 SWF 文件大小经过重新调整时进行调度。
        }

        private function initView():void
        {
            switchButton = createButton(SWITCH_BUTTON_WIDTH, SWITCH_BUTTON_HEIGHT, onSwitchTaskHandler, stage.stageWidth - SWITCH_BUTTON_WIDTH, 0);//传递onSwithTaskHandler给MouseEvent.CLICK事件
            addChild(switchButton);
        }

        private function createButton(width:Number, height:Number, onClickHandler:Function = null, x:Number = 0, y:Number = 0, color:uint = 0xff0000):Sprite
        {
            var button:Sprite = new Sprite();
            button.graphics.beginFill(color, 1);
            button.graphics.drawRect(0, 0, width, height);
            button.x = x;
            button.y = y;

            button.buttonMode = true;

            if (onClickHandler)
            {
                button.addEventListener(MouseEvent.CLICK, onClickHandler);
            }

            return button;
        }

        private function onAddedHandler(event:Event):void
        {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            init();
        }
        //按钮始终位于最右边
        private function onResizeHandler(event:Event):void
        {
            switchButton.x = stage.stageWidth - SWITCH_BUTTON_WIDTH;
        }

        private function onSwitchTaskHandler(e:MouseEvent):void
        {
            currentTaskIndex++;
            //到达最后一个，从索引0处重新开始
            if (currentTaskIndex > tasks.length - 1)
            {
                currentTaskIndex = 0;
            }
            //从舞台上移除当前的任务
            if (currentTask)
            {
                removeChild(currentTask);
            }
            //添加下一个任务到舞台
            currentTask = new tasks[currentTaskIndex]();
            addChild(currentTask);
        }
    }
}