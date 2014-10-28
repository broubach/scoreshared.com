	<footer>
		<div class="row nivel1">
			<ul class="inline-list linguas">
				<li><a href="?locale=en" <#if (request.locale=='en' || request.locale=='en_US')>class="ativa"</#if>><@spring.message code="label.language_english"/></a></li>
				<li><a href="?locale=pt" <#if (request.locale=='pt' || request.locale=='pt_BR')>class="ativa"</#if>><@spring.message code="label.language_portuguese"/></a></li>
				<li><a href="?locale=it" <#if request.locale=='it'>class="ativa"</#if>><@spring.message code="label.language_italian"/></a></li>
			</ul>
		</div>
		<div class="row nivel2">
			<div class="large-6 columns">
				<ul class="inline-list">
					<li><a href="http://wiki.scoreshared.com/doku.php?id=about"><@spring.message code="label.about"/></a></li>
					<li><a href="http://wiki.scoreshared.com/doku.php?id=terms_and_conditions"><@spring.message code="label.terms_and_conditions"/></a></li>
				</ul>
		    </div>
		    <div class="large-6 columns">
				<!-- img src="<@spring.url relativeUrl="/img/any-device.png"/>" class="right" alt="" /-->
			</div>
		</div>
		<div class="row nivel3">
			<div class="columns twelve">
				<ul class="ch-grid">
						<li>
							<div class="ch-item ch-img-1">				
								<div class="ch-info-wrap">
									<div class="ch-info">
										<div class="ch-info-back">
											<a href="http://twitter.com/scoreshared"><@spring.message code="label.follow"/></a>
										</div>	
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="ch-item ch-img-2">
								<div class="ch-info-wrap">
									<div class="ch-info">
										<div class="ch-info-back">
											<a href="http://www.facebook.com/scoreshared"><@spring.message code="label.like"/></a>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="ch-item ch-img-3">
								<div class="ch-info-wrap">
									<div class="ch-info">
										<div class="ch-info-back">
											<a href="mailto:contact@scoreshared.com"><@spring.message code="label.mail"/></a>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
			</div>
		</div>
	</footer>
	
	<#include "/helper-snippets/google-analytics.ftl">	