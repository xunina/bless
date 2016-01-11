/**
 * Created by nina.xu on 2016/1/4.
 */
package combineUseStarlingAndFeathers.shape {
public interface IArea {
    function get type():String;//绘制的图形类型
    function get area():Number;//该图形的面积
    function drawShape():void;
    function shapeReduce():void;
    function destroy():void;
}
}
