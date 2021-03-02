package com.kgitbank.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;



@Repository
public class ChatRoomRepository {
	
    private Map<String, ChatRoom> chatRoomMap = new HashMap<>();
	 
     
//    @PostConstruct
//    private void init(){
//        chatRoomMap = new LinkedHashMap<>();
//    }

    public List<ChatRoom> findAllRoom(){
    	System.out.println("널 문제 시작전전");
      	System.out.println("roommap value111 = "+chatRoomMap.values());
    	System.out.println("널 문제 시작전");
    	  ArrayList<ChatRoom> chatRooms = new ArrayList<>(chatRoomMap.values());
    		System.out.println("널 문제 시작후");
    		System.out.println("리버스 전 챗 룸"+chatRooms);
        Collections.reverse(chatRooms);
        System.out.println("리버스 후 챗 룸"+chatRooms);
        return chatRooms;
    }

    public ChatRoom findRoomById(String id){
    	
    	System.out.println("roommap value222 = "+chatRoomMap.values());
        return chatRoomMap.get(id);
    }

    public ChatRoom createChatRoom(String name){
    	System.out.println("방 생성 문제 전");
        ChatRoom chatRoom = ChatRoom.create(name);
        System.out.println("방 생성 문제 후 : "+chatRoom.getRoomId()+"/"+chatRoom);
        chatRoomMap.put(chatRoom.getRoomId(), chatRoom);
        return chatRoom;
    }
    
}
