// cart.js

document.addEventListener('DOMContentLoaded', function() {
    const cartItemsContainer = document.getElementById('cartItems');
    const totalAmountElement = document.getElementById('totalAmount');
    const checkoutButton = document.getElementById('checkoutButton');

    // Example items for the cart
    let cart = [
        { id: 1, name: 'Product 1', price: 10.00, quantity: 2 },
        { id: 2, name: 'Product 2', price: 20.00, quantity: 1 }
    ];

    // Function to render cart items
    function renderCart() {
        cartItemsContainer.innerHTML = '';
        let total = 0;

        cart.forEach(item => {
            const itemTotal = item.price * item.quantity;
            total += itemTotal;

            const div = document.createElement('div');
            div.className = 'cart-item';
            div.innerHTML = `
                <span>${item.name} - $${item.price.toFixed(2)} x ${item.quantity}</span>
                <span>$${itemTotal.toFixed(2)}</span>
            `;
            cartItemsContainer.appendChild(div);
        });

        totalAmountElement.textContent = total.toFixed(2);
    }

    // Function to handle checkout
    function handleCheckout() {
        alert('Proceeding to checkout');
        // Handle checkout logic here (e.g., redirect to checkout page or show checkout form)
    }

    // Initial render of the cart
    renderCart();

    // Event listener for the checkout button
    checkoutButton.addEventListener('click', handleCheckout);
});


function checkout() {
    // Prompt user for payment code
    const paymentCode = prompt('Please enter your payment code:');

    // Simple validation (you can expand this)
    if (paymentCode) {
        // Here, you would typically validate the payment code with your backend
        alert('Payment code received. Processing your order...');
        
        // Clear cart after checkout
        localStorage.removeItem('cart');

        // Redirect to a confirmation or payment page (optional)
        window.location.href = 'confirmation.html'; // Change to your confirmation page URL
    } else {
        alert('Payment code is required.');
    }
}
