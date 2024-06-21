document.getElementById('createAccountForm').onsubmit = function(event) {
    event.preventDefault();
    var formData = new FormData(this);

    var password = formData.get('password');
    var confirmPassword = formData.get('confirm_password');

    if (password !== confirmPassword) {
        displayMessage('Both Password and Confirm Password should be same!!', 5000);
        return;
    }

    fetch('/create_account', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            displayMessage(data.message || 'Account created successfully.', 3000);
            setTimeout(() => {
                window.location.href = '/';
            }, 3000);
        } else {
            displayMessage(data.message || 'Account creation failed.', 5000);
        }
    });
};

function displayMessage(message, duration) {
    var messageDiv = document.getElementById('message');
    messageDiv.textContent = message;
    messageDiv.style.display = 'block';
    setTimeout(() => {
        messageDiv.style.display = 'none';
    }, duration);
}
