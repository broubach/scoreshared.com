<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Home">
	<#assign head_additional_css=["/css/jquery.Jcrop-0.9.12.min.css"]>
	<#assign head_additional_js=["/js/jquery.Jcrop-0.9.12.min.js", "/js/profile-avatar.js"]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>

	<#assign header_snippet="/helper-snippets/header-snippet.ftl">
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<nav class="breadcrumbs">
			<span><@spring.message code="label.you_are_here"/>: </span>
			<a href="<@spring.url relativeUrl="/app/home"/>"><@spring.message code="label.profile"/></a>
		</nav>	
		<div class="box-content">
			<h2><@spring.message code="label.profile"/></h2>

			<div class="section-container vertical-tabs" data-section="vertical-tabs">
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/personal-information"/>"><@spring.message code="label.personal_information"/></a>
					</p>
				</section>
				<section>
					<p class="title" data-section-title="">
						<a href="<@spring.url relativeUrl="/app/profile/social-networks"/>"><@spring.message code="label.social_networks"/></a>
					</p>
				</section>
				<section class="active">
					<p class="title" data-section-title="">
						<a href="#"><@spring.message code="label.avatar"/></a>
					</p>
					<div class="content" data-section-content="">
						<p><h3><@spring.message code="label.avatar"/></h3></p>

						<form id="fileUpload-form" action="<@spring.url relativeUrl="/app/profile/avatar"/>" enctype="multipart/form-data" method="POST">
							<@spring.formHiddenInput "profileAvatarForm.x", "" />
							<@spring.formHiddenInput "profileAvatarForm.y", "" />
							<@spring.formHiddenInput "profileAvatarForm.x2", "" />
							<@spring.formHiddenInput "profileAvatarForm.y2", "" />
							<@spring.formHiddenInput "profileAvatarForm.avatarUploaded", "" />
			
							<span id="leftPanel">
									<p>
										<@spring.message code="label.select_your_favorite_picture"/><br/>
										<@spring.formInput "profileAvatarForm.file", "", "file"/>
									</p>
									<p><@spring.message code="label.cut_your_best_angle_and_see_how_it_looks"/></p>
							</span>

							<div class="row">
								<div class="small-4 columns">
									<div style="width:104px;height:104px;overflow:hidden;margin-left:5px;border:0px;" class="avatar"> 
										<img id="preview" style="max-width: none" src="<@spring.url relativeUrl="/app/avatar"/>?<#if !(avatarJustUploaded!false)>hash=${loggedUserAvatarHash}&amp;</#if>${((.now?datetime)?string)?replace(" ", "")}"/>
									</div>
								</div>
								<div class="small-8 columns">
									<img id="target" style="max-width: none" src="<@spring.url relativeUrl="/app/avatar"/>?<#if !(avatarJustUploaded!false)>hash=${loggedUserAvatarHash}&amp;</#if>${((.now?datetime)?string)?replace(" ", "")}" />
								</div>
							</div>

							<div class="row">
								<div class="columns small-12 direita">
									<button type="submit" class="button button-large button-primary centralizado"><@spring.message code="label.save"/></button>
								</div>
							</div>
						</form>
					</div>
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
	$(function() {
        $('#target').Jcrop({
				boxWidth: 450,
				boxHeight: 380,
				bgColor: '#ffffff',
				onChange: showCoords,
				onSelect: showCoords, 
				aspectRatio: 1,
				setSelect: [0, 0, 104, 104]
	    });
		Step3Bindings.start();
    });
</script>