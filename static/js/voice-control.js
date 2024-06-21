// Initialize Speech Recognition
window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

const recognition = new SpeechRecognition();
recognition.continuous = true;  // Keep listening until explicitly stopped
recognition.lang = 'en-US';

const commands = {
    "open inventory page": "inventory.html",
    "take me to inventory page": "inventory.html",
    "go to inventory page": "inventory.html",
    "take me to the inventory page": "inventory.html",
    "go to the inventory page": "inventory.html",
    "load inventory page": "inventory.html",
    "visit inventory page": "inventory.html",
    "load the inventory page": "inventory.html",
    "visit the inventory page": "inventory.html",
    "load inventory": "inventory.html",
    "visit inventory": "inventory.html",
    "open billing page": "billing.html",
    "take me to billing page": "billing.html",
    "go to billing page": "billing.html",
    "take me to the billing page": "billing.html",
    "go to the billing page": "billing.html",
    "load billing page": "billing.html",
    "visit billing page": "billing.html",
    "load the billing page": "billing.html",
    "visit the billing page": "billing.html",
    "load billing": "billing.html",
    "visit billing": "billing.html",
    "open dashboard": "dashboard.html",
    "take me to dashboard": "dashboard.html",
    "go to dashboard": "dashboard.html",
    "load dashboard": "dashboard.html",
    "visit dashboard": "dashboard.html",
    "open estimate page": "estimate.html",
    "take me to estimate page": "estimate.html",
    "go to estimate page": "estimate.html",
    "load estimate page": "estimate.html",
    "visit estimate page": "estimate.html",
    "load the estimate page": "estimate.html",
    "visit the estimate page": "estimate.html",
    "load estimate": "estimate.html",
    "visit estimate": "estimate.html",
    "open finance page": "finance.html",
    "take me to finance page": "finance.html",
    "go to finance page": "finance.html",
    "load finance page": "finance.html",
    "visit finance page": "finance.html",
    "load the finance page": "finance.html",
    "visit the finance page": "finance.html",
    "load finance": "finance.html",
    "visit finance": "finance.html",
    "open catalogue page": "catalog.html",
    "take me to catalogue page": "catalog.html",
    "go to catalogue page": "catalog.html",
    "load catalogue page": "catalog.html",
    "visit catalogue page": "catalog.html",
    "load the catalogue page": "catalog.html",
    "visit the catalogue page": "catalog.html",
    "load catalogue": "catalog.html",
    "visit catalogue": "catalog.html",
    "open analytics page": "analytics.html",
    "take me to analytics page": "analytics.html",
    "go to analytics page": "analytics.html",
    "load analytics page": "analytics.html",
    "visit analytics page": "analytics.html",
    "load the analytics page": "analytics.html",
    "visit the analytics page": "analytics.html",
    "load analytics": "analytics.html",
    "visit analytics": "analytics.html",
    "logout": "logout"
};

recognition.onresult = (event) => {
    const transcript = event.results[event.results.length - 1][0].transcript.trim().toLowerCase();
    console.log('Transcript:', transcript);
    
    if (transcript === "logout") {
        logout();
    } else if (commands[transcript]) {
        window.location.href = commands[transcript];
    }
};

recognition.onstart = () => {
    console.log("Voice recognition activated.");
};

recognition.onend = () => {
    console.log("Voice recognition ended.");
    // Automatically restart recognition unless on login page
    if (!window.location.href.includes("login.html")) {
        recognition.start();
    }
};

recognition.onerror = (event) => {
    console.error("Voice recognition error:", event.error);
    // Automatically restart recognition unless on login page
    if (!window.location.href.includes("login.html")) {
        recognition.start();
    }
};

// Logout function
function logout() {
    window.location.href = 'login.html';
    history.pushState(null, '', 'login.html');
    history.pushState(null, '', 'login.html');
    history.go(-1);
}

// Start voice recognition
if (!window.location.href.includes("login.html")) {
    recognition.start();
}

// Handle back button on login page
window.addEventListener('popstate', function(event) {
    if (window.location.pathname.endsWith('login.html')) {
        window.location.href = 'login.html';
    }
});
