const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json()); // For JSON payloads

app.post('/register', (req, res) => {
    const { name, address, email, password, subject, agree } = req.body;

    // Basic server-side validation
    if (!name || /\d/.test(name)) {
        return res.status(400).json({ success: false, message: 'Invalid name' });
    }
    if (!address) {
        return res.status(400).json({ success: false, message: 'Invalid address' });
    }
    if (!email || !email.includes('@')) {
        return res.status(400).json({ success: false, message: 'Invalid email' });
    }
    if (!password || password.length < 6) {
        return res.status(400).json({ success: false, message: 'Invalid password' });
    }
    if (!subject) {
        return res.status(400).json({ success: false, message: 'Subject is required' });
    }
    if (!agree) {
        return res.status(400).json({ success: false, message: 'You must agree to the terms' });
    }

    // Process the registration (e.g., save to a database)
    // ...

    // Respond with success
    res.status(200).json({ success: true });
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});

app.post('/login', (req, res) => {
    const { email, password } = req.body;
    const user = users.find(u => u.email === email && u.password === password);
    if (user) {
        res.status(200).send({ message: 'Login successful' });
    } else {
        res.status(401).send({ message: 'Invalid credentials' });
    }
});


document.addEventListener('DOMContentLoaded', function () {
    const cartItemsContainer = document.querySelector('.cart-items');
    const cartTotalElement = document.getElementById('cart-total');
    const checkoutButton = document.getElementById('checkout-button');

    let cart = [];

    document.querySelectorAll('.add-to-cart').forEach(button => {
        button.addEventListener('click', function () {
            const product = this.closest('.product');
            const price = parseFloat(product.getAttribute('data-price'));
            const name = product.querySelector('h3').textContent;

            cart.push({ name, price });
            updateCart();
        });
    });

    function updateCart() {
        cartItemsContainer.innerHTML = '';
        let total = 0;

        cart.forEach(item => {
            total += item.price;
            const itemElement = document.createElement('div');
            itemElement.textContent = `${item.name} - $${item.price.toFixed(2)}`;
            cartItemsContainer.appendChild(itemElement);
        });

        cartTotalElement.textContent = total.toFixed(2);
    }

    checkoutButton.addEventListener('click', function () {
        alert('Proceeding to checkout');
        // Implement checkout logic here
    });
});

function handleSignup(event) {
    event.preventDefault(); // Prevent the default form submission

    const form = document.getElementById('signup-form');
    const formData = new FormData(form);

    fetch('/register', { // Update this URL to your backend endpoint
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Registration successful');
            // Redirect to login or another page if necessary
        } else {
            alert('Registration failed: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred. Please try again.');
    });
}

function handleLogin(event) {
    event.preventDefault(); // Prevent the default form submission

    const form = document.getElementById('login-form');
    const formData = new FormData(form);

    fetch('/login', { // Update this URL to your backend login endpoint
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Login successful');
            // Redirect to the app or another page if necessary
        } else {
            alert('Login failed: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred. Please try again.');
    });
}
