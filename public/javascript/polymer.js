$(document).ready(function() {
  $("input[value=+]").click(function() {
    $("span:last").clone().insertAfter("span:last").hide().show('slow')
  });
});