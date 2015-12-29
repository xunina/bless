/**
 * User: xuexinli
 * Date: 15/12/29
 * Time: 17:07
 */
package
{
    import countDown.MainCountDown;

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.MouseEvent;

    import practiseArrStr.ArrToStr;
    import practiseArrStr.NumToArr;

    public class Main extends Sprite
    {
        public function Main()
        {
            addEventListener(Event.ADDED_TO_STAGE, onAddedHandler)
        }

        private var tasks:Array = [MainCountDown, ArrToStr, NumToArr];
        private var switchButton:Sprite;
        private var currentTaskIndex:int = -1;
        private var currentTask:*;
        private const SWITCH_BUTTON_WIDTH:int = 100;
        private const SWITCH_BUTTON_HEIGHT:int = 50;

        private function init():void
        {
            initView();
            initListener();
            onSwitchTaskHandler(null);
        }

        private function initListener():void
        {
            stage.addEventListener(Event.RESIZE, onResizeHandler);
        }

        private function initView():void
        {
            switchButton = createButton(SWITCH_BUTTON_WIDTH, SWITCH_BUTTON_HEIGHT, onSwitchTaskHandler, stage.stageWidth - SWITCH_BUTTON_WIDTH, 0);
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

        private function onResizeHandler(event:Event):void
        {
            switchButton.x = stage.stageWidth - SWITCH_BUTTON_WIDTH;
        }

        private function onSwitchTaskHandler(e:MouseEvent):void
        {
            currentTaskIndex++;
            if (currentTaskIndex > tasks.length - 1)
            {
                currentTaskIndex = 0;
            }

            if (currentTask)
            {
                removeChild(currentTask);
            }

            currentTask = new tasks[currentTaskIndex]();
            addChild(currentTask);
        }
    }
}