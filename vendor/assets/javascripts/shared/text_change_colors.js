function changeColors(){
  var range = "abcdef123456789";
  var color = ['#'];

  for(i=0; i<=2;i++){
    color.push(formatValues(range));
  };
  
  $(".link_colors").css("color", color.join(''));
  setTimeout(changeColors, 700);
}

function formatValues(params){
  return params.charAt(Math.floor(Math.random() * params.length));
}