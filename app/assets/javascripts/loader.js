var Loader = {
  init: function() {
    this.showItems();
  },

  showItems: function() {
    $.ajax({
      type: 'GET',
      url: '/load_from_apis',
      dataType: 'json'
    }).done(Loader.appendResults);
  },

  appendResults: function(data, status) {
    $('#loader').addClass('hidden');
    $('.items').removeClass('hidden');
    $('.items').append(data);
  }
}

$(window).load(function() {
  Loader.init();
});
