//
//  ViewController.swift
//  socketTest
//
//  Created by  on 2022/7/11.
//


/*
 TCP 為每個封包分配一個唯一的識別碼和一個序號，這些號碼能讓接收端識別封包的完整性，以及封包的順序。
 封包按順序傳輸
 要求可靠傳輸的服務，例如電子郵件、網頁瀏覽、檔案傳輸
 
 1.client想對server連線時，就必須主動向server傳送一個要求連線的封包
 2.當server接收並確認這個封包後，也會回傳一個相對應的封包，給client確認，並且開始等待client的回應
 3.當client收到server回應的封包後，就能確認之前的封包有被接收了，如果client也同意與server建立連線，就會再回傳一個確認封包告知server。
 4.當server接收到也確認過後，即完成三向交握，並進入了連接建立狀態
 */

/*
 UDP 不需要唯一識別碼和序號就能完成相同的工作。
 以串流方式傳送資料，發送端不會等待接收端的確認信號，會繼續不斷發送封包資料。
 接收端在接收到封包後並不會回覆確認接收給發送端，也因此封包沒有像TCP管理得這麼嚴密
 不在乎封包遺失，因此很容易出錯，但傳輸速度比 TCP 更快
 即時服務，例如串流媒體、網路電話、網路遊戲
 */




/*
 Socket
 傳輸層跟應用層之間
 
 TCP/IP，實現繁瑣且困難
 
(1)需要自訂消息協議
(2)需要處理黏包的問題
 */

/*
 Socket.io
 
 為了解決web即時通訊而誕生的
 socket.io跟websocket不太一樣，它不屬於通用的協議
 它是一個框架一個類庫
 
 當時一些瀏覽器還不支持websocket協議的時候。
 socket.io會改選擇使用傳統的long polling(長輪詢)方式運作。
 如果支援的話，會升級成websocket的協議
 溝通之間的格式載體，雖然socket.io是建立在websocket之上，但是它有它自定義的溝通格式
 */

/*
 WebSocket
 
 應用層
 為了提升web通訊速度而被創造出來的一種「協議」，它是一種雙向通訊協議，是建立在TCP之上的。
 原理是瀏覽器底層使用「socket」當作通訊介面，通訊協議才是採用它自身的「websocket協議」
 socket「黏包」的問題在這邊獲得了解決，以帧(Frame)為單位。
 瀏覽器使用的話，須注意瀏覽器版本是否支持
 
 首先，通過HTTP第一次握手保證連接成功。
 其次，再通過TCP實現瀏覽器與服務器全雙工(full-duplex)通信。（通過不斷髮ping包、pang包保持心跳）
 
 websocket要連上socket.io
    只要在host後面加上下面這行參數就可以進行連接。
    ws://{IP}:{PORT}/socket.io/?EIO=4&transport=websocket
 
 ws 表示基於TCP的 Websocket，預設使用 80埠。
 wss 則表示執行在 TLS 之上的 Websocket，預設使用 443埠。
 
 應用場景:  “實時性” 要求比較高的需求
    IM（即時通訊）例子：微信、QQ等
    遊戲（多人對戰） 例子：王者榮耀
    協同編輯（共享文檔）google雲端硬碟
    直播/視頻聊天
    股票/基金等金融交易平臺
    IoT（物聯網 / 智能家居）
 */







/*
 CocoaAsyncSocket套件   🟠結論：socket可以使用，有成功連線
    使用的VC: SocketTCPViewController & SocketUDPViewController
    測試服務端 ssokit https://www.jianshu.com/p/f159c26c8a80
    套件git https://github.com/robbiehanson/CocoaAsyncSocket
    教學參考 https://www.wpgdadatong.com/tw/blog/detail?BID=B0974
 
 優點：可支援TLS / SSL加密、線程安全、教學文多
 缺點：維護較少(還算是有在維護  2021 May)
 */


/*
 SwiftSocket套件   🟠結論：不支援swift3以上 無法使用
 */


/*
 Socket.IO-Client-Swift套件   🟠結論：目前無法測試
    使用的VC: SocketIOViewController
    套件git https://github.com/socketio/socket.io-client-swift
 
 優點：是可支援TLS / SSL加密、支持Polling and WebSockets
 */


/*
 原生方式Websocket   🟠結論：測試時可以使用，有成功連線。不支援ios13.0以下，除非產品高於此，否則無法使用。
    使用的VC: WebSocketViewController
    測試服務端 http://www.websocket-test.com/
 優點：是ios自己的原生，也有很多文件，自由度較高
 缺點：不支援ios13.0以下，沒有套件封裝好看起來亂亂的
 */


/*
 SwiftWebSocket   🟠結論：測試時可以使用，有成功連線。不支援swift4.2以上，比較可惜，但單獨把文件加入到產品後再修改也可以用。
    使用的VC: SwiftWebSocketViewController
    套件git https://github.com/tidwall/SwiftWebSocket
 優點：可以直接呼叫func，也有監聽方法可以呼叫，摁對，就很一般封裝好的套件，比原生好一點
 缺點：文件挺少的，使用方法不直覺，感覺沒人在維護，程式碼沒有更新到swift5
 */


/*
 Starscream   🟠結論：測試時可以使用，有成功連線。目前首選
    使用的VC: StarscreamWebSocketViewController
    套件git https://github.com/daltoniam/Starscream
 優點：可以使用委託或閉包來處理事件，簡單易懂、可支援SSL加密、有支援到ios10&swift5
 缺點：
 */









import UIKit
class ViewController: UIViewController {
//    static let testIP = "121.40.165.18"
//    static let testPort = "8800"
    
    let testIP = "169.254.68.33"
    let testPort = "3000"
    let testWebSocketIP = "ws://121.40.165.18:8800"
    
    func testImgData() -> Data {
        var imageData: Data
        let quality: CGFloat = 0.8
        let presetImage = UIImage(named: "member_image_user2")!
        imageData = presetImage.jpegData(compressionQuality: quality)!
        return imageData
    }
    
    func dateStr() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.string(from: now)
        return date
    }
    
    @objc func didClickBackBtn() {
        self.dismiss(animated: true, completion: nil)
    }
}
extension UITextView {
    func scrollToBottom() {
        let textCount: Int = text.lengthOfBytes(using: String.Encoding.utf8)
        guard textCount >= 1 else { return }
        scrollRangeToVisible(NSMakeRange(textCount - 1, 1))
    }
    
    func showMsg(_ str: String) {
        self.text = self.text.appendingFormat("%@\n", str)
        self.scrollToBottom()
    }
}
extension Data {
    struct HexEncodingOptions: OptionSet {
        let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }

    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return self.map { String(format: format, $0) }.joined()
    }
}
