$(window).on("turbolinks:load",function(){

  $('img.a-small_image').mouseover(function(){
    
    // カーソルを乗せた小さい画像のURLを取得
    var selectedSrc = $(this).attr('src')

    // 画像入れ替え
    $('img.big_image').stop().fadeOut(50,
    function(){
    $('img.big_image').attr('src', selectedSrc);
    $('img.big_image').stop().fadeIn(200);
    }
    );

    // サムネイルの枠を変更
    $(this).css({"border":"2px solid #ff5a71"});
    });
    
    // マウスアウトでサムネイル枠もとに戻す
    $('img.a-small_image').mouseout(function(){
    $(this).css({"border":""});
    });
});