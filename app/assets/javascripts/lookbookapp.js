window.addEventListener('DOMContentLoaded', () => {

  const $hamburger = document.querySelector('.hamburger');
  $hamburger.addEventListener('click', () => {
    $hamburger.classList.toggle('is-active')
  });

  const $wrapper = document.getElementById('wrapper');
  const $navBtn = document.getElementById('nav-btn');

  $navBtn.addEventListener('click', navToggle);
  function navToggle() {
    if ($wrapper.classList.contains('nav-open')) {
      navCloseFunc();
    } else {
      navOpenFunc();
    }
  }

  const navOpenFunc = () => {
    $wrapper.classList.add('nav-open');
  }
  const navCloseFunc = () => {
    $wrapper.classList.remove('nav-open');
  }

}, false)