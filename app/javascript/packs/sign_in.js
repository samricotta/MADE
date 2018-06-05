
let signUpButton = document.getElementById('sign-up-button')
let signUp = document.getElementById('sign-up')
let signIn = document.getElementById('sign-in')
let becomeAChefs = document.querySelectorAll('#become-a-chef')
let signInNavbars = document.querySelectorAll('#sign-in-navbar-link')

// [becomeAChef].forEach((navbarLink) => {
  becomeAChefs.forEach(function(button) {
    button.addEventListener('click', () => {
      signUp.classList.remove('hidden')
      signIn.classList.add('hidden')
    })
  })
// })
  signInNavbars.forEach(function(button) {
    button.addEventListener('click', () => {
      signUp.classList.add('hidden')
      signIn.classList.remove('hidden')
    })
  })

signUpButton.addEventListener('click', () => {
  signIn.classList.toggle('hidden')
  signUp.classList.toggle('hidden')
})

