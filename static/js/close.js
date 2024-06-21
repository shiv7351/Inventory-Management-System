document.getElementById('logout-button').addEventListener('click', function() {
    fetch('/shutdown', {method: 'POST'})
    .then(function(response) {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        window.close(); // Close the window after the server shuts down
    })
    .catch(function(error) {
        console.error('There has been a problem with your fetch operation: ', error);
    });
});
