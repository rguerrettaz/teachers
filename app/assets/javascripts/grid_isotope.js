$(function ($) {
  var $grid = $('.media-container');

  $grid.isotope({
    itemSelector: '.media-item-wrapper',
    layoutMode: 'masonry'
  });

  $grid.imagesLoaded(function () {
    $grid.isotope('reLayout');
    $('.media-item').removeClass('hidden');
  });
});
