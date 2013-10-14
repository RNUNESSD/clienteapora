$(function() {
  $('.date').datetimepicker({
    language: 'pt-BR'
  });
});

$(document).ready(function() {
  $('#images')
  .bind('cocoon:after-insert', function() {
    $('.date').datetimepicker({
      language: 'pt-BR'
    });
  })
});
