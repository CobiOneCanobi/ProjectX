$(document).ready(function(){
  $('.js-menu-trigger,.js-menu-screen').on('click touchstart',function (e) {
    $('.js-menu,.js-menu-screen').toggleClass('is-visible');
    $('.content').toggleClass('with-side-nav').toggleClass('no-side-nav');
    e.preventDefault();
  });
});
