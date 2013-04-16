var Comment = {
	init: function() {
		$('.comment-form').on('ajax:success', 'form', this.comment);
    },	

	comment: function(event, data) {

				$('.comments').append(data);
	}
}

$(document).ready(function() {
	Comment.init();
});