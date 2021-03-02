package com.kgitbank.model;

 

import lombok.Data;

@Data
public class ChatVO {
	   private String chatRoomId;
	    private String writer;
	    private String message;
	    private MessageType type;
	    
	     
	    
}
