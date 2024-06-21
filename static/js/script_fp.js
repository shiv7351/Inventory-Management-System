document.addEventListener("DOMContentLoaded", function() {
    const recoveryForm = document.getElementById("recoveryForm");
    const getCredentialsBtn = document.getElementById("getCredentialsBtn");
    const messageBox = document.getElementById("messageBox");
    const messageText = document.getElementById("messageText");
    const closeMessageBox = document.getElementById("closeMessageBox");

    let attempts = 0;
    let lockoutTime = 0;

    getCredentialsBtn.addEventListener("click", function() {
        if (lockoutTime > 0) {
            return;
        }

        const formData = new FormData(recoveryForm);
        const data = Object.fromEntries(formData);

        fetch('/recover_password', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then(response => response.json())
        .then(result => {
            if (result.success) {
                showMessageBox(`Username: ${result.username}<br>Password: ${result.password}`);
                setTimeout(() => {
                    window.location.href = "/";
                }, 5000);
            } else {
                attempts++;
                if (attempts >= 5) {
                    lockoutTime = 60;
                    const interval = setInterval(() => {
                        lockoutTime--;
                        showMessageBox(`Too many failed attempts. Please wait for ${lockoutTime} seconds to continue.`);
                        if (lockoutTime <= 0) {
                            clearInterval(interval);
                            hideMessageBox();
                            attempts = 0;
                        }
                    }, 1000);
                } else {
                    showMessageBox(result.message);
                    setTimeout(hideMessageBox, 5000);
                }
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });

    // closeMessageBox.addEventListener("click", function() {
    //     window.location.href = "login.html";
    // });

    function showMessageBox(message) {
        messageText.innerHTML = message;
        messageBox.style.display = "block";
    }

    function hideMessageBox() {
        messageBox.style.display = "none";
    }
});
