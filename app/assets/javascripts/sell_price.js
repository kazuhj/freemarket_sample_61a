$(document).on('turbolinks:load', function(){
  var add_list = $(".commission");
  function addprice(commission) {
    var html = `<div>
                  <p>¥${ commission.toLocaleString() }</p>
                </div>`
    add_list.append(html);
  }
  var add_list2 = $(".profit");
  function addprice2(profit) {
    var html2 = `<div>
                  <p>¥${ profit.toLocaleString() }</p>
                </div>`
    add_list2.append(html2);
  }
  $('#sell-price').on('keyup',function(e){
    e.preventDefault();
    var price = $('#sell-price').val(); 
    if(price.length == 0|| price <=300 || price >= 9999999){
      $(".commission").empty();
      $(".profit").empty();
      var commission = '-'
      var profit = '-'
      return;
    }
    $(".commission").empty();
    $(".profit").empty();
    var commission = price/10;
    addprice(commission);  
    var profit = price - commission;
    addprice2(profit);
  });
});