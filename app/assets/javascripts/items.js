$(document).on('turbolinks:load', function(){
  $(function(){

    //プレビューのhtmlを定義
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                    </div>
                    <div class="delete-box" id="delete_btn_${count}">
                      <span>削除</span>
                    </div>
                  </div>
                </div>`
      return html;
    }

    // ラベルのwidth操作
    function setLabel() {
      //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
      //.label-contentを対象として後に続けて直前のHTML要素(prev-content)をprev()で取得。変数prevContentとして使用
      var prevContent = $('.label-content').prev();
      //全体のwidth620から選択した画像枚数分のwidthを引く。
      //prevContentから.label-contentのwidthの数値から半角数字のみを全て検索して文字列に置換
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }

    // プレビューの追加
    $(document).on('change', '.hidden-field', function(){
      // 画像選択ボタンの値が変化したときラベルのwidthを変化させる
      setLabel();
      //hidden-fieldの数値のみ取得
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //labelボックスのidとforを更新
      //(attrでlabel-boxのidを取得。更新？)
      $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      //選択された画像情報を取得
      var file = this.files[0];
      //FileReaderオブジェクトをインスタンス化
      var reader = new FileReader();
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        var image = this.result;
        // プレビューが元々なかった場合はhtmlを追加
        if ($(`#preview-box__${id}`).length == 0) {
          // preview-boxの要素の数をcountに入れる
          var count = $('.preview-box').length;
          //プレビューのhtmlを変数htmlに入れる
          var html = buildHTML(id);
          //ラベルの直前のプレビュー群にプレビュー画像を追加
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }
        //イメージを追加
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        //プレビューが5個あったらラベルを隠す
        if (count == 5) {
          $('.label-content').hide();
        }

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        if(count < 5){
          //プレビューの数でラベルのオプションを更新する
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
        }
      }
    });

    //画像の削除
    $(document).on('click', '.delete-box', function(){
      var count = $('.preview-box').length;
      setLabel(count);
      //item_images_attributes_${id}_image から${id}に入った数字のみを抽出
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //取得したidに該当するプレビューを削除
      $(`#preview-box__${id}`).remove();
      console.log("new")
      //フォームの中身を削除
      $(`#item_images_attributes_${id}_image`).val("");

      //削除時のラベル操作
      var count = $('.preview-box').length;
      //5個目が消されたらラベルを表示
      if (count == 4) {
        $('.label-content').show();
      }
      setLabel(count);

      if(id < 5){
        //削除された際に、空っぽになったfile_fieldをもう一度入力可能にする 
        $('.label-box').attr({id: `label-box--${id}`, for: `item_images_attributes_${id}_image`});
      }
    });
  });
})