// Basic interactivity, if needed

document.addEventListener('DOMContentLoaded', function() {
    // Example: Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });
});

document.addEventListener('DOMContentLoaded', () => {
    const phoneButton = document.getElementById('phone-number');

    phoneButton.addEventListener('click', () => {
        const phoneNumber = phoneButton.getAttribute('data-phone');
        window.location.href = `tel:${phoneNumber}`;
    });
});

