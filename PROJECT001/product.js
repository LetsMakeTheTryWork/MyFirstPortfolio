

// Function to add a product to the cart
function addToCart(productName, price) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];

    // Check if the product already exists in the cart
    const existingProduct = cart.find(item => item.name === productName);
    if (existingProduct) {
        existingProduct.quantity += 1;
    } else {
        cart.push({ name: productName, price: price, quantity: 1 });
    }


    // Save the updated cart back to local storage
    localStorage.setItem('cart', JSON.stringify(cart));
    alert(`${productName} added to cart!`);
}
