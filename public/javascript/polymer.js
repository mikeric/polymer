$(document).ready(function(){
  $("input[value=+]").click(function(){
    $("span:last").clone().insertAfter("span:last").hide();
    $("span:last > input").val('');
    $("span:last").removeClass('valid');
    $("span:last").show('slow');
  });
  
  $("input[type=text]").live('keyup', function(){
    var pattern = $(this).parent();
    var time = pattern.find("input.time");
    var body = pattern.find("input.body");
    
    if (time.val() < 1){
      pattern.removeClass('valid');
    }else if (body.val().length == time.val() * 2){
      pattern.addClass('valid');
    }else{
      pattern.removeClass('valid');
    }
  });
});