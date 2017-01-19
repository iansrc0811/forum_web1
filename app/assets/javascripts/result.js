var init_item_lookup;

init_item_lookup = function(){
  $('#item-lookup-form').on('ajax:success', function(event, data, status){
    $('#item-lookup').replaceWith(data);
    init_item_lookup();
  });
  $('#item-lookup-form').on('ajax:error', function(event, xhr, status, error){
    $('#item-lookup-results').replaceWith('');
    $('#item-lookup-errors').replaceWith('沒有結果')
  });
}

$(document).ready(function(){
  init_item_lookup();
})