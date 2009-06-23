$(document).ready(function() {
  $("input[value=+]").click(function() {
    $("span:last").clone().insertAfter("span:last").hide();
    $("span:last > input").val('');
    $("span:last").show('slow')
  });
});