function setFollowBtnHover() {
  $('.relationship_btn.unfollow').hover(function () {
    $(this).val('unfollow');
    $(this).addClass('active');
  }, function() {
    $(this).val('following');
    $(this).removeClass('active');
  });
};

$(document).ready(function() {
  setFollowBtnHover();
});
