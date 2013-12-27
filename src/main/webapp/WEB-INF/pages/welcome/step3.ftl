<#import "/spring.ftl" as spring />

<!DOCTYPE html>
<html>
<head>
	<#assign head_title="ScoreShared: Welcome3">
	<#assign head_additional_css=["/css/jquery.Jcrop-0.9.12.min.css"]>
	<#assign head_additional_js=["/js/jquery.Jcrop-0.9.12.min.js", "/js/profile-avatar.js"]>
	<#include "/helper-snippets/basic-head.ftl">
</head>
<body>
	<#include "/helper-snippets/basic-header.ftl">

	<div class="row content">
		<div class="small-6 large-centered columns">
			<div class="row content">
				<div class="small-3 columns">
					<h3>
						<@spring.message code="label.step1"/>
					</h3>
				</div>
				<div class="small-3 small-offset-1 columns">
					<h3>
						<@spring.message code="label.step2"/>
					</h3>
				</div>
				<div class="small-4 columns">
					<a class="button no-margin-top no-margin-bottom medium secondary disabled">
						<@spring.message code="label.step3"/>
					</a>
				</div>
			</div>
		</div>

		<div class="small-6 large-centered columns">
			<div class="centralizado">
				<h2><@spring.message code="label.show_us_who_you_are"/></h2>
			</div>

			<form id="fileUpload-form" action="<@spring.url relativeUrl="/app/welcome/step3"/>" enctype="multipart/form-data" method="POST">
				<@spring.formHiddenInput "profileAvatarForm.x", "" />
				<@spring.formHiddenInput "profileAvatarForm.y", "" />
				<@spring.formHiddenInput "profileAvatarForm.x2", "" />
				<@spring.formHiddenInput "profileAvatarForm.y2", "" />
				<@spring.formHiddenInput "profileAvatarForm.avatarUploaded", "" />

				<span id="leftPanel">
					<ol>
						<li>
							<@spring.message code="label.select_your_favorite_picture"/><br/>
							<@spring.formInput "profileAvatarForm.file", "", "file"/>
						</li>
						<li>
							<@spring.message code="label.cut_your_best_angle_and_see_how_it_looks"/>
						</li>
					</ol>
				</span>

				<div class="row">
					<div class="small-4 columns">
							<div style="width:104px;height:104px;overflow:hidden;margin-left:5px;border:0px;" class="avatar"> 
								<img id="preview" style="max-width: none" src="<@spring.url relativeUrl="/app/avatar"/>?${((.now?datetime)?string)?replace(" ", "")}"/>
							</div>
					</div>
					<div class="small-8 columns">
						<img id="target" style="max-width: none" src="<@spring.url relativeUrl="/app/avatar"/>?${((.now?datetime)?string)?replace(" ", "")}" />
					</div>
				</div>

				<button type="submit" class="button button-large button-primary centralizado"><@spring.message code="label.ready_i_want_to_share_my_scores"/></button>
			</form>
			<a href="<@spring.url relativeUrl="/app/welcome/step2"/>"><@spring.message code="label.back"/></a>
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
				boxWidth: 550,
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