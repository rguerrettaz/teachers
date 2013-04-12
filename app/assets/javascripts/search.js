var Search = {
	init: function() {
		$('.search').on('ajax:success', 'form', this.search);
	},

	search: function(event, data) {
		for (var i = 0; i < data.length; i++) {
			$('.search').append('<li><a href="/schools/'+data[i].id+'">'+data[i].schoolname+'</a></li>');
		}
	}
}

$(document).ready(function() {
	Search.init();
});