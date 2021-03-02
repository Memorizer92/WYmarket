package com.kgitbank.util;

 
 
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component; 
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kgitbank.model.ChatVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component 
@RequiredArgsConstructor
public class WebSocketHandler extends TextWebSocketHandler {
	
	private final ChatRoomRepository chatRoomRepository = new ChatRoomRepository();
	private final ObjectMapper objectMapper = new ObjectMapper(); 
	 
//    private List<WebSocketSession> sessions = new ArrayList<>();
// 
//    @Override
//    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//        sessions.add(session);
//        log.info("접속 : {}",  session);
//    }
 
//    @Override
//    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//        log.info("메세지 전송 = {} : {}",session,message.getPayload());
//        for(WebSocketSession sess : sessions){
//            TextMessage msg = new TextMessage(message.getPayload());
//            sess.sendMessage(msg);
//        }
//    }
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.info("메세지 전송 = {} : {}",session,message.getPayload());
       
        String msg = message.getPayload();
        ChatVO chatMessage = objectMapper.readValue(msg,ChatVO.class);
        ChatRoom chatRoom = chatRoomRepository.createChatRoom(chatMessage.getChatRoomId());
         
//         ChatRoom chatRoom = chatRoomRepository.findRoomById(chatMessage.getChatRoomId());
//        ChatRoom chatRoom = new ChatRoom();
         System.out.println("chatRoom >> "+chatRoom);
        System.out.println(chatMessage.getChatRoomId());
        System.out.println("msg>>>"+msg);
        System.out.println("세션>>>"+session);
        System.out.println("chatMessage>>>"+chatMessage);
        System.out.println("objectMapper>>>"+objectMapper);
        chatRoom.handleMessage(session,chatMessage,objectMapper);
        System.out.println("세션>>>"+session);
        System.out.println("msg>>>"+msg);
    }
 
//    @Override
//    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//        sessions.remove(session);
//        log.info("퇴장 : {}",  session);
//    }
}
