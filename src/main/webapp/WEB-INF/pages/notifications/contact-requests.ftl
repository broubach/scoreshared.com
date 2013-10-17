<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Notifications">
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="content row">
		<nav class="breadcrumbs">
			<span><@spring.message code="label.you_are_here"/>: </span>
			<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.home"/></a> <a href="#" class="current"><@spring.message code="label.notifications"/></a>
		</nav>	

		<div class="box-content">
			<h2><@spring.message code="label.notifications"/></h2>

			<div style="" class="section-container auto notificacoes" data-section="">
				<section>
					<p style="left: 112px;" class="title" data-section-title="">
						<a href="#"><@spring.message code="label.contact_requests"/> <span>(1)</span></a>
					</p>
					<div class="content" data-section-content="">
						<ul class="lista-resultados lista-aprovacoes">
							<#list contacts as item>
								<li class="item-resultado resultado-perdeu">
									<table>
										<tbody>
										<tr>
											<td><img src="<@spring.url relativeUrl="/app/avatar?hash=${(item[0]?html)!}&small"/>"/></td>
											<td>${item[1]} ${item[2]}</td>
											<td width="30%">
												<span class="actions hide">
													<a href="accept,${item[3]}" class="button button-small button-primary"><@spring.message code="label.accept"/></a>
													<a href="ignore,${item[3]}" class="button button-small"><@spring.message code="label.ignore"/></a>
												</span>
											</td>
										</tr>
										</tbody>
									</table>
								</li>
							</#list>
						</ul>
					</div>
				</section>
				<section style="padding-top: 50px;" class="active">
					<p style="left: 0px;" class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/notifications/pendingScoreApprovals"/>"><@spring.message code="label.pending_score_approvals"/> <span>(2)</span></a>
					</p>
				</section>
				<section>
					<p style="left: 217px;" class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/notifications/pendingScoreRevisions"/>"><@spring.message code="label.pending_score_revisions"/> <span>(2)</span></a>
					</p>
				</section>
			</div>
		</div>
	</div>

	<div class="row content">
		<br/>
	</div>

	<#include "/helper-snippets/basic-footer.ftl">
</body>
</html>

<script type="text/javascript">
$(document).ready(function(){
	$('.item-resultado').hover(function(){
		$(this).find('span.actions').fadeIn('fast');
	}, function(){
	$(this).find('span.actions').fadeOut();
	})
});

var ClickContext = {
		tableLine: {}
};
$(function() {
	$("td a").click(function (e) {
		e.preventDefault();
		ClickContext.tableLine = $(this).parent().parent();

		var kind = $(this).attr('href').split(',')[0];
		var id = $(this).attr('href').split(',')[1];
		var url = '<@spring.url relativeUrl="/app/"/>' + kind + '/invitation/';

    	$.ajax({
		    url: url,
		    type: 'POST',
		    data: {'user2Id': id},
		    dataType: 'json',
		    success: function() {
		    	ClickContext.tableLine.remove();
		    }
		});
	});
});
</script>