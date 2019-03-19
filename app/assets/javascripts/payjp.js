$(function() {
  $("#registration-form").on('submit', function(e) {
    e.preventDefault();
    $(".btn-default.btn-red.btn-complete").prop("disabled", true);

    Payjp.setPublicKey('pk_test_5edbd73f01ee222e374536d5');

    var card = {
      number: $(".input-default.number").val(),
      cvc: $(".input-default.cvc").val(),
      exp_month: $(".input-default.exp_month option:selected").val(),
      exp_year: "20" + $(".input-default.exp_year option:selected").val()
    };

    Payjp.createToken(card, function(s, response) {
      if (response.error) {
      alert('クレジットカードを登録できませんでした。入力内容をご確認の上、もう一度登録してください。')
      $(".btn-default.btn-red.btn-complete").prop("disabled", false);
      }
      else {
        $(".input-default.number").removeAttr("name");
        $(".input-default.cvc").removeAttr("name");
        $(".input-default.exp_month").removeAttr("name");
        $(".input-default.exp_year").removeAttr("name");

        var token = response.id;
        console.log(token)

        $('section').css('display','none');
        $('.complete').css('display','block');

        $('.payjptoken').val(token);
        $("#registration-form").get(0).submit();
      }
    });
  });
});
