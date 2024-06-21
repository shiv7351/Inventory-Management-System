from flask import Flask, request, jsonify, render_template, redirect, url_for
import mysql.connector
from mysql.connector import Error
from werkzeug.security import generate_password_hash, check_password_hash
import os
import signal

app = Flask(__name__)

# MySQL connection details
username = 'InventorySystem'
password = 'Inventory@7&1'
host = 'localhost'
database_finance = 'financemanagement'

db_config = {
    'user': 'InventorySystem',
    'password': 'Inventory@7&1',
    'host': 'localhost',
    'database': 'inventorymanagementsystem'
}

# Function to connect to MySQL
def get_db_connection_new(database):
    return mysql.connector.connect(
        user=username,
        password=password,
        host=host,
        database=database
    )

# MySQL database connection
def get_db_connection():
    connection = mysql.connector.connect(
        host="localhost",
        user="InventorySystem",
        password="Inventory@7&1",
        database="inventorymanagementsystem"
    )
    return connection

@app.route('/')
def login():
    return render_template('login.html')

@app.route('/login.html')
def loginform():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def handle_login():
    data = request.json
    username = data.get('username')
    password = data.get('password')

    try:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        cursor.execute("SELECT * FROM usercredentials WHERE username = %s AND password = %s", (username, password))
        user = cursor.fetchone()

        if user:
            return jsonify(success=True)
        else:
            return jsonify(success=False)

    except mysql.connector.Error as e:
        print(f"Error: {e}")
        return jsonify(success=False, error=str(e))

    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()

@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')

@app.route('/dashboard.html')
def Dashboard():
    return render_template('dashboard.html')

@app.route('/product.html')
def product():
    return render_template('product.html')

@app.route('/catalog.html')
def catalog():
    return render_template('catalog.html')

@app.route('/billing.html')
def billing():
    return render_template('billing.html')

@app.route('/finance.html')
def finance():
    return render_template('finance.html')

@app.route('/inventory.html')
def inventory():
    return render_template('inventory.html')

@app.route('/estimate.html')
def estimate():
    return render_template('estimate.html')

@app.route('/analytics.html')
def analytics():
    return render_template('analytics.html')

@app.route('/for_pas')
def for_pas():
    return render_template('for_pas.html')

@app.route('/Create_new_account')
def create_new_account():
    return render_template('Create_new_account.html')

@app.route('/create_account', methods=['POST'])
def create_account():
    try:
        # Get form data
        name = request.form['name']
        username = request.form['username']
        email = request.form['email']
        mobile_number = request.form['mobileNumber']
        security_question1 = request.form['securityQuestion1']
        security_answer1 = request.form['securityAnswer1']
        security_question2 = request.form['securityQuestion2']
        security_answer2 = request.form['securityAnswer2']
        password = request.form['password']
        confirm_password = request.form['confirmPassword']

        # Validate password match
        if password != confirm_password:
            return jsonify({'success': False, 'message': 'Both Password and Confirm Password should be same!!'})

        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        # Check for existing username
        cursor.execute("SELECT * FROM usercredentials WHERE username = %s", (username,))
        if cursor.fetchone():
            return jsonify({'success': False, 'message': 'Please, change the username as it already exists!'})

        # Check for existing email
        cursor.execute("SELECT * FROM usercredentials WHERE email = %s", (email,))
        if cursor.fetchone():
            return jsonify({'success': False, 'message': 'Please use a different email address that is not been used to register earlier. As it already exists!'})

        # Check for existing mobile number
        cursor.execute("SELECT * FROM usercredentials WHERE mobile_number = %s", (mobile_number,))
        if cursor.fetchone():
            return jsonify({'success': False, 'message': 'Please use a different Mobile Number that is not been registered. As this number already exists!'})

        # Insert new user into the database
        cursor.execute("""
            INSERT INTO usercredentials (name, username, email, mobile_number, security_question1, security_answer1, security_question2, security_answer2, password)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (name, username, email, mobile_number, security_question1, security_answer1, security_question2, security_answer2, password))

        connection.commit()

        return jsonify({'success': True, 'message': 'Successfully Created Your Account. Please log in to continue.'})
    except mysql.connector.Error as e:
        print(f"Error: {e}")
        return jsonify({'success': False, 'message': 'An error occurred while creating your account. Please try again.'})
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()

# Route to handle password recovery
@app.route('/recover_password', methods=['POST'])
def recover_password():
    try:
        data = request.json
        name = data.get('name')
        email = data.get('email')
        security_question1 = data.get('securityQuestion1')
        security_answer1 = data.get('securityAnswer1')
        security_question2 = data.get('securityQuestion2')
        security_answer2 = data.get('securityAnswer2')

        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        # Check if email exists
        cursor.execute("SELECT * FROM usercredentials WHERE email = %s", (email,))
        user = cursor.fetchone()

        if user:
            if (user['name'] == name and user['security_question1'] == security_question1 and user['security_answer1'] == security_answer1 and 
                user['security_question2'] == security_question2 and user['security_answer2'] == security_answer2):
                return jsonify({'success': True, 'username': user['username'], 'password': user['password']})
            else:
                return jsonify({'success': False, 'message': 'Entered information is wrong. Please input the correct information.!!!'})
        else:
            return jsonify({'success': False, 'message': 'Entered information is wrong. Please input the correct information.!!!'})

    except mysql.connector.Error as e:
        print(f"Error: {e}")
        return jsonify({'success': False, 'message': 'An error occurred while recovering your password. Please try again.'})
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()

def get_productmanagement_connection():
    try:
        cnx = mysql.connector.connect(
            user=username,
            password=password,
            host=host,
            database='productmanagement'
        )
        return cnx
    except Error as e:
        print(f"Error connecting to MySQL productmanagement database: {e}")
        return None

def get_inventorymanagement_connection():
    try:
        cnx = mysql.connector.connect(
            user=username,
            password=password,
            host=host,
            database='inventorymanagementsystem'
        )
        return cnx
    except Error as e:
        print(f"Error connecting to MySQL inventorymanagementsystem database: {e}")
        return None

@app.route('/fetch-data/<table_name>', methods=['POST'])
def fetch_data(table_name):
    try:
        if table_name == 'all_products':
            data = fetch_all_tables()
        elif table_name == 'electricals':
            data = fetch_electricals_data()
        else:
            data = fetch_specific_table(table_name)
        return jsonify(data)
    except Exception as e:
        return jsonify({'error': str(e)})

def fetch_all_tables():
    cnx = get_productmanagement_connection()
    if not cnx:
        return {'error': 'Unable to connect to the productmanagement database.'}
    
    cursor = cnx.cursor()
    cursor.execute("SHOW TABLES")
    tables = cursor.fetchall()
    result = []
    for table in tables:
        cursor.execute(f"SELECT * FROM {table[0]}")
        rows = cursor.fetchall()
        cursor.execute(f"SHOW COLUMNS FROM {table[0]}")
        columns = [column[0] for column in cursor.fetchall()]
        result.append({'table_name': table[0], 'columns': columns, 'rows': rows})
    cursor.close()
    cnx.close()
    return {'all_tables': result}

def fetch_electricals_data():
    result = []
    cnx = get_inventorymanagement_connection()
    if not cnx:
        return {'error': 'Unable to connect to the inventorymanagementsystem database.'}

    cursor = cnx.cursor()
    
    cursor.execute("SELECT * FROM electricalsseries")
    rows = cursor.fetchall()
    cursor.execute("SHOW COLUMNS FROM electricalsseries")
    columns = [column[0] for column in cursor.fetchall()]
    result.append({'table_name': 'electricalsseries', 'columns': columns, 'rows': rows})

    cursor.execute("SELECT * FROM wires")
    rows = cursor.fetchall()
    cursor.execute("SHOW COLUMNS FROM wires")
    columns = [column[0] for column in cursor.fetchall()]
    result.append({'table_name': 'wires', 'columns': columns, 'rows': rows})

    cursor.close()
    cnx.close()
    return {'all_tables': result}

def fetch_specific_table(table_name):
    if table_name not in ('ac', 'led_tv', 'refrigerator', 'cooler', 'induction', 'mixer_juicer', 'fan', 'washing_machine', 'microwave', 'stabilizer'):
        return {'error': f"Invalid table name: {table_name}"}
        
    cnx = get_productmanagement_connection()
    if not cnx:
        return {'error': 'Unable to connect to the productmanagement database.'}

    cursor = cnx.cursor()
    cursor.execute(f"SELECT * FROM {table_name}")
    rows = cursor.fetchall()
    cursor.execute(f"SHOW COLUMNS FROM {table_name}")
    columns = [column[0] for column in cursor.fetchall()]
    cursor.close()
    cnx.close()
    return {'table_name': table_name, 'columns': columns, 'rows': rows}

@app.route('/fetch-inventory-data', methods=['POST'])
def fetch_inventory_data():
    data = request.json
    table_name = data['tableName']
    columns = data['columns']

    try:
        conn = mysql.connector.connect(user=username,
            password=password,
            host=host,
            database='inventorymanagementsystem')
        cursor = conn.cursor()

        query = f"SELECT {', '.join(columns)} FROM {table_name}"
        cursor.execute(query)
        rows = cursor.fetchall()

        result = {
            "rows": rows
        }
        return jsonify(result)
    except mysql.connector.Error as err:
        return jsonify({"error": str(err)})
    finally:
        cursor.close()
        conn.close()

@app.route('/get_data', methods=['GET'])
def get_data():
    agency = request.args.get('agency')
    table_name = agency.replace('-', '_')
    database = database_finance

    try:
        conn = get_db_connection_new(database)
        cursor = conn.cursor(dictionary=True)

        query = f"SELECT * FROM {table_name}"
        cursor.execute(query)
        rows = cursor.fetchall()

        return jsonify(rows)
    except mysql.connector.Error as err:
        return jsonify({"error": str(err)})
    finally:
        cursor.close()
        conn.close()

@app.route('/update-inventory-data', methods=['POST'])
def update_inventory_data():
    data = request.json
    table_name = data['tableName']
    columns = data['columns']
    rows = data['rows']

    try:
        conn = mysql.connector.connect(user=username,
                                        password=password,
                                        host=host,
                                        database='inventorymanagementsystem')
        cursor = conn.cursor()

        for row in rows:
            if table_name == 'total_quantity':
                query = """UPDATE total_quantity 
                            SET Quantity = %s 
                            WHERE Product = %s AND Category = %s AND Model = %s AND Brand = %s"""
                cursor.execute(query, (
                    row[columns.index('Quantity')],
                    row[columns.index('Product')],
                    row[columns.index('Category')],
                    row[columns.index('Model')],
                    row[columns.index('Brand')]
                ))
            elif table_name == 'electricalsseries':
                query = """UPDATE electricalsseries 
                            SET Havells_Quantity = %s, IndoAsian_Quantity = %s 
                            WHERE Product_Name = %s"""
                cursor.execute(query, (
                    row[columns.index('Havells_Quantity')],
                    row[columns.index('IndoAsian_Quantity')],
                    row[columns.index('Product_Name')]
                ))
            elif table_name == 'wires':
                query = """UPDATE wires 
                            SET Havells_Quantity = %s, Polycab_Quantity = %s 
                            WHERE Size = %s"""
                cursor.execute(query, (
                    row[columns.index('Havells_Quantity')],
                    row[columns.index('Polycab_Quantity')],
                    row[columns.index('Size')]
                ))

        conn.commit()
        return jsonify({"success": True})
    except mysql.connector.Error as err:
        return jsonify({"error": str(err)})
    finally:
        cursor.close()
        conn.close()

# To get analytics data

@app.route('/get_filters', methods=['GET'])
def get_filters():
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        cursor.execute("SELECT DISTINCT Category FROM total_quantity")
        categories = [row[0] for row in cursor.fetchall()]

        cursor.execute("SELECT DISTINCT Brand FROM total_quantity")
        brands = [row[0] for row in cursor.fetchall()]

        cursor.close()
        conn.close()

        return jsonify({'categories': categories, 'brands': brands})
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return jsonify({'error': str(err)}), 500

@app.route('/get_analytics_data', methods=['GET'])
def get_analytics_data():
    filter_value = request.args.get('filter', 'ALL')

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        # Fetch categories for the frontend
        cursor.execute("SELECT DISTINCT Category FROM total_quantity")
        categories = [row['Category'] for row in cursor.fetchall()]

        filter_clause = ""
        filter_params = ()
        if filter_value != 'ALL':
            filter_clause = "WHERE Category = %s OR Brand = %s"
            filter_params = (filter_value, filter_value)
        
        if filter_value == 'Category':
            filter_clause = ""
            filter_params = ()
        
        # Fetch total profit
        cursor.execute(f"SELECT SUM(total_profit_loss) AS totalProfit FROM total_quantity {filter_clause}", filter_params)
        total_profit = cursor.fetchone()['totalProfit']

        # Fetch total sales
        cursor.execute(f"SELECT SUM(units_sold) AS totalSales FROM total_quantity {filter_clause}", filter_params)
        total_sales = cursor.fetchone()['totalSales']

        # Fetch total revenue
        cursor.execute(f"SELECT SUM(total_revenue) AS totalRevenue FROM total_quantity {filter_clause}", filter_params)
        total_revenue = cursor.fetchone()['totalRevenue']

        if filter_value == 'Category':
            # Fetch star performer category
            cursor.execute("SELECT Category, SUM(units_sold) AS totalSales FROM total_quantity GROUP BY Category ORDER BY totalSales DESC LIMIT 1")
            star_performer_data = cursor.fetchone()
            star_performer = star_performer_data['Category'] if star_performer_data else "N/A"
        else:
            # Fetch star performer
            cursor.execute(f"""
                SELECT Brand, Product, MAX(units_sold) AS unitsSold 
                FROM total_quantity 
                {filter_clause}
                GROUP BY Brand, Product 
                ORDER BY unitsSold DESC 
                LIMIT 1
            """, filter_params)
            star_performer_data = cursor.fetchone()
            star_performer = f"{star_performer_data['Brand']} {star_performer_data['Product']}" if star_performer_data else "N/A"

        if filter_value in categories:
            # Fetch brand profit data
            cursor.execute(f"SELECT Brand, SUM(total_profit_loss) AS brandProfit FROM total_quantity {filter_clause} GROUP BY Brand", filter_params)
            brand_profit_data = {row['Brand']: row['brandProfit'] for row in cursor.fetchall()}
        elif filter_value == 'ALL':
            # Fetch brand profit data
            cursor.execute("SELECT Brand, SUM(total_profit_loss) AS brandProfit FROM total_quantity GROUP BY Brand")
            brand_profit_data = {row['Brand']: row['brandProfit'] for row in cursor.fetchall()}
        
        elif filter_value == 'Category':
            # Fetch category profit data
            cursor.execute("SELECT Category, SUM(total_profit_loss) AS categoryProfit FROM total_quantity GROUP BY Category")
            brand_profit_data = {row['Category']: row['categoryProfit'] for row in cursor.fetchall()}
        else:
            # Fetch product profit data for the selected brand
            cursor.execute(f"SELECT Product, SUM(total_profit_loss) AS productProfit FROM total_quantity WHERE Brand = %s GROUP BY Product", (filter_value,))
            brand_profit_data = {row['Product']: row['productProfit'] for row in cursor.fetchall()}

        cursor.close()
        conn.close()

        data = {
            'totalProfit': total_profit,
            'totalSales': total_sales,
            'totalRevenue': total_revenue,
            'starPerformer': star_performer,
            'brandProfitData': brand_profit_data,
            'categories': categories
        }

        return jsonify(data)

    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return jsonify({'error': str(err)}), 500

@app.route('/get_brand_data', methods=['GET'])
def get_brand_data():
    try:
        brand = request.args.get('brand')
        
        # Connect to the database
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        # Fetch total profit for the brand
        cursor.execute("SELECT SUM(total_profit_loss) AS totalProfit FROM total_quantity WHERE Brand = %s", (brand,))
        total_profit = cursor.fetchone()['totalProfit']

        # Fetch total sales for the brand
        cursor.execute("SELECT SUM(units_sold) AS totalSales FROM total_quantity WHERE Brand = %s", (brand,))
        total_sales = cursor.fetchone()['totalSales']

        # Fetch total revenue for the brand
        cursor.execute("SELECT SUM(total_revenue) AS totalRevenue FROM total_quantity WHERE Brand = %s", (brand,))
        total_revenue = cursor.fetchone()['totalRevenue']

        # Fetch star performer for the brand
        cursor.execute("""
            SELECT Brand, Product, MAX(units_sold) AS unitsSold 
            FROM total_quantity 
            WHERE Brand = %s 
            GROUP BY Brand, Product 
            ORDER BY unitsSold DESC 
            LIMIT 1
        """, (brand,))
        star_performer_data = cursor.fetchone()
        star_performer = f"{star_performer_data['Brand']} {star_performer_data['Product']}"

        # Close the database connection
        cursor.close()
        conn.close()

        # Prepare the data to be sent as JSON
        data = {
            'totalProfit': total_profit,
            'totalSales': total_sales,
            'totalRevenue': total_revenue,
            'starPerformer': star_performer,
        }

        return jsonify(data)

    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return jsonify({'error': str(err)}), 500

@app.route('/products', methods=['GET'])
def get_products():
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT DISTINCT Product FROM total_quantity")
    products = [row[0] for row in cursor.fetchall()]
    cursor.close()
    connection.close()
    return jsonify(products)

@app.route('/brands', methods=['GET'])
def get_brands():
    product = request.args.get('product')
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT DISTINCT Brand FROM total_quantity WHERE Product = %s", (product,))
    brands = [row[0] for row in cursor.fetchall()]
    cursor.close()
    connection.close()
    return jsonify(brands)

@app.route('/details', methods=['GET'])
def get_details():
    product = request.args.get('product')
    brand = request.args.get('brand')
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT sp, Model, Category FROM total_quantity WHERE Product = %s AND Brand = %s", (product, brand))
    details = cursor.fetchone()
    cursor.close()
    connection.close()
    return jsonify({'sp': details[0], 'model': details[1], 'category': details[2]})

@app.route('/tax-rate', methods=['GET'])
def get_tax_rate():
    category = request.args.get('category')
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT Tax_Rate FROM taxes WHERE Product = %s", (category,))
    tax_rate = cursor.fetchone()
    cursor.close()
    connection.close()
    return jsonify({'tax_rate': tax_rate[0]})

@app.route('/update-quantity', methods=['POST'])
def update_quantity():
    data = request.json
    product = data['product']
    brand = data['brand']
    quantity = data['quantity']
    
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("""
        UPDATE total_quantity 
        SET Quantity = Quantity - %s, units_sold = units_sold + %s
        WHERE Product = %s AND Brand = %s
    """, (quantity, quantity, product, brand))
    connection.commit()
    cursor.close()
    connection.close()
    return '', 204

@app.route('/api/products', methods=['GET'])
def get_products_new():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT Product_Name AS name FROM electricalsseries UNION SELECT Size AS name FROM wires")
    products = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify({'products': products})

@app.route('/api/brands', methods=['GET'])
def get_brands_new():
    product = request.args.get('product')
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute("""
        SELECT DISTINCT 'Havells' AS brand FROM electricalsseries WHERE Product_Name = %s
        UNION SELECT DISTINCT 'IndoAsian' AS brand FROM electricalsseries WHERE Product_Name = %s
        UNION SELECT DISTINCT 'Havells' AS brand FROM wires WHERE Size = %s
        UNION SELECT DISTINCT 'Polycab' AS brand FROM wires WHERE Size = %s
    """, (product, product, product, product))
    brands = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify({'brands': [b['brand'] for b in brands]})

@app.route('/api/rate', methods=['GET'])
def get_rate_new():
    product = request.args.get('product')
    brand = request.args.get('brand')
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    if brand == 'Havells':
        cursor.execute("SELECT Havells_SP AS rate FROM electricalsseries WHERE Product_Name = %s UNION SELECT Havells_SP AS rate FROM wires WHERE Size = %s", (product, product))
    elif brand == 'IndoAsian':
        cursor.execute("SELECT IndoAsian_SP AS rate FROM electricalsseries WHERE Product_Name = %s", (product,))
    elif brand == 'Polycab':
        cursor.execute("SELECT Polycab_SP AS rate FROM wires WHERE Size = %s", (product,))

    rate = cursor.fetchone()
    cursor.close()
    connection.close()
    return jsonify({'rate': rate['rate'] if rate else 0})

@app.route('/api/update-quantity-new', methods=['POST'])
def update_quantity_new():
    data = request.get_json()
    product = data['product']
    brand = data['brand']
    quantity = data['quantity']

    connection = get_db_connection()
    cursor = connection.cursor()

    if brand == 'Havells':
        cursor.execute("""
            UPDATE electricalsseries 
            SET Havells_Quantity = Havells_Quantity - %s 
            WHERE Product_Name = %s
        """, (quantity, product))
        cursor.execute("""
            UPDATE wires 
            SET Havells_Quantity = Havells_Quantity - %s 
            WHERE Size = %s
        """, (quantity, product))
    elif brand == 'IndoAsian':
        cursor.execute("""
            UPDATE electricalsseries 
            SET IndoAsian_Quantity = IndoAsian_Quantity - %s 
            WHERE Product_Name = %s
        """, (quantity, product))
    elif brand == 'Polycab':
        cursor.execute("""
            UPDATE wires 
            SET Polycab_Quantity = Polycab_Quantity - %s 
            WHERE Size = %s
        """, (quantity, product))

    connection.commit()
    cursor.close()
    connection.close()
    return jsonify({'status': 'success'})


@app.route('/get_alerts', methods=['GET'])
def get_alerts():
    alerts = []
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor()

    # Check total_quantity table
    cursor.execute("SELECT Product, Quantity, Brand, Model FROM total_quantity WHERE Quantity <= 5")
    for (Product, Quantity, Brand, Model) in cursor:
        alerts.append({"message": f"Quantity of {Brand} {Product} whose modal number is '{Model}' is just {Quantity} which is very less. I think we should place its order."})

    # Check electricalsseries table
    cursor.execute("SELECT Product_Name, Havells_Quantity, IndoAsian_Quantity FROM electricalsseries")
    for (Product_Name, Havells_Quantity, IndoAsian_Quantity) in cursor:
        if Havells_Quantity < 10:
            alerts.append({"message": f"Quantity of Havells {Product_Name} is just {Havells_Quantity} which is very less. I think we should place its order."})
        if IndoAsian_Quantity < 10:
            alerts.append({"message": f"Quantity of IndoAsian {Product_Name} is just {IndoAsian_Quantity} which is very less. I think we should place its order."})

    # Check wires table
    cursor.execute("SELECT Size, Havells_Quantity, Polycab_Quantity FROM wires")
    for (Size, Havells_Quantity, Polycab_Quantity) in cursor:
        if Havells_Quantity < 8:
            alerts.append({"message": f"Quantity of Havells {Size} wire is just {Havells_Quantity} which is very less. I think we should place its order."})
        if Polycab_Quantity < 8:
            alerts.append({"message": f"Quantity of Polycab {Size} wire is just {Polycab_Quantity} which is very less. I think we should place its order."})

    cursor.close()
    connection.close()

    return jsonify(alerts)


if __name__ == '__main__':
    app.run(debug=True)
