# Inventory Management System (IMS)

## Overview
The Inventory Management System (IMS) is a comprehensive web application designed to streamline the inventory, billing, and financial operations of an Electronics and Electricals Shop. Developed using Flask, MySQL, HTML, CSS, and JavaScript, the IMS provides an efficient and user-friendly platform for managing shop activities, reducing paperwork, and improving service efficiency.

## Features
- User authentication and authorization
- Dynamic inventory management
- Billing and estimate generation
- Product catalog management
- Voice navigation
- Financial management and reporting
- Real-time analytics and dynamic charts
- Sliding menu bar for easy navigation
- Real-time notifications for low stock alerts

## Installation
### Prerequisites
- Python 3.6 or higher
- MySQL Server

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/shiv7351/Inventory-Management-System.git
   cd Inventory-Management-System
Install dependencies:
bash
Copy code
pip install -r requirements.txt
Initialize the database:
bash
Copy code
flask db init
flask db migrate -m "Initial migration"
flask db upgrade
Run the application:
bash
Copy code
flask run
Open the application in your web browser at http://localhost:5000.
Usage
User Guide
Logging In: Enter your credentials on the login page.
Dashboard: View key metrics and navigate using the sliding menu bar.
Inventory Management: Manage stock levels and product details.
Billing and Estimates: Generate invoices and estimates.
Analytics: View sales trends and apply filters.
Notifications: Receive alerts for low stock levels.
Documentation
Refer to the IMS Documentation for detailed information.

Future Enhancements
Mobile app integration
Predictive analytics using machine learning
Enhanced voice navigation
E-commerce platform integration
References
Grinberg, M. (2018). Flask Web Development: Developing Web Applications with Python. O'Reilly Media.
Williams, N., & Lavin, M. (2017). Learning MySQL. O'Reilly Media.
Duckett, J. (2014). HTML and CSS: Design and Build Websites. Wiley.
