var div_Messages = document.querySelector(".messages");
var prevCount = 0;
var count = 5;
var requestURL = '../data/messages_data.json';
var JSONdata;



fetch(requestURL, {cache: 'no-store'})
.then(function(response) {
	if (response.status !== 200) {  
		console.log('Looks like there was a problem. Status Code: ' + response.status);  
	return;  
	};

	response.json()
		.then(function(data) {
			JSONdata = data;
			fn_ShowMessages();
		});
})
.catch(function(err) {  
	console.log('Fetch Error :-S', err);  
});

function fn_ShowMessages (){
	var j = 0; //счетчик иттераций
	var str_mes1;
    var str_mes2;
    
    fn_DelNextBtn();	
	for (var i=JSONdata.length-1-prevCount; i!=JSONdata.length-1-prevCount-count; i--){
		if (i>=0){
			var div = document.createElement('div');
			div.className = 'messages__message';
			var p_Name = document.createElement('p');
			p_Name.textContent = JSONdata[i]['name'];
			p_Name.className = 'messages__name';
			var p_Date = document.createElement('p');
			p_Date.textContent = JSONdata[i]['date'] + '   ' + JSONdata[i]['time'];
			p_Date.className = 'messages__date';
			var pre_Message = document.createElement('pre');
			pre_Message.textContent =  JSONdata[i]['message'];
			pre_Message.className = 'messages__text';
			
			div_Messages.appendChild(div);
			div.appendChild(p_Name);
			div.appendChild(p_Date);
			div.appendChild(pre_Message);
			j++;
		} else {
			break;
		};
	};
	prevCount += j;
	var div_Controls = document.createElement('div');
	div_Controls.className = 'messages__controls';
    var div_Buttons = document.createElement('div');
	div_Buttons.className = 'messages__buttons';
	var btn_Next = document.createElement('button');
	btn_Next.textContent = 'Еще отзывы';
	btn_Next.className = 'messages__btn-next link__button';
	btn_Next.addEventListener('click', fn_ShowMessages);
	var btn_HideMes = document.createElement('button');
	btn_HideMes.textContent = 'Спрятать отзывы';
	btn_HideMes.className = 'messages__btn-hide-mes link__button';
	btn_HideMes.addEventListener('click', fn_HideMessages);
	var p_Next = document.createElement('p');
	switch (JSONdata.length-prevCount){
		case 1:
			str_mes1 = 'Остался еще '
            str_mes2 = ' отзыв';
			break;
		case 2:
		case 3:
		case 4:
            str_mes1 = 'Осталось еще '
			str_mes2 = ' отзыва';
			break;
		default:
            str_mes1 = 'Осталось еще '
			str_mes2 = ' отзывов';
			break;
	}
	p_Next.textContent = str_mes1+(JSONdata.length-prevCount)+str_mes2;
	p_Next.className = 'messages__p-next';
	div_Messages.appendChild(div_Controls);
	div_Controls.appendChild(div_Buttons);
    div_Controls.appendChild(p_Next);
    div_Buttons.appendChild(btn_Next);
	div_Buttons.appendChild(btn_HideMes);
		
};

function fn_DelNextBtn(){
	var div = document.querySelector('.messages__controls');
	if 	(div != null) {
		div_Messages.removeChild(div);
	};
};

function fn_HideMessages() {
	prevCount = 0;
	var arr_div = document.querySelectorAll('.messages__message');
	for (var i=0; i<arr_div.length; i++){
		div_Messages.removeChild(arr_div[i]);
	};
	fn_ShowMessages();
};