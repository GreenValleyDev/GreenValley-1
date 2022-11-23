$(function(){

	let actionContainer = $("#actionmenu");
	let actionButtom = $("#actionbuttom");

	window.addEventListener('message',function(event){
		let item = event.data;
		switch(item.action){
			case "showMenu":
				actionContainer.fadeIn(300);
				actionButtom.fadeIn(300);
				updateSearch()
				updateUserData()
				$('#homes').hide();
				$('#searchs').show();
				$('#info-result').hide();
				$('#warnings').hide();
				$('#plates').hide();
				$('#plate-result').hide();
				$('#tickets').hide();
				$('#arrests').hide();
				$('#fines').hide();
				break;
			case "hideMenu":
				actionContainer.fadeOut(300);
				location.reload();
				actionButtom.fadeOut(300);
				break;
		}
	});

	document.onkeyup = function(data){
		if (data.which == 27){
			$.post("http://black_tablet/blackClose",JSON.stringify({}),function(datab){});
		}
	};
});

$(document).on('click','#actionbuttom',function(){
	$.post("http://black_tablet/blackClose",JSON.stringify({}),function(datab){});
});

const formatarNum = (n) => {
	var n = n.toString();
	var r = '';
	var x = 0;

	for (var i = n.length; i > 0; i--) {
		r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? "." : "");
		x = x == 2 ? 0 : x + 1;
	}

	return r.split('').reverse().join('');
}

var userIdentidade = ""
var userId = ""

const updateUserData = () => {
	$.post("http://black_tablet/userData", JSON.stringify({}), data => {
		userId = data.userId;
		userIdentidade = data.userIdentidade;
		$(".officer_id").val(userIdentidade).attr('disabled', true);

		var today = new Date();
		var dd = String(today.getDate()).padStart(2, '0');
		var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
		var yyyy = today.getFullYear();

		today = dd + '/' + mm + '/' + yyyy;
		$(".date-form").val(today).attr('disabled', true);
	});
};

const updateSearch = () => {
	$('#search-result').html(`
		<div id="top">
			<div id="icon-date"></div>
			<div id="icon-date"></div>
			<div id="text"> <h2>Pesquisar informações dos cidadãos</h2> <h2 id="ping">*</h2> </div>
			<div id="pass"> <h3>Passaporte do cidadão</h3> </div>
			<input class="user" id="user_id" maxlenght="9" spellcheck="false" value="" placeholder="Passaporte">
			<input class="user-id date-form" id="data-war" maxlenght="9" spellcheck="false" value="" placeholder="DATA">
			<div id="linha"></div>
			<div id="linha2"></div>
			<div id="text2"> <h2>Resultado </h2> </div>
		</div>
		<div class="search-itens">
			<div class="info"></div>
		</div>
	`);
}

const infoUser = (user) => {
	$.post('http://black_tablet/infoUser',JSON.stringify({user}),(data) => {
		$('#text2').show();
		$('#info-result').html(`
			<div class="info-left">
				<div class="parts-one"><r>Nome do cidadão: <br> </r> <h3 class="style">${data.name}</h3></div>
				<div class="parts-two"><r>Sobrenome do cidadão:<br> </r> <h3 class="style">${data.lastname}</h3></div> 
				<div class="parts-tree"><r>Telefone do cidadão: <br> </r> <h3 class="style">${data.telefone}</h3></div>
			</div>
			<div id="profile">${(data.img ? "<div id='profilec' style='background-image: url("+data.img+")'></div>" : '')}</div>
			<div class="info-right">
				<div class="parts-one"><r>Placa do veiculo do mesmo: <br> </r> <h3 class="style2">${data.identity}</h3></div> 
				<div class="parts-two"><r>Multas do cidadão: <br> </r> <h3 class="style2">R$ ${(data.tickets)},00</h3></div> 
				<div class="parts-tree"><r>Cidadão réu primário: <br> </r> <h3 class="style2">${(data.arrests ? "<div class='nao'>Não</div>" : "<div class='sim'>Sim</div>")}</h3></div>
			</div>
		`);	
	});
}

const arrestsUser = (user) => {
	$.post('http://black_tablet/arrestsUser',JSON.stringify({user}),(data) => {
		const itens = data.arrests.sort((a,b) => (a.name > b.name) ? 1: -1);
		$('#info-result2').html(`
			<div class="sub-bar">
				<div class="title-one">DATA</div>
				<div class="title-two">TEMPO</div>
				<div class="title-tree">CRIMES</div>
				<div class="title-four">OFICIAL</div>
			</div>
			<div class="itens">
				${itens.map((item) => (`
					<div class="item">
						<div class="itens-one">${item.data}</div>
						<div class="itens-two">${item.value} meses</div>
						<div class="itens-tree">${item.info}</div>
						<div class="itens-four">${item.officer}</div>
					</div>
				`)).join('')}
			</div>
		`);	
	});
}

const finesUser = (user) => {
	$.post('http://black_tablet/finesUser',JSON.stringify({user}),(data) => {
		const itens = data.tickets.sort((a,b) => (a.name > b.name) ? 1: -1);
		$('#info-result5').html(`
			<div class="sub-bar">
				<div class="title-one">DATA</div>
				<div class="title-two">TEMPO</div>
				<div class="title-tree">CRIMES</div>
				<div class="title-four">OFICIAL</div>
			</div>
			<div class="itens">
				${itens.map((item) => (`
					<div class="item">
						<div class="itens-one">${item.data}</div>
						<div class="itens-two">$${formatarNum(item.value)} meses</div>
						<div class="itens-tree">${item.info}</div>
						<div class="itens-four">${item.officer}</div>
					</div>
				`)).join('')}
			</div>
		`);	
	});
}

const ticketsUser = (user) => {
	$.post('http://black_tablet/ticketsUser',JSON.stringify({user}),(data) => {
		const itens = data.tickets.sort((a,b) => (a.name > b.name) ? 1: -1);
		$('#info-result3').html(`
			<div class="sub-bar">
				<div class="title-one">DATA</div>
				<div class="title-two">VALOR</div>
				<div class="title-tree">MOTIVOS</div>
				<div class="title-four">OFICIAL</div>
			</div>
			<div class="itens">
				${itens.map((item) => (`
					<div class="item">
						<div class="itens-one">${item.data}</div>
						<div class="itens-two">$${formatarNum(item.value)}</div>
						<div class="itens-tree">${item.info}</div>
						<div class="itens-four">${item.officer}</div>
					</div>
				`)).join('')}
			</div>
		`);	
	});
}

const warningsUser = (user) => {
	$.post('http://black_tablet/warningsUser',JSON.stringify({user}),(data) => {
		const itens = data.warnings.sort((a,b) => (a.name > b.name) ? 1: -1);
		$('#info-result4').html(`
			<div class="sub-bar">
				<div class="warning-title-one">DATA</div>
				<div class="warning-title-two">MOTIVOS</div>
				<div class="warning-title-tree">OFICIAL</div>
			</div>
			<div class="itens">
				${itens.map((item) => (`
					<div class="item">
						<div class="warning-itens-one">${item.data}</div>
						<div class="warning-itens-two">${item.info}</div>
						<div class="warning-itens-tree">${item.officer}</div>
					</div>
				`)).join('')}
			</div>
		`);	
	});
}

const updatePlate = () => {
	$('#plate-result').html(`
		<div id="top">
			<div id="icon-date"></div>
			<div id="icon-date"></div>
			<div id="text"> <h2>Pesquisar informações dos cidadãos</h2> <h2 id="ping">*</h2> </div>
			<div id="pass"> <h3>Passaporte do cidadão</h3> </div>
			<input class="user" id="user_id" maxlenght="9" spellcheck="false" value="" placeholder="Passaporte">
			<input class="user-id date-form" id="data-war" maxlenght="9" spellcheck="false" value="" placeholder="DATA">
			<div id="text2"> <h2>Resultado </h2> </div>
			<div id="linha"></div>
			<div id="linha2"></div>
		</div>
		<div class="plate-itens">
			<div class="info"></div>
		</div>
	`);
}

const plateUser = (user) => {
	$.post('http://black_tablet/plateUser',JSON.stringify({user}),(data) => {
		$('#info-result').html(`
			<div class="info-left">
				<div class="parts-one"><r>Nome do cidadão: <br> </r> <h3 class="style">${data.name}</h3></div>
				<div class="parts-two"><r>Sobrenome do cidadão:<br> </r> <h3 class="style">${data.lastname}</h3></div> 
				<div class="parts-tree"><r>Telefone do cidadão: <br> </r> <h3 class="style">${data.telefone}</h3></div>
			</div>
			<div class="info-right">
				<div class="parts-one"><r>Placa do veiculo do mesmo: <br> </r> <h3 class="style2">${data.identity}</h3></div> 
				<div class="parts-two"><r>Multas do cidadão: <br> </r> <h3 class="style2">R$ ${(data.tickets)},00</h3></div> 
				<div class="parts-tree"><r>Cidadão réu primário: <br> </r> <h3 class="style2">${(data.arrests ? "<div class='nao'>Não</div>" : "<div class='sim'>Sim</div>")}</h3></div>
			</div>
		`);	
	});
}

$(document).on('click','.info',function(){
	let identity = ($('#user_id').val());
	$('#info-result').show();
	$('#info-result-plates').hide();
	if(identity > 0) {
		infoUser(identity)
	}
});

$(document).on('click','.info2',function(){
	let user_id = Number($('#user_id').val());
	$('#info-result').hide();
	$('#info-result-plates').show();
	if(user_id > 0) {
		plateUser(user_id)
	}
});

$(document).on('click','.arrests',function(){
	let user_id = Number($('#user_id').val());
	$('#info-result').hide();
	$('#info-result2').show();
	$('#info-result3').hide();
	$('#info-result4').hide();
	if(user_id > 0) {
		arrestsUser(user_id)
	}
});

$(document).on('click','.tickets',function(){
	let user_id = Number($('#user_id').val());
	$('#info-result').hide();
	$('#info-result2').hide();
	$('#info-result3').show();
	$('#info-result4').hide();
	if(user_id > 0) {
		ticketsUser(user_id)
	}
});

$(document).on('click','#search',function(){
	document.getElementById("search").style.backgroundColor = '#0cb67d';
	/* document.getElementById("home").style.backgroundColor = '#00003d'; */
	document.getElementById("arrest").style.backgroundColor = '#00003d';
	document.getElementById("fine").style.backgroundColor = '#00003d';
	$('#warnings').hide();
	$('#homes').hide();
	$('#tickets').hide();
	$('#arrests').hide();
	$('#fines').hide();
	$('#searchs').show();
	$('#plates').hide();
});

/* $(document).on('click','#home',function(){
	document.getElementById("search").style.backgroundColor = '#00003d';
	document.getElementById("home").style.backgroundColor = '#0cb67d';
	document.getElementById("arrest").style.backgroundColor = '#00003d';
	document.getElementById("fine").style.backgroundColor = '#00003d';
	$('#warnings').hide();
	$('#searchs').hide();
	$('#tickets').hide();
	$('#arrests').hide();
	$('#fines').hide();
	$('#plates').hide();
	$('#homes').show();
}); */

$(document).on('click','#warning',function(){
	$('#searchs').hide();
	$('#tickets').hide();
	$('#arrests').hide();
	$('#fines').hide();
	$('#plates').hide();
	$('#homes').hide();
	$('#warnings').show();
});

$(document).on('click','#ticket',function(){
	$('#searchs').hide();
	$('#warnings').hide();
	$('#arrests').hide();
	$('#fines').hide();
	$('#plates').hide();
	$('#homes').hide();
	$('#tickets').show();
});

$(document).on('click','#arrest',function(){
	document.getElementById("search").style.backgroundColor = '#00003d';
	/* document.getElementById("home").style.backgroundColor = '#00003d'; */
	document.getElementById("arrest").style.backgroundColor = '#0cb67d';
	document.getElementById("fine").style.backgroundColor = '#00003d';
	$('#searchs').hide();
	$('#warnings').hide();
	$('#tickets').hide();
	$('#fines').hide();
	$('#plates').hide();
	$('#homes').hide();
	$('#arrests').show();
});

$(document).on('click','#fine',function(){
	document.getElementById("search").style.backgroundColor = '#00003d';
	/* document.getElementById("home").style.backgroundColor = '#00003d'; */
	document.getElementById("arrest").style.backgroundColor = '#00003d';
	document.getElementById("fine").style.backgroundColor = '#0cb67d';
	$('#searchs').hide();
	$('#warnings').hide();
	$('#tickets').hide();
	$('#arrests').hide();
	$('#plates').hide();
	$('#homes').hide();
	$('#fines').show();
});

$(document).on('click','#plate',function(){
	$('#searchs').hide();
	$('#warnings').hide();
	$('#tickets').hide();
	$('#arrests').hide();
	$('#fines').hide();
	$('#homes').hide();
	$('#plates').show();
});


$(document).on('click','.confirmar-warning',function(){
	let user = Number($('#user-war').val());
	let date = $('#data-war').val();
	let info = $('#info-war').val();
	if(user > 0) {
		$.post('http://black_tablet/warningUser',JSON.stringify({
			user,
			date,
			info
		}));
	}
});

$(document).on('click','.confirmar-fine',function(){
	let user = Number($('#user-tick').val());
	let value = Number($('#value-tick').val());
	let date = $('#data-tick').val();
	let info = $('#info-tick').val();
	$.post("http://black_tablet/blackClose",JSON.stringify({}),function(datab){});
	if(user > 0) {
		$.post('http://black_tablet/ticketUser',JSON.stringify({
			user,
			value,
			date,
			info
		}));
	}
});

$(document).on('click','.confirmar-arrest',function(){
	let user = Number($('#user-arre').val());
	let value = Number($('#value-arre').val());
	let date = $('#data-arre').val();
	let info = $('#info-arre').val();
	$.post("http://black_tablet/blackClose",JSON.stringify({}),function(datab){});
	if(user > 0) {
		$.post('http://black_tablet/arrestUser',JSON.stringify({
			user,
			value,
			date,
			info
		}));
	}
});

function validate(evt) {
  var theEvent = evt || window.event;

  // Handle paste
  if (theEvent.type === 'paste') {
      key = event.clipboardData.getData('text/plain');
  } else {
  // Handle key press
      var key = theEvent.keyCode || theEvent.which;
      key = String.fromCharCode(key);
  }
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
}

function somar() {
	var result = $("input:checked");
	var total = 0;

	for (var i=0; i<result.length; i++)
	{
		total = total + parseFloat(result[i].value);
	}
	$(".result").val(total.toFixed(0));
}

somar();
	$(":checkbox").click(somar);


	$(document).on('click', '#profile', '#alterar', function(e) {
		e.preventDefault();
		$("#actionmenu").css("display", "none")
		$("buttom").css("display", "none")
		$.post('http://black_tablet/PostNewImage', JSON.stringify({}),
			function (url) {
			$("#actionmenu").css("display", "block")
			$("buttom").css("display", "block")
			let user = Number($('#user_id').val());
			let value = url
			let date = 3
			let info = 4
			$.post('http://black_tablet/GetProfilePicture',JSON.stringify({
				user,
				value,
				date,
				info
			}));
		});
	},
);