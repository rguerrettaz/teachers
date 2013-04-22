var Search = {
	init: function() {
		$('.search').on('ajax:success', 'form', this.search);
	},

	search: function(event, data) {
		
		debugger
		if (data.length == 0) {
			$('.results').append('<p>Your search did not return any schools, try again.</p>');
		}
		else {
			$('.results').append(data);
		}
	}
}

$(document).ready(function() {
	Search.init();

	$('.nav-pills').on('click', 'a', function(e) {	
		e.preventDefault();
		$('.nav-pills li').removeClass('active');
		$(this).parent().addClass('active');
		var link_name = $(this).text();
		var filter_name = "." + link_name.toLowerCase();
		if (filter_name == '.all') {
			$('#news_item_grid').isotope({ filter: '.news_item_wrapper' });
		}
		else {   
		$('#news_item_grid').isotope({ filter: filter_name });
		}
	});
});

