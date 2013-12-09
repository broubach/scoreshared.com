	<div id="dialog-choosePlayerFromList" class="modal mfp-hide">
		<div class="row content no-padding-top">
			<div class="columns small-10">
				<h2><@spring.message code="label.invitation"/></h2>
				<p><@spring.message code="label.select_a_player"/></p>
			</div>
		</div>
		<div class="row content no-padding-top no-padding-bottom">
			<div class="columns small-10">
				<table class="full selecao-jogador">
				<thead>
				<tr>
					<th></th><th><@spring.message code="label.name"/></th><th><@spring.message code="label.location"/></th>
				</tr>
				</thead>
				<tbody>
				</tbody>
				</table>
			</div>
		</div>
		<div class="row content no-padding-top no-padding-bottom">
			<div class="columns small-10">
				<a class="button mfp-prevent-close" id="dialog-choosePlayerFromList-back"><@spring.message code="label.back"/></a>
				<a class="button button-primary mfp-prevent-close" id="dialog-choosePlayerFromList-save_without_invitation"><@spring.message code="label.save_without_invitation"/></a>
			</div>
		</div>
	</div>