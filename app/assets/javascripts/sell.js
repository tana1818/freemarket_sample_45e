$(function() {

////////////////////////////////////////////////////////////////////////////////
// ページを開いた時に実行するスクリプト
////////////////////////////////////////////////////////////////////////////////

if (location.pathname.match('products') && ( location.pathname.match('new') || location.pathname.match('edit'))) {
  visibleMiddleCategory('open');
  visibleSmallCategory('open');
  visibleSizeAndBrand('open');
  visibleDeliveryMethod();
  priceAutoCalc();
}

////////////////////////////////////////////////////////////////////////////////
// 各コントロールを変更した時に実行するスクリプト
////////////////////////////////////////////////////////////////////////////////

  $(document).on('change', '#product_large_category', function() {
    visibleMiddleCategory('change');
    visibleSizeAndBrand('change');
  });

  $(document).on('change', '#middle_category', function() {
    visibleSmallCategory('change');
  });

  $(document).on('change', '#small_category', function() {
    visibleSizeAndBrand('change');
  });

  $(document).on('change', '#product_delivery_fee_pay_id', function() {
    visibleDeliveryMethod();
  });

  $(document).on('keyup', '#product_price', function() {
    priceAutoCalc();
  });


////////////////////////////////////////////////////////////////////////////////
//大カテゴリを選択した時に中カテゴリの選択肢を変更してプルダウンを表示するスクリプト
////////////////////////////////////////////////////////////////////////////////

  function visibleMiddleCategory(process) {
    var middlePullDown = $('#sell-form__middle-category');
    var smallPullDown = $('#sell-form__small-category');
    var largeCategoryID = $('#product_large_category').val();

    if (largeCategoryID == '') {
      middlePullDown.css('display', 'none');
      smallPullDown.css('display', 'none');
    } else {
      $.ajax({
        type: 'GET',
        url: '/products/get_middle_categories',
        data: { large_category: largeCategoryID }
      })
      .done(function(strHTML) {
        middlePullDown.css('display', 'block');
        middlePullDown.html(strHTML);
        if (gon.middle_category !== '' && process == 'open') {
          $('#middle_category').val(gon.middle_category);
        }
      })
      .fail(function() {
        alert('データの取得に失敗しました');
      })
    }
  };


////////////////////////////////////////////////////////////////////////////////
//中カテゴリを選択した時に小カテゴリの選択肢を変更してプルダウンを表示するスクリプト
////////////////////////////////////////////////////////////////////////////////

  function visibleSmallCategory(process) {
    var smallPullDown = $('#sell-form__small-category');

    if (process == 'change') {
      var middleCategoryID = $('#middle_category').val();
    } else {
      var middleCategoryID = gon.middle_category;
    }

    if (middleCategoryID == '') {
      smallPullDown.css('display', 'none');
    } else {
      $.ajax({
        type: 'GET',
        url: '/products/get_small_categories',
        data: { middle_category: middleCategoryID }
      })
      .done(function(strHTML) {
        smallPullDown.css('display', 'block');
        smallPullDown.html(strHTML);
        if (gon.small_category !== '' && process == 'open') {
          $('#small_category').val(gon.small_category);
        }
      })
      .fail(function() {
        alert('データの取得に失敗しました');
      })
    }
  };


////////////////////////////////////////////////////////////////////////////////
//小カテゴリを選択した時にサイズ・ブランドの表示を切り替えるするスクリプト
////////////////////////////////////////////////////////////////////////////////

  function visibleSizeAndBrand(process) {
    var sizePullDown = $('#sell-form__size-group');
    var brandTextBox = $('#sell-form__brand-group');

    if (process == 'change') {
      var smallCategoryID = 33;
    } else {
      var smallCategoryID = gon.small_category;
    }
    if (smallCategoryID == '') {
      sizePullDown.css('display', 'none');
    } else {
      $.ajax({
        type: 'GET',
        url: '/products/judge_get_sizes',
        data: { small_category: smallCategoryID }
      })
      .done(function(strHTML) {
        if (strHTML) {
          sizePullDown.css('display', 'block');
          sizePullDown.html(strHTML);
          if (gon.size !== '' && process == 'open') {
            $('#size_id').val(gon.size);
          }
        } else {
          sizePullDown.css('display', 'none');
        }
      })
      .fail(function() {
        alert('データの取得に失敗しました');
      });
      $.ajax({
        type: 'GET',
        url: '/products/judge_brand',
        data: { small_category: smallCategoryID }
      })
      .done(function(strHTML) {
        if (strHTML) {
          brandTextBox.css('display', 'block');
          brandTextBox.html(strHTML);
          if (gon.brand !== '' && process == 'open') {
            $('#brand').val(gon.brand);
          }
        } else {
          // brandTextBox.css('display', 'none');
        }
      })
      .fail(function() {
        alert('データの取得に失敗しました');
      });
    }
  };


////////////////////////////////////////////////////////////////////////////////
//配送料の負担を選択した時に配送方法のプルダウンを表示するスクリプト
////////////////////////////////////////////////////////////////////////////////

  function visibleDeliveryMethod() {
    var deliveryFeePayID = $('#product_delivery_fee_pay_id').val();
    var deliveryMethodPullDown = $('#sell-form__delivery-method-group');
    if (deliveryFeePayID == '') {
      deliveryMethodPullDown.css('display', 'none');
    } else {
      deliveryMethodPullDown.css('display', 'block');
    }
  };


////////////////////////////////////////////////////////////////////////////////
//価格が入力された時に手数料と利益を自動計算して表示するスクリプト
////////////////////////////////////////////////////////////////////////////////

  function priceAutoCalc() {
    var productPrice = $('#product_price').val();
    var controlFee = $('#number-fee');
    var controlProfit = $('#number-profit');

    if (productPrice >= 300 && productPrice < 10000000) {
      var productFee = Math.round(productPrice * 0.1);
      var productProfit = Math.round(productPrice - productFee);
      controlFee.text(productFee.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,'));
      controlProfit.text(productProfit.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,'));
    } else {
      controlFee.text('-');
      controlProfit.text('-');
    }
  };


////////////////////////////////////////////////////////////////////////////////
// エラーの有無に応じて、画面の指定位置にメッセージを表示・非表示切り替えるスクリプト
////////////////////////////////////////////////////////////////////////////////

  function toggleErrorMessage(kind, message, selector) {
    var targetElement = $(selector);
    targetElement.text(message);

    if (kind == 'add') {
      targetElement.show();
    } else if(kind == 'del') {
      targetElement.hide();
    }
  };


////////////////////////////////////////////////////////////////////////////////
// 画像ファイルの選択とドラッグ＆ドロップ機能のスクリプト
////////////////////////////////////////////////////////////////////////////////

  Dropzone.options.myAwesomeDropzone = {

    autoProcessQueue: false,
    uploadMultiple: true,
    parallelUploads: 100,
    maxFiles: 10,
    paramName: 'product[images]',
    previewsContainer: '#dz-previews',
    addRemoveLinks: true,
    dictRemoveFile:'削除',

    init: function() {
      var myDropzone = this;

      if (gon.product_images) {
        var files = gon.product_images
        for (var i = 0, len = files.length; i < len; ++i) {
          var mockFile = { name: "Filename", size: 999 , url: files[i].url};
          myDropzone.emit("addedfile", mockFile, i, 1);
          myDropzone.emit("thumbnail", mockFile, files[i].url);
        }
      }

      // 出品ボタンが押された時のアクション
      this.element.querySelector("input[type=submit]").addEventListener("click", function(e) {
        // ファイルが1つもなかったらエラー、1つでもあれば送信開始
        if(myDropzone.getQueuedFiles().length == 0) {
          toggleErrorMessage('add', '画像がありません', '#alert-images');
        } else {
          toggleErrorMessage('del', '', '#alert-images');
        }
        e.preventDefault();
        e.stopPropagation();
        myDropzone.processQueue();
      });

      // DBへの書き込みが完了した時のアクション
      this.on("successmultiple", function(files, response) {
        var productId = response.productId
        var act = response.act
        if (act == 'update') {
          window.location.href = '/products/' + productId;
        } else {
          $('#modal__share').attr('href', '/products/' + productId )
          // モーダル画面を表示
          $('.modal').show();
          return false;
        }
      });

      // DBへの書き込みが失敗した時のアクション
      this.on("errormultiple", function(files, response) {
        // 返ってきたエラーメッセージの処理
        var fullMessage = response.error;
        if (!fullMessage) {return;}
        console.log(fullMessage);

        if (fullMessage.match("Name is too short")) {
          toggleErrorMessage('add', '必須項目です', '#alert-name');
        } else if (fullMessage.match("Name is too long")) {
          toggleErrorMessage('add', '40文字以下で入力してください', '#alert-name');
        } else {
          toggleErrorMessage('del', '', '#alert-name');
        }

        if (fullMessage.match("Description is too short")) {
          toggleErrorMessage('add', '必須項目です', '#alert-description');
        } else if (fullMessage.match("Description is too long")) {
          toggleErrorMessage('add', '1000文字以下で入力してください', '#alert-description');
        } else {
          toggleErrorMessage('del', '', '#alert-name');
        }

        if (fullMessage.match("Large category can't be blank")) {
          toggleErrorMessage('add', '必須項目です', '#alert-large-category');
        } else {
          toggleErrorMessage('del', '', '#alert-large-category');
        }

        if (fullMessage.match("Middle category can't be blank")) {
          toggleErrorMessage('add', '必須項目です', '#alert-middle-category');
        } else {
          toggleErrorMessage('del', '', '#alert-middle-category');
        }

        if (fullMessage.match("Small category can't be blank")) {
          toggleErrorMessage('add', '必須項目です', '#alert-small-category');
        } else {
          toggleErrorMessage('del', '', '#alert-small-category');
        }

        if (fullMessage.match("Size can't be blank")) {
          toggleErrorMessage('add', '必須項目です', '#alert-size');
        } else {
          toggleErrorMessage('del', '', '#alert-size');
        }

        if (fullMessage.match("Condition can't be blank")) {
          toggleErrorMessage('add', '必須項目です', '#alert-condition');
        } else {
          toggleErrorMessage('del', '', '#alert-condition');
        }

        if (fullMessage.match("Delivery fee pay can't be blank")) {
          toggleErrorMessage('add', '必須項目です', '#alert-delivery-fee-pay');
        } else {
          toggleErrorMessage('del', '', '#alert-delivery-fee-pay');
        }

        if (fullMessage.match("Delivery method can't be blank")) {
          toggleErrorMessage('add', '必須項目です', '#alert-delivery-method');
        } else {
          toggleErrorMessage('del', '', '#alert-delivery-method');
        }

        if (fullMessage.match("Prefecture can't be blank")) {
          toggleErrorMessage('add', '必須項目です', '#alert-prefecture');
        } else {
          toggleErrorMessage('del', '', '#alert-prefecture');
        }

        if (fullMessage.match("Shipment period can't be blank")) {
          toggleErrorMessage('add', '必須項目です', '#alert-shipment-period');
        } else {
          toggleErrorMessage('del', '', '#alert-shipment-period');
        }

        if (fullMessage.match("Price is not a number") || fullMessage.match("Price must be greater than or equal to 300") || fullMessage.match("Price must be less than or equal to 9999999")) {
          toggleErrorMessage('add', '300以上9999999以下の数値を入力してください', '#alert-price');
        } else {
          toggleErrorMessage('del', '', '#alert-price');
        }

        // 選択されていたファイルを一度リセットして復元
        var dropzoneFilesCopy = myDropzone.files.slice(0);
        myDropzone.removeAllFiles();

        $.each(dropzoneFilesCopy, function(_, file) {
          if (file.status === Dropzone.ERROR) {
              file.status = undefined;
              file.accepted = undefined;
          }
          myDropzone.addFile(file);
        });
      });
    }
  }

});
