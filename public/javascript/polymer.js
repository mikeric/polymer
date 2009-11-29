$(document).ready(function(){
  $("#usage a").click(function(){
    $(".pattern:first > input:first").val("4");
    $(".pattern:first > input:last").val("o-oo-oo-");
    $(".pattern:eq(1) > input:first").val("5");
    $(".pattern:eq(1) > input:last").val("o--oo--o-o");
    $(".pattern:first").addClass("valid");
    $(".pattern:eq(1)").addClass("valid");
    return false;
  });
  
  $("input[value=+]").click(function(){
    $(".pattern:last").clone().insertAfter(".pattern:last").hide();
    $(".pattern:last > input").val("");
    $(".pattern:last").removeClass("valid");
    $(".pattern:last").removeClass("invalid");
    $(".pattern:last").show("slow");
  });
  
  $("input[type=text]").live("keyup", function(){
    var pattern = $(this).parent();
    var time = pattern.find("select.time");
    var body = pattern.find("input.body");
    
    if(body.val().length % (16 / time.val()) == 0){
      pattern.removeClass("invalid");
      pattern.addClass("valid");
      pattern.find(".timesig").text((body.val().length / (16 / time.val())) + '/' + time.val());
    }else{
      pattern.removeClass("valid");
      pattern.find(".timesig").text("");
    }
  });
  
  $("form").submit(function(){
    var valid = true;
    $(".pattern").each(function(){
      if(!$(this).hasClass("valid")){
        $(this).addClass("invalid");
        valid = false;
      }
    });
    return valid;
  });
});