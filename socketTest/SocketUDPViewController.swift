//
//  SocketUDPViewController.swift
//  socketTest
//
//  Created by  on 2022/7/12.
///CocoaAsyncSocket

import UIKit
import CocoaAsyncSocket

class SocketUDPViewController: ViewController {
    
    @IBOutlet var views: SocketUDPViews!
    
    var udpSocket: GCDAsyncUdpSocket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        udpSocket = GCDAsyncUdpSocket(delegate: self, delegateQueue: DispatchQueue.main)
        setupUI()
    }
    
    private func setupUI() {
        views.ipTextfield.text = testIP
        views.portTextfield.text = testPort
        views.bindButton.addTarget(self, action: #selector(didClickBindBtn), for: .touchUpInside)
        views.sendButton.addTarget(self, action: #selector(didClickSendBtn), for: .touchUpInside)
        views.clearButton.addTarget(self, action: #selector(didClickClearBtn), for: .touchUpInside)
        views.backBtn.addTarget(self, action: #selector(didClickBackBtn), for: .touchUpInside)
    }
    
    @objc private func didClickBindBtn() {
        let porsStr: String = views.portTextfield.text ?? "0"
        let port: UInt16 = UInt16(porsStr) ?? 0
        do {
            try udpSocket.bind(toPort: port)
            views.resultTextView.showMsg(dateStr())
            views.resultTextView.showMsg("已綁定窗口： " + porsStr)
            views.resultTextView.showMsg("===========================")
        } catch {
            views.resultTextView.showMsg("❌綁定窗口失敗")
        }
        
        do {
            try udpSocket.enableBroadcast(true)
            views.resultTextView.showMsg("廣播")
        } catch {
            views.resultTextView.showMsg("無法廣播")
        }
        
        do {
            try udpSocket.beginReceiving()
            views.resultTextView.showMsg("開始進行接收")
        } catch {
            views.resultTextView.showMsg("無法開始進行接收")
        }
        
        view.endEditing(true)
    }
    
    @objc private func didClickSendBtn() {
        let data = views.dataTextfield.text?.data(using: .utf16)
        let porsStr: String = views.portTextfield.text ?? "0"
        let port: UInt16 = UInt16(porsStr) ?? 0
        let ip: String = views.ipTextfield.text ?? ""
        views.resultTextView.showMsg(dateStr() + "\nClient: " + (views.dataTextfield.text ?? "") + "\n")
        udpSocket.send(data!, toHost: ip, port: port, withTimeout: -1, tag: 0)
        views.dataTextfield.text = ""
        view.endEditing(true)
    }
    
    @objc private func didClickClearBtn() {
        views.dataTextfield.text = ""
    }
}

extension SocketUDPViewController: GCDAsyncUdpSocketDelegate {
    //接收Host端的相關訊息
    func udpSocket(_ sock: GCDAsyncUdpSocket, didReceive data: Data, fromAddress address: Data, withFilterContext filterContext: Any?) {
        var host: NSString?
        var port: UInt16 = 0
        let text = String(data: data, encoding: .utf16) ?? ""
        GCDAsyncUdpSocket.getHost(&host, port: &port, fromAddress: address)
        views.resultTextView.showMsg("From: \(host!)")
        views.resultTextView.showMsg(dateStr() + "\n✈️Server: " + text + "\n")
    }
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didNotConnect error: Error?) {
        print("[Debug] 未連線成功 \(error!)")
        views.resultTextView.showMsg("未連線成功")
    }
    
    func udpSocketDidClose(_ sock: GCDAsyncUdpSocket, withError error: Error?) {
        print("[Debug] 斷開連接 \(error!)")
        views.resultTextView.showMsg("斷開連接")
    }
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didSendDataWithTag tag: Int) {
        views.resultTextView.showMsg("訊息發送成功")
    }
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didNotSendDataWithTag tag: Int, dueToError error: Error?) {
        print("[Debug] 訊息發送失敗 \(error!)")
        views.resultTextView.showMsg("訊息發送失敗")
    }
}
