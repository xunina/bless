/**
 * Created by nina.xu on 2016/1/7.
 */
package combineUseStarlingAndFeathers {
import combineUseStarlingAndFeathers.shape.Shape;
import combineUseStarlingAndFeathers.shape.SimpleShapeFactory;



import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;

/**
 *放置产生的shape的容器
 */
public class MainShape extends Sprite{
    private var factory:SimpleShapeFactory;
    private var shape:Shape;
    private var shapeList:Vector.<Shape>;

    public var mainView:MainView;

    public function MainShape() {

        initBackgroundColor();
        initDisplayObject();
    }

    private function initBackgroundColor():void{
        this.x = 100;
        var bgTexture:Texture = Texture.fromColor(860,640,0x22999999);
        var bgImg:Image = new Image(bgTexture);
        this.addChildAt(bgImg,0);
    }
    private function initDisplayObject():void{
        factory = new SimpleShapeFactory();
        shapeList = new Vector.<Shape>();
    }

    public function shapeController():void{
        var typeShape:String;
        if(Math.random() < 0.5){
            typeShape = SimpleShapeFactory.CIRCLE;
        }else{
            typeShape = SimpleShapeFactory.SQUARE;
        }
        var radius:Number = Math.random()*100+1;
        shape = factory.createShape(radius,typeShape);
        shapeList.push(shape);//shape放入数组
        trace(radius+"---"+getArea());//计算面积的总和
        this.addChild(shape);
        shape.drawShape();//绘制shape
    }
    private function getArea():Number {
        var area:Number = 0;
        for (var i:uint = 0; i < shapeList.length; i++) {
            area += shapeList[i].area;
        }
        return area;
    }
    private var areaUint:uint = 0;
    public function shapeReduce():void{
        for(var i:uint = 0; i < shapeList.length; i++){
            if(shapeList[i].scaleX < 0){
                areaUint += shapeList[i].area;
                mainView.setdeleteShapeAreaText(areaUint + "");
                trace(areaUint+".....................");

                deleteShape(i);
            }else{//是所有的shape都缩小
                shapeList[i].shapeReduce();
            }
        }
    }

    public function resetShape():void{
        trace("MainShape.resetShape");
        areaUint = 0;
        if(shapeList.length <= 0){
            return;
        }else{
            while(shapeList.length > 0) {

                deleteShape(shapeList.length - 1);
            }
        }
    }

    private function deleteShape(deleteI:uint):void{
        shapeList[deleteI].destroy();
        shapeList.splice(deleteI,1);
    }


}
}
