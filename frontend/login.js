const form = document.getElementById('login-form');
const emailInput = form.querySelector('input[name="email"]');
const passwordInput = form.querySelector('input[name="password"]');

form.addEventListener('submit', function(e) {
    e.preventDefault();

    const formData = new FormData(form);
    const data = Object.fromEntries(formData.entries());

    emailInput.setCustomValidity('');
    passwordInput.setCustomValidity('');

    fetch('http://127.0.0.1:5000/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(result => {
        if (result.status === 'success') {
            window.location.href = 'home.html';
        } else {
            if (result.message === 'User does not exist' || result.message === 'Invalid password') {
                passwordInput.setCustomValidity("Email and password do not match.");
                passwordInput.reportValidity();
            } else {
                console.log('Error:', result.message);
            }
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
});
