<html>

	Select the scores you want to import from Fulano de Tal
	<table>
		<thead>
			<tr>
				<th>
					<input type="checkbox" id="master" />
				</th>
				<th style="text-align: left;">
					<a href="#" id="edit"><img src="<@spring.url relativeUrl="/img/page_edit.png"/>" /></a>
					<a href="#" id="delete"><img src="<@spring.url relativeUrl="/img/bin.png"/>" /></a>
				</th>
			</tr>
		</thead>

		<tbody>
		<#list scores as item>
			<tr>
				<td>
					<input type="checkbox" id="${item.score.id}">
				</td>
				<td>
					${item.dateTime}
				</td>
				<td>${item.detailText}</td>
				<td>
					<#if item.comment??>
						<img src="<@spring.url relativeUrl="/img/text_align_justify.png"/>" title="${item.comment.description}"/>
					</#if>
				</td>
				<td>
					<#assign avatarHash>${item.sampleOpponentAvatar}</#assign>
					<#if avatarHash?has_content>
						<img src="<@spring.url relativeUrl="/app/avatar?hash=${avatarHash}&small"/>"/>
					</#if>
				</td>
			</tr>
		</#list>
		</tbody>

		<tfoot>
			<tr>
				<td colspan="3"><a href="#">prev</a> <a href="#">next</a></td>
			</tr>
		</tfoot>
	</table>
	
	<input type="button" value="Import"/>
	<input type="button" value="Don't import anything"/>
</html>