<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<head>
	<title><@spring.message code="label.scoreshared"/></title>
</head>
<body>

<div>
	Bem-vindo,
	<ul>
		<li>Bernardo</li>
		<li>Perfil</li>
		<li>Configurações da Conta</li>
		<li>Sair</li>
	</ul>
	<img>
	<ul>
		<li>Mensagens</li>
		<li>Contato: <a href="#">Rodrigo</a> <a href="#">Aceitar</a> <a href="#">Ignorar</a></li>
		<li>Contato: <a href="#">Felipe Freitas</a> <a href="#">Aceitar</a> <a href="#">Ignorar</a></li>
		<li>Aprovação: <a href="#">Diogo</a> 6x4 <a href="#">Aceitar</a> <a href="#">Ignorar</a> <a href="#">Pedir revisão</a></li>
		<li>Revisão: <a href="#">Diogo</a> 6x4 <a href="#">Revisar</a> <a href="#">Ignorar</a></li>
		<li><a href="#">Ver todas as mensagens</a></li>
	</ul>
</div>

<div>
	<table>
		<thead>
			<tr>
				<td colspan="3">Meus últimos resultados</td>
			</tr>
		</thead>
		<tr>
			<td>6x4, contra Felipe Freitas</td>
			<td><img></td>
			<td><img></td>
		</tr>
		<tr>
			<td>4x6, contra Rodrigo</td>
			<td><img></td>
			<td><img></td>
		</tr>
		<tr>
			<td>6x4, contra Rodrigo Soalheiro</td>
			<td><img></td>
			<td><img></td>
		</tr>
	</table>
	<a>Ver todos os resultados</a>
</div>

<div>
	<form>
		<img /> <input type="image">
	</form>
</div>

</body>
</html>