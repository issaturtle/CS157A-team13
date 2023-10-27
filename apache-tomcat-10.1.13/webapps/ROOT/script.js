const gamePricingData = [
    { store: 'Store 1', price: 49.99 },
    { store: 'Store 2', price: 54.99 },
    { store: 'Store 3', price: 47.99 },
    { store: 'Store 4', price: 52.99 },
    { store: 'Store 5', price: 100.99 },
];

// Extract labels and data
const labels = gamePricingData.map(entry => entry.store);
const data = gamePricingData.map(entry => entry.price);

// Create the plot chart
const ctx = document.getElementById('pricingChart').getContext('2d');
const pricingChart = new Chart(ctx, {
    type: 'scatter',
    data: {
        datasets: [{
            data: gamePricingData,
            pointBackgroundColor: 'rgba(75, 192, 192, 1)',
            showLine: false,
            borderWidth: 1,
            borderColor: 'rgba(75, 192, 192, 1)',
            label: 'Price in USD',
        }],
    },
    options: {
        scales: {
            x: {
                type: 'category',
                labels: labels,
            },
            y: {
                type: 'linear',
                beginAtZero: true,
                title: {
                    display: true,
                    text: 'Price in USD',
                },
            },
        },
    },
});