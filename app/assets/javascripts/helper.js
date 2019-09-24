$(document).ready(function(){
  var checked_count = $("[name='move_ids[]']:checked").length

  if(checked_count > 0) {
    togglePokemonInfo();
  }

  $('#choose-button').click(function() {
    togglePokemonInfo();
  });

  function togglePokemonInfo() {
    $('#pokemon-info').hide();
    $('#choose-pokemon').removeClass('hidden');
  }
});
