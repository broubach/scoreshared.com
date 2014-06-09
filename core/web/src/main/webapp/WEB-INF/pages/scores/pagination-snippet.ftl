			<#if (pageCount > 1)>
				<div class="row">
					<div class="columns small-12">
						<div class="pagination-centered">
							<ul class="pagination">
								<li class="arrow <#if disableFirstArrow!false>unavailable</#if>"><a href="<#if !disableFirstArrow!false><@spring.url relativeUrl="/app/scores/0/${outcome}/${ascending?c}"/><#else>#</#if>">&laquo;</a></li>
								<#list (windowLeft+1)..(windowRight+1) as page>
									<li class="<#if (pageNumber+1)=page>current</#if>"><a href="<@spring.url relativeUrl="/app/scores/${page-1}/${outcome}/${ascending?c}"/>">${page}</a></li>
								</#list>
								<li class="arrow <#if disableLastArrow!false>unavailable</#if>"><a href="<#if !disableLastArrow!false><@spring.url relativeUrl="/app/scores/${pageCount-1}/${outcome}/${ascending?c}"/><#else>#</#if>">&raquo;</a></li>
							</ul>
						</div>
					</div>
				</div>
			</#if>
