<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- If you delete this tag, the sky will fall on your head -->
<meta name="viewport" content="width=device-width" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome to scoreshared!</title>
</head>
 
<body bgcolor="#FFFFFF">

<table class="head-wrap">
	<tr>
		<td></td>
		<td>

			<!-- BODY -->
			<table class="body-wrap">
				<tr>
					<td></td>
					<td class="container" bgcolor="#FFFFFF">
			
						<div class="content">
						<table width="100%">
							<tr>
								<td>
									<p>Olá!</p>
									<p>Você foi convidado para o Scoreshared por ${userName}.</p>
									<p>Essa é a mensagem que ${userName} enviou a você:</p>
									<p></p><i>${message}</i></p:

									<p>Se você quiser aceitar o convite e começar a acompanhar seus resultados, clique no link a seguir:</p>
									<p><a href="http://${http_server_address_port}/app/signup/receiveInvitation/${invitationHash}">http://${http_server_address_port}/app/signup/receiveInvitation/${invitationHash}</a>.</p>

									<p>Atenciosamente,<br/>Scoreshared team</p>

									<!-- social & contact -->
									<table class="social" width="100%">
										<tr>
											<td>
												<!--- column 1 -->
												<table align="left" class="column" width="15%">
													<tr>
														<td>				
															<h5 class="">Connect with us:</h5>
															<p class=""><a href="http://www.facebook.com/scoreshared" class="soc-btn fb"><img src="http://2km.com.br/scoreshared/img/newsletter/facebook.png" alt="Facebook"/></a> <a href="https://twitter.com/scoreshared" class="soc-btn tw"><img src="http://2km.com.br/scoreshared/img/newsletter/twitter.png" alt="Twitter"/></a></p>
														</td>
													</tr>
												</table><!-- /column 1 -->	
												
												<!--- column 2 -->
												<table align="left" class="column">
													<tr>
														<td>
															<h5 class="">Contact information:</h5>												
															<p>Email: <strong><a href="emailto:contact@scoreshared.com">contact@scoreshared.com</a></strong></p>
														</td>
													</tr>
												</table><!-- /column 2 -->

												<span class="clear"></span>	
											</td>
										</tr>
									</table><!-- /social & contact -->
								
								
								</td>
							</tr>
						</table>
						</div>
												
					</td>
					<td></td>
				</tr>
			</table><!-- /BODY -->
		
		</td>
	</tr>
</table>

</body>
</html>