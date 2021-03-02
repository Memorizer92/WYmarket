package com.kgitbank.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kgitbank.model.Room;
import com.kgitbank.util.ChatRoom;
import com.kgitbank.util.ChatRoomRepository;

import lombok.Data;

@Controller
public class ChatController {

	List<Room> roomList = new ArrayList<Room>();
	static int roomNumber = 0;

	@GetMapping("/socket")
	public String socket(){
		return "socket";
	}
	
//	 private final ChatRoomRepository chatRoomRepository = new ChatRoomRepository();
//	 
//	 @GetMapping("/socket")
//	    public String rooms(Model model){
//	        model.addAttribute("rooms",chatRoomRepository.findAllRoom());
//	        System.out.println("roos안에 있는거 : "+chatRoomRepository.findAllRoom());
//	        return "rooms";
//	    }
//
//	    @GetMapping("/rooms/{id}")
//	    public String room(@PathVariable String id, Model model){
//         ChatRoom room = chatRoomRepository.findRoomById(id);
//	    
//	        System.out.println("아이디값 : "+id);
//	        System.out.println("findRoomById >>>"+chatRoomRepository.findRoomById(id));
//	        model.addAttribute("room",room);
//	        return "room";
//	    }
//
//	    @GetMapping("/new")
//	    public String make(Model model){
//	        ChatRoomForm form = new ChatRoomForm();
//	        model.addAttribute("form",form);
//	        return "newRoom";
//	    }
//
//	    @PostMapping("/room/new")
//	    public String makeRoom(ChatRoomForm form){
//	    	System.out.println("새로운 방 이름 문제 전");
//	    	System.out.println("새로운 방 이름 : "+form.getName());
//	        chatRoomRepository.createChatRoom(form.getName());
//
//	        return "redirect:/socket";
//	    }
	   

	@GetMapping("/echo3")
	public String echo3() {
		return "echo3";
	}

	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}

	/**
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room1")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("room1");
		return mv;
	}

	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom")
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			Room room = new Room();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		System.out.println(roomList); 
		return roomList;
	}

	/**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 */
	@RequestMapping("/getRoom")
	public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}

	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));

		List<Room> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber"));
			mv.setViewName("chat");
		}else {
			mv.setViewName("room1");
		}
		return mv;
	}
}