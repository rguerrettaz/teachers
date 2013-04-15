var Search = {
	init: function() {
		$('.search').on('ajax:success', 'form', this.search);
	},

	search: function(event, data) {
		$('.results').empty();
		if (data.length == 0) {
			$('.results').append('<p>Your search did not return any schools, try again.</p>');
		}
		else {
			for (var i = 0; i < data.length; i++) {
				$('.results').append('<li><a href="/schools/'+data[i].id+'">'+data[i].schoolname+'</a></li>');
			}
		}
	}
}

$(document).ready(function() {
	Search.init();
});
