<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<head>
<title><@spring.message code="label.scoreshared"/></title>
</head>
<body>
	<div>
		<input value="search"></input> Ordenar por <select>
			<option>Data</option>
			<option>Jogador</option>
			<option>Placar</option>
		</select> <select>
			<option>Ascendente</option>
			<option>Descendente</option>
		</select>
	</div>
	<table>
		<thead>
			<tr>
				<th>
					<input type="checkbox">
				</th>
				<th colspan="3"><img><img></th>
			</tr>
		</thead>

		<#list scores as item>
			<tr>
				<td>
					<input type="checkbox">
				</td>
				<td>${item.detailText}</td>
				<td>
					<#if item.comment??>
						<img src="<@spring.url relativeUrl="/img/text_align_justify.png"/>" title="${item.comment.description}"/>
					</#if>
				</td>
				<td>
					<#assign avatarHash>${item.sampleOpponentAvatar}</#assign>
					<#if avatarHash!="">
						<img src="<@spring.url relativeUrl="/app/avatar?${avatarHash}&small"/>"/>
					</#if>
				</td>
			</tr>
		</#list>
	</table>
</body>
</html>