//= require jquery
//= require jquery_ujs
//= require_tree .

// show
jQuery(document).ready(function(){
  jQuery('form a.form-submit-button').click(function(){
    jQuery(this).closest('form').submit();
  })
});

// new
jQuery(document).ready(function() {
  
  var refresh_input_names_and_select_options = function(){
    var ipt_count = jQuery('.page-new-vote form .item-list .item input[type=text]').length;
    
    // 1 如果选项还剩两项，则隐藏删除按钮，否则显示删除按钮
    if( ipt_count <= 2 ){
      jQuery('.page-new-vote form .item-list').addClass('min');
    }else{
      jQuery('.page-new-vote form .item-list').removeClass('min');
    }
    
    // 2 刷新select 
    jQuery('.page-new-vote form select.limit option').remove();
    for(var i=1; i<=ipt_count; i++){
      var text = (i == 1) ? '单选' : '最多选'+i+'项';
      var opt_elm = jQuery('<option value="'+i+'">'+text+'</option>')
        .appendTo(jQuery('.page-new-vote form select.limit'));
    }
  }
  
  jQuery('.page-new-vote form .item-list .item input[type=text]').attr('id', null);
  refresh_input_names_and_select_options();
  
  // 删除选项，如果只剩两项则不允许再删
  jQuery('.page-new-vote form .item-list .item a.delete').live('click', function(){
    jQuery(this).closest('.item').remove();
    refresh_input_names_and_select_options();
  });
  
  // 增加选项
  jQuery('.page-new-vote form .add-new-item').click(function(){
    var item_elm = jQuery('<div class="item"></div>')
      .append(jQuery('<input type="text" size="30" name="vote[vote_items_attributes][][item_title]" />'))
      .append(jQuery('<a class="delete" href="javascript:;">删除</a>'))
      .appendTo(jQuery(this).closest('.field').find('.item-list'));
    
    refresh_input_names_and_select_options();
  });
});
