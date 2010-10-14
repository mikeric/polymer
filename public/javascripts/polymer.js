function validate(pattern){
  var time = pattern.find("select.time");
  var body = pattern.find("input.body");
  
  if(body.val().length != 0 && body.val().length % (16 / time.val()) == 0){
    pattern.removeClass("invalid");
    pattern.addClass("valid");
    pattern.find(".timesig").text((body.val().length / (16 / time.val())) + '/' + time.val());
  }else{
    pattern.removeClass("invalid");
    pattern.removeClass("valid");
    pattern.find(".timesig").text("");
  }
}

$(document).ready(function(){
  $("#usage a").click(function(){
    $(".pattern:eq(0) > select.time").val("4");
    $(".pattern:eq(0) > input.body").val("x---x---o---");
    $(".pattern:eq(1) > select.time").val("16");
    $(".pattern:eq(1) > input.body").val("o-o--");
    validate($(".pattern:eq(0)"));
    validate($(".pattern:eq(1)"));
    return false;
  });
  
  $("input[value=+]").click(function(){
    $(".pattern:last").clone().insertAfter(".pattern:last").hide();
    $(".pattern:last > select.time").val("4");
    $(".pattern:last > input.body").val("");
    validate($(".pattern:last"));
    $(".pattern:last").show("slow");
  });
  
  $(".pattern input.body").live("keyup", function(){
    validate($(this).parent());
  });
  
  $(".pattern select.time").change(function(){
    validate($(this).parent());
  });
  
  $("form").submit(function(){
    var valid = true;
    $(".pattern").each(function(){
      validate($(this));
      if(!$(this).hasClass("valid")){
        $(this).addClass("invalid");
        valid = false;
      }
    });
    return valid;
  });
});