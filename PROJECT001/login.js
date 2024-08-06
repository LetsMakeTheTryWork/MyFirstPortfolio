document.addEventListener('DOMContentLoaded', () => {

    const signupForm = document.getElementById('signupForm');
    const loginForm = document.getElementById('loginForm');
    const signupMessage = document.getElementById('signupMessage');
    const loginMessage = document.getElementById('loginMessage');

    signupForm.addEventListener('submit', (event) => {
        event.preventDefault(); // Prevent the form from submitting the traditional way



        const username = signupForm.querySelector('input[name="txt"]').value;
        const email = signupForm.querySelector('input[name="email"]').value;
        const phone = signupForm.querySelector('input[name="broj"]').value;
        const password = signupForm.querySelector('input[name="pswd"]').value

        // Save user data to local storage
        localStorage.setItem('userData', JSON.stringify({ username, email, phone, password }));
        signupMessage.textContent = 'Sign up successful! You can now log in.';
    });

    loginForm.addEventListener('submit', (event) => {
        event.preventDefault(); // Prevent the form from submitting the traditional way
        
    
        const email = loginForm.querySelector('input[name="email"]').value;
        const password = loginForm.querySelector('input[name="pswd"]').value;

        const storedData = localStorage.getItem('userData');
        
        if (storedData) {
            const userData = JSON.parse(storedData);
            if (userData.email === email && userData.password === password) {
                loginMessage.textContent = 'Login successful!';


                // Redirect to the products page
                window.location.href = 'product.html';
            } else {
                loginMessage.textContent = 'Invalid email or password. Please sign up if you have not done so.';
            }
        } else {
            loginMessage.textContent = 'Please sign up first.';
        }
    });
});