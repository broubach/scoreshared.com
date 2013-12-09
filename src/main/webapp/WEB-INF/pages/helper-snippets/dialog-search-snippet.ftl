	<div id="dialog-search" class="modal mfp-hide">
		<div class="row content no-padding-bottom">
			<div class="columns large-10">
				<h2><@spring.message code="label.invitation"/></h2>
				<p id="search-for-username"></p>
				<div class="error-panel label alert radius" style="display: none"></div>
			</div>
		</div>
		<div class="row content no-padding-top no-padding-bottom">
			<form id="search-form">
				<div class="columns large-5">
						<@spring.formHiddenInput "search.playerNameInScore", "" />
						<div class="input text"><label for="firstName"><@spring.message code="label.first_name"/></label><@spring.formInput "search.firstName", "", "text"/></div>
						<div class="input text"><label for="lastName"><@spring.message code="label.last_name"/></label><@spring.formInput "search.lastName", "", "text"/></div>
						<div class="input text"><label for="city"><@spring.message code="label.city"/></label><@spring.formInput "search.city", "", "text"/></div>
						<div class="input text"><label for="country"><@spring.message code="label.country"/></label><@spring.formInput "search.country", "", "text"/></div>
				</div>
				<div class="columns large-2 centralizado">
					<@spring.message code="label.or"/>
				</div>
				<div class="columns large-5">
					<div class="input text"><label for="email"><@spring.message code="label.email"/></label><@spring.formInput "search.email", "", "text"/></div>
				</div>
			</form>
		</div>
		<div class="row content no-padding-top no-padding-bottom">
			<div class="columns large-10">
				<a class="button mfp-prevent-close" id="dialog-search-invite"><@spring.message code="label.invite"/></a>
				<a class="button button-primary mfp-prevent-close" id="dialog-search-save_without_invitation"><@spring.message code="label.save_without_invitation"/></a>
			</div>
		</div>
	</div>