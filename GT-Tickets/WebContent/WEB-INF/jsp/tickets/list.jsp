<%@ include file="/WEB-INF/jsp/common/include.jsp" %>

<style type="text/css">

	#divContent {
		background-color: #F6F6F6;
	}

	div {
		font-family: Arial;
		font-size: 16px;
	}

	select {
		width: 160px;
	}

	.ticket {
		float: left;
		margin: 10px;
		padding: 10px;
		width: 170px;
		height: 280px;
		
		background: url(../../img/ticket_bg.png) center top no-repeat;
	}

	.tkTitulo {
		text-align: center;
		font-size: 20px;
		font-weight: bold;
		color: #1F4E79;
	}
	
	.tkDatalocal {
		text-align: center;
	}
	
	.tkDescricao {
		margin-top: 10px;
		height: 100px;
	}
	
	.tkOpcoes {
		margin-top: 32px;
		text-align: center;
	}
	
</style>

<script type="text/javascript">
	$(function() {
		
		if ($("#idCliente").val() == "")
			$(".btnComprar").hide();
		
		callAjax("../Ticket/retrieve", formSerialize($("form")), function(data){
			if (data.result != undefined) {
				for (i = 0; i < data.result.length; i++) {
					var divTK = $("<div class='ticket'></div>");
					var newHtml = $(".ticketEx").html();
					
					newHtml = newHtml.replace("[TITULO]", data.result[i].evenDsTitulo);
					newHtml = newHtml.replace("[LOCAL]", data.result[i].evenDsLocal);
					newHtml = newHtml.replace("[DATA]", data.result[i].evenDhEvento);
					newHtml = newHtml.replace("[DESCRICAO]", data.result[i].evenDsDescricao);
					newHtml = newHtml.replace("##", data.result[i].idEvenCdEvento);
					newHtml = newHtml.replace("#!#", data.result[i].idEvenCdEvento);
					
					divTK.html(newHtml);
					
					if (data.result[i].evenDsTitulo.length > 16) {
						divTK.find(".tkOpcoes").css("margin-top", "10px");
					}
					
					$("form").append(divTK);
					
					var newOption;
					var txtOption;
					for (j = 0; j < data.result[i].tickets.length; j++) {
						txtOption = data.result[i].tickets[j].tickDsDescricao;
						if (data.result[i].tickets[j].tickNrDisponivel > 0)
							txtOption = txtOption +" (R$ "+ data.result[i].tickets[j].tickNrValor +")";
						else
							txtOption = txtOption +" (ESGOTADO)";
						
						newOption = $("<option value='"+ data.result[i].tickets[j].idTickCdTicket +"' "+
								"valor='"+ data.result[i].tickets[j].tickNrValor +"' "+
								"qtd='"+ data.result[i].tickets[j].tickNrDisponivel +"' "+
								"dsEvento='"+ data.result[i].evenDsTitulo +"' "+
								"dtEvento='"+ data.result[i].evenDhEvento +"' >"+ txtOption +"</option>");
						$("#cmbOpcao"+ data.result[i].idEvenCdEvento).append(newOption);
					}
				}
			}
		});
		
		retrieve();
	});
	
	function comprar(id) {
		
		if ($("#cmbOpcao"+ id)[0].options[$("#cmbOpcao"+ id)[0].selectedIndex].getAttribute("qtd") == "0") {
			showDialog(TYPE_INFORMATION, "Ticket", "Este ingresso est� esgotado, tente outra op��o.");
		}
		else {
			showDialog(TYPE_QUESTION, "Ticket", "Confirma a compra desse ingresso?", function () {
				compraFase1(id);
			});
		}
	}
	
	function compraFase1(id) {
		waitMessage("Aguardando autoriza��o do cart�o de cr�dito");
		setTimeout(function() {compraFase2(id);}, 4000);
	}

	function compraFase2(id) {
		waitMessage("Estabelecendo conex�o com a casa de shows");
		setTimeout(function() {compraFase3(id);}, 3000);
	}
	
	function compraFase3(id) {
		callAjax("../Ticket/buy", "idTicket="+ $("#cmbOpcao"+ id).val() +
				"&valor="+ $("#cmbOpcao"+ id)[0].options[$("#cmbOpcao"+ id)[0].selectedIndex].getAttribute("valor") +
				"&dsEvento="+ $("#cmbOpcao"+ id)[0].options[$("#cmbOpcao"+ id)[0].selectedIndex].getAttribute("dsEvento") +
				"&dtEvento="+ $("#cmbOpcao"+ id)[0].options[$("#cmbOpcao"+ id)[0].selectedIndex].getAttribute("dtEvento"), function(data){
			
			showDialog(TYPE_CONFIRM, "Ticket", "Parab�ns, sua compra foi autorizada!", function() {
				openUrl("../Ticket/sales");
			});
		});
	}
	
</script>

<form:form action="../Ticket" modelAttribute="eventoTO" id="eventoForm" name="eventoForm">
	<form:hidden path="evenCdTipo" />
	<form:hidden path="evenDsTitulo" />
	
	<div class="ticketEx" style="display: none;">
		<div class="tkTitulo">[TITULO]</div>
		<div class="tkDatalocal">[LOCAL]<br/>([DATA])</div>
		<div class="tkDescricao">[DESCRICAO]</div>
		<div class="tkOpcoes">
			<select id="cmbOpcao##"></select>
			<button type="button" onclick="comprar('#!#');" style="margin-top: 5px;" class="btnComprar">Comprar</button>
		</div>
	</div>

</form:form>