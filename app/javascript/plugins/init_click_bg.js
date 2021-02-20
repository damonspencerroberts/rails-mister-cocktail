const InitClickBg = () => {
  document.querySelector('.navbar-toggler').addEventListener('click', () => {
    document.querySelector('.nav-sm-options').classList.toggle('maroonbgoshi')
  });
}

export { InitClickBg };