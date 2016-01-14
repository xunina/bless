/**
 * Created by nina.xu on 2016/1/14.
 */
package internetworkCommunication {
import flash.display.Sprite;
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;
//URLLoader 类以文本、二进制数据或 URL 编码变量的形式从 URL 下载数据。
import flash.net.URLRequest;
//URLRequest类可捕获单个http请求中的所有信息。URLRequest对象将传递给Loader、URLStream和URLLoader类的load（）和其他加载操作，以便启动URL下载
import flash.net.URLRequestMethod;
//URLRequestMethod 类提供了一些值，这些值可指定在将数据发送到服务器时，URLRequest 对象应使用 POST 方法还是 GET 方法
import flash.net.URLVariables;
//使用URLVariables类可以在应用程序和服务器之间传输变量。将 URLVariables 对象与 URLLoader 类的方法、URLRequest 类的 data 属性和 flash.net 包函数一起使用。

public class SampleSendAndLoad extends Sprite{
    public function SampleSendAndLoad() {

        sendJSON({"name":"x","password":"x"});

    }
    private function sendJSON(array:*){

        var urlVariables:URLVariables = new URLVariables();
        for (var k:String in array)
        {
            urlVariables[k] = array[k];
        }
        //var urlVariables:URLVariables = new URLVariables("name=x&password=x")

        var urlRequest:URLRequest = new URLRequest("http://192.168.0.98:3888/users/login");//向服务器发送请求
        //var urlRequest:URLRequest = new URLRequest("http://192.168.0.98:3888/users/login?name=x&password=x");   //对吗???
        urlRequest.method = URLRequestMethod.POST;
        urlRequest.data = urlVariables;

        var urlLoader:URLLoader = new URLLoader();//接受服务器返回的数据
        urlLoader.addEventListener(Event.COMPLETE,onURLLoaderCompleteEvent);//在对所有已接收数据进行解码并将其放在 URLLoader 对象的 data 属性中以后调度。调度该事件后，可以访问已接收的数据。
        urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHttpStatusHandler);//当对 URLLoader.load() 的调用尝试通过 HTTP 访问数据时调度。在发送任何 complete 或 error 事件之前还将发送 httpResponseStatus（如果有）。
        urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIoErrorHandler)//若对 URLLoader.load() 的调用导致致命错误并因此终止了下载，则进行调度。
        urlLoader.load(urlRequest);
    }

    private function onIoErrorHandler(event:IOErrorEvent):void {
        trace(event);
    }

    //200进入onURLLoaderCompleteEvent ，其他进入onIoErrorHandler
    private function onHttpStatusHandler(event:HTTPStatusEvent):void {
        trace(event.status);
    }
    private function onURLLoaderCompleteEvent( event: Event ):void {
        var data:Object = JSON.parse(event.target.data);
        trace(data.token.token);
    }

}
}
