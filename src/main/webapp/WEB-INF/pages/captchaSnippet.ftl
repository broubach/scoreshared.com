<#import "/spring.ftl" as spring />

<h3>Controle de Seguranca</h3>
<h4>Insira a palavra mostrada aqui em baixo. Não consegue compreender a palavra?</h4>
<a href="#">Tente com outras palavras.</a>
<img src="<@spring.url relativeUrl="/app/captcha"/>"/>
<form id="captcha-form">
	Insira aqui: <input name="captchaAnswer" type="text" maxlength="5"></input>
	<button type="button">Enviar</button>
</form>
<a id="goBack" href="#">Voltar</a> 