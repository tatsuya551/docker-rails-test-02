$(function(){
  function buildHTML(comment){
    var html = 
      `<div class="p-comment__item">
          <p>${comment.comment}</p>
          <div class="p-comment__bottomLine">
            <span>${comment.name}</span>
            <span>${comment.created_at}</span> 
            <span><a data-confirm="削除してもよろしいですか？" rel="nofollow" data-method="delete" href="/comments/${comment.id}">削除</a></span>
          </div>
        </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.p-comment__list').append(html);
      $('.btn-primary').prop("disabled", false);
      $('form').find('#comment_name').val("");
      $('form').find('#comment_comment').val("");
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
      $('.btn-primary').prop("disabled", false);
    });
  });
});