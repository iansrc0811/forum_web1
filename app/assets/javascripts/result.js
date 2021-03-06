var init_item_lookup;

init_item_lookup = function(){
  $('#item-lookup-form').on('ajax:before', function(event, data, status){
    
    show_spinner();

  });
  $('#item-lookup-form').on('ajax:after', function(event, data, status){
    hide_spinner();
  });
  $('#item-lookup-form').on('ajax:success', function(event, data, status){
    $('#item-lookup').replaceWith(data);

    init_item_lookup();
  });
  $('#item-lookup-form').on('ajax:error', function(event, xhr, status, error){
    hide_spinner();
    $('#item-lookup-results').replaceWith('');
    $('#item-lookup-errors').replaceWith(
      '<h3>  找不到商品, 請檢查輸入值</h3>')

  });
}

$(document).ready(function(){
  init_item_lookup();
})
