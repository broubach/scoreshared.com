<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<head>
		<title><@spring.message code="label.scoreshared"/></title>
		<link type="text/css" href="<@spring.url relativeUrl="/css/le-frog/jquery-ui-1.8.17.custom.css"/>" rel="Stylesheet" />	
		<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-1.7.1.min.js"/>"></script>
		<script type="text/javascript" src="<@spring.url relativeUrl="/js/jquery-ui-1.8.17.custom.min.js"/>"></script>
</head>
<body>
	<div>
		<label for="sortField"><@spring.message code="label.order_by" /></label>
		<select id="sortField">
			<option value="date"><@spring.message code="label.date" /></option>
			<option value="player"><@spring.message code="label.player" /></option>
			<option value="score"><@spring.message code="label.score" /></option>
		</select>
		<select id="sortOrder">
			<option value="false"><@spring.message code="label.descending" /></option>
			<option value="true"><@spring.message code="label.ascending" /></option>
		</select>
	</div>
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

	<img src="<@spring.url relativeUrl="/app/stats/chart/${win}/${loss}"/>">

	<div id="dialog-confirm" title="<@spring.message code="label.confirmation"/>">
		<p><@spring.message code="label.all_items_selected_will_be_deleted_are_you_sure" /></p>
	</div>
</body>
</html>

<script type="text/javascript">
$(function() {
	$('#edit').click(function(e) {
		$('input:checked').each(function() {
			if ($(this).attr('id') != 'master') {
				location.href = '<@spring.url relativeUrl="/app/score/"/>' + $(this).attr('id');
				return false;
			}
		});
	});

	$('#delete').click(function(e) {
		if ($('input:checked').length > 0) {
			$('#dialog-confirm').dialog("open");
		}
	});

	$('#dialog-confirm').dialog({
        resizable: true,
        modal: true,
		autoOpen: false,
        buttons: {
            '<@spring.message code="label.delete_all_items"/>': function() {
            	var selected = new Array();
            	$('input:checked').each(function() {
            	    selected.push($(this).attr('id'));
            	});

            	$.ajax({
    			    url: '<@spring.url relativeUrl="/app/scores/"/>' + selected.join(","),
    			    type: 'DELETE',
    			    success: function(result) {
    			    	$('tr:has(input:checked)').remove();
    			    	$('#dialog-confirm').dialog("close");
    			    }
    			});
            },
            '<@spring.message code="label.cancel"/>': function() {
            	$('#dialog-confirm').dialog("close");
            }
        }
    });

	$('select').change(function(e) {
		location.href = '<@spring.url relativeUrl="/app/scores/" />1/' + $('#sortField option:selected').val() + '/' + $('#sortOrder option:selected').val();
	});

	var params = location.href.split("/");
	$('#sortField option[value="'+ params[params.length-2] +'"]').attr('selected', 'selected');
	$('#sortOrder option[value="'+ params[params.length-1] +'"]').attr('selected', 'selected');
	
	$('#master').click(function(e) {
		$('input[type=checkbox]').attr('checked', $('#master').is(':checked'));
	});
});
</script>