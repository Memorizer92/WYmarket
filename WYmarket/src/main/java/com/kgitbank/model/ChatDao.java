package com.kgitbank.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
 

@Component 
public class ChatDao {

	private List<ChatMessage> chatMessages;
	
	ChatDao(){
		chatMessages = new ArrayList<>();
	}
	
	public void addMessage(int roomId, String writer, String body) {
		int newId=chatMessages.size()+1;
		ChatMessage aChatMessage = new ChatMessage(newId, roomId, writer, body);
		
		chatMessages.add(aChatMessage);
		 
	}

	public List getMessages() {
		 
		
		return chatMessages;
	}

	public List getMessagesFrom(int roomId, int from) {
		 List<ChatMessage> messages = new ArrayList();
		 for(ChatMessage chatMessage : chatMessages) {
			 if(chatMessage.getRoomId()==roomId && chatMessage.getId() >=from) {
				 messages.add(chatMessage);
			 }
		 }
		
		return messages;
	}

	public void clearAllMessages() {
		chatMessages.clear();

		
	}

}
