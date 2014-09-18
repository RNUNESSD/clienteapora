$(function() {
  $(".datetime").datetimepicker({
    language: 'pt-br'
  })

  $('#images')
  .bind('cocoon:after-insert', function() {
    $(".date").datetimepicker({})
  })
});
