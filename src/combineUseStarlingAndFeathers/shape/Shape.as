
package combineUseStarlingAndFeathers.shape {

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class Shape extends Sprite  implements IArea  {

    [Embed(source="../../../assets/images/shape.xml", mimeType="application/octet-stream")]
    public static const AtlasXml:Class;

    [Embed(source="../../../assets/images/shape.png")]
    public static const AtlasTexture:Class;

    private var shapeList:Array = ["shape21","shape22","shape23","shape11","shape12","shape13"];
    private var _area:Number = 0;

    public function get area():Number {//无法知道外部纹理是圆还是矩形，全部按照矩形进行了处理
       return _area;
    }

    public function drawShape():void {
        var indexShapeList:uint = Math.random() * 10;
        if(indexShapeList > 5){
            indexShapeList = 5;
        }

        var texture:Texture = Texture.fromEmbeddedAsset(AtlasTexture);
        var xml:XML = XML(new AtlasXml());
        var atlas:TextureAtlas = new TextureAtlas(texture,xml);
        var shapeTexture:Texture = atlas.getTexture(shapeList[indexShapeList]);
        var img:Image = new Image(shapeTexture);  //参数只为Texture，即纹理
        this.addChild(img);

        this.x = img.width/2 + Math.random()*100;
        this.y = img.height/2 + Math.random()*100;
        this.pivotX = img.width/2;
        this.pivotY = img.height/2;

        _area = shapeTexture.width * shapeTexture.height;
    }

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
