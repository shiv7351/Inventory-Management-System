document.addEventListener('DOMContentLoaded', function () {
    const bell = document.querySelector('.notification-bell');
    const panel = document.querySelector('.notification-panel');

    bell.addEventListener('click', () => {
        panel.classList.toggle('open');
        if (panel.classList.contains('open')) {
            fetchAlerts();
        } else {
            hideNotifications();
        }
    });

    function fetchAlerts() {
        fetch('/get_alerts')
            .then(response => response.json())
            .then(data => {
                panel.innerHTML = '';
                if (data.length === 0) {
                    const div = document.createElement('div');
                    div.className = 'notification';
                    div.textContent = 'No notification message from the system. Thanks for Visiting Me.';
                    panel.appendChild(div);
                } else {
                    data.forEach((alert, index) => {
                        setTimeout(() => {
                            const div = document.createElement('div');
                            div.className = 'notification';
                            div.textContent = alert.message;
                            panel.appendChild(div);
                        }, index * 100); // Stagger the notifications
                    });
                }
            });
    }

    function hideNotifications() {
        const notifications = document.querySelectorAll('.notification');
        notifications.forEach((notification, index) => {
            setTimeout(() => {
                notification.classList.add('hide');
                setTimeout(() => {
                    notification.remove();
                }, 300); // Wait for the animation to finish before removing
            }, index * 100); // Stagger the notifications
        });
    }
});
