// Function to add two numbers
function add(a, b) {
    return a + b;
}

// Function to subtract two numbers
function subtract(a, b) {
    return a - b;
}

// Function to divide two numbers
function divide(a, b) {
    if (b === 0) {
        showError("Cannot divide by zero.");
        return undefined;
    }
    return a / b;
}

// Function to multiply two numbers
function multiply(a, b) {
    return a * b;
}

// Get DOM elements
const num1Input = document.getElementById('num1');
const num2Input = document.getElementById('num2');
const resultValue = document.getElementById('resultValue');
const errorMessage = document.getElementById('errorMessage');
const ctx = document.getElementById('myChart').getContext('2d');

// Initialize chart variable
let myChart;

// Function to display result and clear error message
function displayResult(result) {
    resultValue.textContent = result;
    errorMessage.textContent = ''; // Clear any existing error message
    updateChart(result);
}

// Function to show error message
function showError(message) {
    resultValue.textContent = 'N/A'; // Clear result
    errorMessage.textContent = message;
}

// Function to update chart
function updateChart(result) {
    if (myChart) {
        myChart.destroy(); // Destroy existing chart if any
    }

    const num1 = parseFloat(num1Input.value);
    const num2 = parseFloat(num2Input.value);

    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Number 1', 'Number 2', 'Result'],
            datasets: [{
                label: 'Arithmetic Values',
                data: [num1, num2, result],
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56'],
                borderColor: ['#FF6384', '#36A2EB', '#FFCE56'],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

// Event handler function for performing calculations
function performCalculation(operation) {
    const num1 = parseFloat(num1Input.value);
    const num2 = parseFloat(num2Input.value);

    if (isNaN(num1) || isNaN(num2)) {
        showError("Please enter valid numbers.");
        return;
    }

    let result;
    switch (operation) {
        case 'add':
            result = add(num1, num2);
            break;
        case 'subtract':
            result = subtract(num1, num2);
            break;
        case 'multiply':
            result = multiply(num1, num2);
            break;
        case 'divide':
            result = divide(num1, num2);
            break;
        default:
            result = 'Unknown operation';
            showError("Unknown operation.");
            return;
    }

    // Update result display
    displayResult(result);
}

// Add event listeners to buttons
document.getElementById('addBtn').addEventListener('click', () => performCalculation('add'));
document.getElementById('subtractBtn').addEventListener('click', () => performCalculation('subtract'));
document.getElementById('multiplyBtn').addEventListener('click', () => performCalculation('multiply'));
document.getElementById('divideBtn').addEventListener('click', () => performCalculation('divide'));
