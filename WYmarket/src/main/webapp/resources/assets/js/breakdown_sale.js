const nickCheck = document.getElementById("nickCheck");
const titleRadioLabel = document.getElementById("titleRadioLabel");
const productReservationY = document.getElementById("ProductReservationY").value;
const productReservationN = document.getElementById("ProductReservationN").value;
const pullupCheck = document.getElementById("pup");
const closeDiv = document.querySelector(".modalDiv");
const closeBtn = document.querySelector(".modalCloseBtn");

var nonexistent = document.getElementById("nonexistent");
var istate;
var btntype;		
var radio_btn = document.getElementsByName("ititle");
var radio_btn_check = 0;
var idradio_btn = document.getElementsByName("itemid");
	



	if(radio_btn.length == 0){	
	nonexistent.style.display = 'block';
	nonexistent.innerText = '상품이 존재하지 않습니다.';
			var dis = document.querySelectorAll(".disabled");				
		dis.forEach(function(userItem) {
  		userItem.style.pointerEvents = 'none'; 
		userItem.style.opacity = '0.6'; 
		
});
}
		
	//판매내역에 보여지는 거래상품 버튼 클릭 이벤트(라디오 버튼 생성)	
    function productChoice() {		         
    	alert("해당 상품을 선택해 주세요.");	
		
		for(var i = 0; i < radio_btn.length; i++){
		radio_btn[i].style.display = 'inline';	   	    
}		
	document.getElementById("TransactionCompleted").style.display = 'inline-block'; // 거래상품 클릭시 생성되는 거래완료 버튼	
		var dis = document.querySelectorAll(".disabled");				
		dis.forEach(function(userItem) {
  		userItem.style.pointerEvents = 'none'; 
		userItem.style.opacity = '0.6'; 
		
});
	}
	
	// 판매내역에 보여지는 끌어올리기 버튼 클릭 이벤트 (라디오 버튼 생성)	
    function pullUp() {
    	btntype = 'pullup';
    	alert("해당 상품을 선택해 주세요.");	
        for( var i = 0; i < radio_btn.length; i++ ){
        		radio_btn[i].style.display = 'inline';
         }			
		document.getElementById("pullUpChoise").style.display = 'inline-block';	// 판매내역에 보여지는 끌어올리기 버튼 클릭시 생성되는 끌어올리기 버튼
		var dis = document.querySelectorAll(".disabled");	
		dis.forEach(function(userItem) {
  		userItem.style.pointerEvents = 'none'; 
		userItem.style.opacity = '0.6'; 
});     
	}
	
	
        
  	// 판매내역에 보여지는 상품숨기기 버튼 클릭 이벤트 (라디오 버튼 생성) 
    function hideenChoice() {
    	alert("해당 상품을 선택해 주세요.");	
    	btntype = '숨김';
        for( var i = 0; i < radio_btn.length; i++ ){  		
        		radio_btn[i].style.display = 'inline';
         }		
		document.getElementById("ProductHideen").style.display = 'inline-block';
		var dis = document.querySelectorAll(".disabled");			     
		dis.forEach(function(userItem) {
  		userItem.style.pointerEvents = 'none'; 
		userItem.style.opacity = '0.6'; 
});
				     
	} 
	  
 // 판매내역에 보여지는 예약 버튼 클릭 이벤트 (라디오 버튼 생성)
    function ReservationChoise() {	
    	alert("해당 상품을 선택해 주세요.");	
    	btntype = '예약';     	
        for( var i = 0; i < radio_btn.length; i++ ){  		
        		radio_btn[i].style.display = 'inline';
         }		        
		document.getElementById("ProductReservationY").style.display = 'inline-block';		     
		document.getElementById("ProductReservationN").style.display = 'inline-block';		     
		var dis = document.querySelectorAll(".disabled");			     
		dis.forEach(function(userItem) {
  		userItem.style.pointerEvents = 'none'; 
		userItem.style.opacity = '0.6'; 
});		
	} 
	
	
	 // 판매내역에 보여지는 상품삭제하기 버튼 클릭 이벤트 (라디오 버튼 생성)
	function productDeleteChoise() {	
    	alert("해당 상품을 선택해 주세요.");	
		btntype = 'delete'; 	
        for( var i = 0; i < radio_btn.length; i++ ){  		
        		radio_btn[i].style.display = 'inline';
         }		        
		document.getElementById("ProductDelete").style.display = 'inline-block';		     		     
		var dis = document.querySelectorAll(".disabled");			     
		dis.forEach(function(userItem) {
  		userItem.style.pointerEvents = 'none'; 
		userItem.style.opacity = '0.6'; 
});		
	} 
	
	
 	// open modal 이벤트
    function openModal() {
    	if(btntype == '예약' || btntype == '숨김' || btntype == 'pullup' || btntype == 'delete'){
    		console.log("예약 혹은 숨김");
    		document.querySelector(".modal").classList.add("hidden");   		
    		return;
    	}
        		document.querySelector(".modal").classList.remove("hidden");
    			nickCheck.value = null;	   			
	}
        
   
   // modal 확인 버튼 클릭시 close 이벤트 
    function checkCloseModal() {
    		var checknum = 0;	
    		var userNcik = document.getElementsByName("userNcik");   		
    		var confirm_test = confirm("입력하신 정보가 " + nickCheck.value + "이(가) 맞으십니까?");
    		if (confirm_test == true ) {   
    			for( var i = 0; i < userNcik.length; i++ ) {    				
    				if(nickCheck.value == userNcik[i].value){
    						if(nickCheck.value == "${usernick}"){
    							alert("잘못되 닉네임을 입력하셨습니다");
    							document.querySelector(".modal").classList.remove("hidden");
    			    			nickCheck.value = null;
    							return;
    						}else if(nickCheck.value != "${usernick}"){    							
    							document.querySelector(".modal").classList.add("hidden");
    							checknum = 1;  
    							
    							return;
    						}
    					}// 첫 if문
    					else{
    						checknum = 0;
    					}

    				} // for end
    				if(checknum == 0){
    					 alert("존재하지 않는 닉네임입니다.");
    					 document.querySelector(".modal").classList.remove("hidden");
    		    		nickCheck.value = null;
    				}
			    } else if ( confirm_test == false ) {
			    	document.querySelector(".modal").classList.remove("hidden");
	    			nickCheck.value = null;
	    			return;
			    }/* 입력한 닉네임이 일치 하는지 YES / NO */
    			
    	} /* checkCloseModal end*/
    	  
    
    // modal창에서 div태그 클릭시 close 이벤트
	closeDiv.addEventListener('click', (e) => {
		document.querySelector(".modal").classList.add("hidden");
		for(var i = 0; i<radio_btn.length; i++){
			 if(radio_btn[i].checked==true){
				radio_btn[i].checked=false;
	}   			
  }
	});
		
    // modal창에서 X버튼 클릭시 close 이벤트	
	closeBtn.addEventListener('click', (e) => {
		document.querySelector(".modal").classList.add("hidden");
		for(var i = 0; i<radio_btn.length; i++){
			 if(radio_btn[i].checked==true){
				radio_btn[i].checked=false;
	}   			
  }
		});
