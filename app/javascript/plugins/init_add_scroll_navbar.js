const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY > 90) {
        navbar.classList.add('navbar-transoshi');
      } else {
        navbar.classList.remove('navbar-transoshi');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };