//
//  SocketManager.swift
//  tickerApp
//
//  Created by Abhinav Singh on 12/1/18.
//  Copyright © 2018 Abhinav. All rights reserved.
//

import Starscream

class SocketManager: NSObject, WebSocketDelegate {
    
    
    var socket: WebSocket!
    var controller: ViewController?
    
    override init() {
        super.init()
        
        self.socket = WebSocket(url: URL(string: "wss://ws-ap2.pusher.com/app/9197b0bfdf3f71a4064e?protocol=7&client=js&version=4.1.0&flash=false")!)
        self.socket.delegate = self
        print("TRYING TO CONNECT")
        self.socket.connect()
        print("DONE TRYING")
    }
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocket is disconnected: \(error?.localizedDescription)")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        if let viewController = controller {
            viewController.parseCurrencyValue(text: text)
        }
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("Received data: \(data.count)")
    }
    
    func sendMessage() {
        socket.write(string: "{\"event\":\"pusher:subscribe\",\"data\":{\"channel\":\"my-channel-ticker-inr\"}}")
    }
    
}
