document.addEventListener("DOMContentLoaded", function() {
    const loginForm = document.getElementById('loginForm');
    const messageDiv = document.getElementById('message');
    let attemptCount = 0;
    const maxAttempts = 5;
    const waitTime = 60000; // 1 minute in milliseconds

    loginForm.addEventListener('submit', function(event) {
        event.preventDefault();
        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;

        if (!username || !password) {
            showMessage('Please fill in both fields.', 5000);
            return;
        }

        fetch('/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ username, password }),
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                showMessage('Successfully Logged In.', 5000, () => {
                    window.location.href = '/dashboard';
                });
            } else {
                attemptCount++;
                if (attemptCount >= maxAttempts) {
                    showCountdownMessage('Too many failed attempts. Please wait 1 minute.', waitTime, resetAttempts);
                    disableForm(true);
                } else {
                    showMessage(`Enter correct Username and Password!! (${maxAttempts - attemptCount} attempts left)`, 5000);
                }
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showMessage('An error occurred. Please try again later.', 5000);
        });
    });

    document.querySelectorAll('.links a').forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            window.location.href = link.getAttribute('href');
        });
    });

    function showMessage(message, duration, callback) {
        messageDiv.textContent = message;
        messageDiv.style.display = 'block';
        setTimeout(() => {
            messageDiv.style.display = 'none';
            if (callback) callback();
        }, duration);
    }

    function showCountdownMessage(message, duration, callback) {
        const messageDiv = document.getElementById('message'); // Ensure you have an element with id="message"
        messageDiv.innerHTML = `
            <div class="countdown-container">
                <p>${message}</p>
                <div id="countdown" class="countdown-circle"></div>
            </div>`;
        messageDiv.style.display = 'block';
        
        let countdownTime = duration / 1000;
        const countdownElement = document.getElementById('countdown');
        countdownElement.textContent = countdownTime;
        
        const countdownInterval = setInterval(() => {
            countdownTime--;
            countdownElement.textContent = countdownTime;
            
            // Animate the circle
            const degrees = ((duration / 1000 - countdownTime) / (duration / 1000)) * 360;
            countdownElement.style.background = `conic-gradient(
                #007bff ${degrees}deg, 
                #e9ecef ${degrees}deg
            )`;
            
            if (countdownTime <= 0) {
                clearInterval(countdownInterval);
                messageDiv.style.display = 'none';
                if (callback) callback();
            }
        }, 1000);
    }
    

    function disableForm(disable) {
        const inputs = loginForm.querySelectorAll('input, button');
        inputs.forEach(input => {
            input.disabled = disable;
        });
        if (disable) {
            messageDiv.style.pointerEvents = 'none';
        } else {
            messageDiv.style.pointerEvents = 'auto';
        }
    }

    function resetAttempts() {
        attemptCount = 0;
        disableForm(false);
    }
});
