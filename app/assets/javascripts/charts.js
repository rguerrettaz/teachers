$(document).ready(function () {

  // Student-to-Teacher Ratio
  Morris.Bar({
    element: 'ratio',
    data: [
      { r: 'Student-to-Teacher Ratio', a: $('#ratio').data('ratio'), b: 15.2 }
    ],
    xkey:   'r',
    ykeys:  ['a', 'b'],
    labels: [$('#ratio').data('schoolname'), 'National Average'],
    hideHover: 'auto'
  });
})
