import Typed from './typed'

document.addEventListener("turbolinks:load", () => {
  if (document.querySelector(".element")){
    var typed = new Typed(".element", {
      strings: [
        "Software Development is a wonderful tool for those who need it.",
        "Everyone should have access to the tools they need to get the job done to make lives smarter and happier!"
      ],
      typeSpeed: 60
    });
  }
});