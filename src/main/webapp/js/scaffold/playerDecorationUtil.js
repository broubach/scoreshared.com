var PlayerDecorationUtil = {

	addPlayerLinksTo : function(elements, players, contextUrl) {
		context = {
			'players' : players
		};
		$(elements).each(
			function() {
				for ( var i = 0; i < context.players.length; i++) {
					var content = $(this).html();
					var beginIndex = content.indexOf(
							context.players[i][1]);
					if (beginIndex > -1) {
						var newLink = '<a href="' + contextUrl + 'app/player/' + context.players[i][0]+ '">' + context.players[i][1] + '</a>';
						
						$(this).html(content.replace(context.players[i][1], newLink));
					}
				}
			}
		);
	}
};
