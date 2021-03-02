package com.kgitbank.util;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kgitbank.model.ChatVO;
import com.kgitbank.model.MessageType;

import lombok.Data;

@Data
public class ChatRoom {
    private String roomId;
    private String name;
    private Set<WebSocketSession> sessions = new HashSet<>();

    public static ChatRoom create(String name){
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.roomId = UUID.randomUUID().toString();
        chatRoom.name = name;
        return chatRoom;
    }

    public void handleMessage(WebSocketSession session, ChatVO chatMessage,
                              ObjectMapper objectMapper) throws IOException {
    	System.out.println("전 session : " +session);
    	sessions.add(session);
        if(chatMessage.getType() == MessageType.ENTER){
        	System.out.println(" session : " +session);
        	 
            chatMessage.setMessage(chatMessage.getWriter() + "님이 입장하셨습니다.");
        }
        else if(chatMessage.getType() == MessageType.LEAVE){
            sessions.remove(session);
            chatMessage.setMessage(chatMessage.getWriter() + "님이 퇴장하셨습니다.");
        }
        else{
        	
        	System.out.println("맞냐***********************");
        	System.out.println(chatMessage.getWriter() + " : " + chatMessage.getMessage());
            chatMessage.setMessage(chatMessage.getWriter() + " : " + chatMessage.getMessage());
        }
        send(chatMessage,objectMapper);
    }

    private void send(ChatVO chatMessage, ObjectMapper objectMapper) throws IOException {
    	System.out.println("도착");
        TextMessage textMessage = new TextMessage(objectMapper.
                                    writeValueAsString(chatMessage.getMessage()));
        System.out.println("textMessagetextMessage >>"+textMessage);
        for(WebSocketSession sess : sessions){
            sess.sendMessage(textMessage);
        }
    }
}