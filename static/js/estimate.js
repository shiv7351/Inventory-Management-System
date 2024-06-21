// Get DOM elements
const productTable = document.getElementById('product-table');
const invoiceTable = document.getElementById('invoice-table');
const addProductButton = document.getElementById('add-product');
const deleteProductButton = document.getElementById('delete-product');
const generateButton = document.getElementById('generate');
const generateButtonBill = document.getElementById('bill');
const newButton = document.getElementById('new');
const invoiceDate = document.getElementById('invoice-date');
const invoiceNumber = document.getElementById('invoice-number');
const customerDetailsInvoice = document.getElementById('customer-details');
const sgst = document.getElementById("sgst");
const cgst = document.getElementById("cgst");
const total = document.getElementById("total");

// Form elements
const nameInput = document.getElementById('name');
const addressInput = document.getElementById('address');
const mobileInput = document.getElementById('mobile');
const dateInput = document.getElementById('date');

// Variables
let serialNumber = 1;
const SGST = 9;
const CGST = 9;

// Initialize date and add first product row
dateInput.valueAsDate = new Date();
addProductRow();

// Event listeners
addProductButton.addEventListener('click', addProductRow);
deleteProductButton.addEventListener('click', deleteProductRow);
generateButton.addEventListener('click', generateInvoice);
generateButtonBill.addEventListener('click', generateInvoiceBill);
newButton.addEventListener('click', () => location.reload());
const printButton = document.getElementById('print');
printButton.addEventListener('click', printInvoice);

// Fetch data for dropdowns
async function fetchData() {
    const response = await fetch('/api/products');
    const data = await response.json();
    return data;
}

// Function to add a product row
async function addProductRow() {
    const data = await fetchData();
    const productOptions = data.products.map(product => `<option value="${product.name}">${product.name}</option>`).join('');
    const newRow = productTable.insertRow();
    newRow.innerHTML = `<td>${serialNumber++}</td>
        <td><select class="product-select">${productOptions}</select></td>
        <td><select class="brand-select"></select></td>
        <td><input type="number" placeholder="Quantity" min="1" value="1" required></td>
        <td><input type="number" class="rate-input" placeholder="Rate" min="0" value="0" required readonly></td>`;
    setupProductBrandListener(newRow);
}

// Function to delete the last product row
function deleteProductRow() {
    if (productTable.rows.length > 2) {
        productTable.deleteRow(productTable.rows.length - 1);
        serialNumber--;
    }
}

// Function to update inventory
async function updateInventory(product, brand, quantity) {
    const response = await fetch('/api/update_inventory-new', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ product, brand, quantity })
    });

    if (!response.ok) {
        console.error('Failed to update inventory');
    }
}


// Function to generate the Estimate and update database

async function generateInvoiceBill() {
    if (!nameInput.value || !addressInput.value || !mobileInput.value) {
        alert("Please fill in all customer details.");
        return;
    }

    let totalPrice = 0;
    let invoiceTableBody = invoiceTable.getElementsByTagName('tbody')[0];
    invoiceTableBody.innerHTML = '';

    const rows = productTable.rows;
    const updateRequests = [];

    for (let i = 1; i < rows.length; i++) {
        const cells = rows[i].cells;
        const product = cells[1].getElementsByTagName('select')[0].value;
        const brand = cells[2].getElementsByTagName('select')[0].value;
        const quantity = parseFloat(cells[3].getElementsByTagName('input')[0].value);
        const rate = parseFloat(cells[4].getElementsByTagName('input')[0].value);
        const amount = quantity * rate;
        totalPrice += amount;
        invoiceTableBody.innerHTML += `<tr><td>${i}</td><td>${product}</td><td>${quantity}</td><td>${rate.toFixed(2)}</td><td>${amount.toFixed(2)}</td></tr>`;
        
        // Add update request for inventory
        updateRequests.push(updateInventory(product, brand, quantity));
    }

    // Wait for all inventory updates to complete
    await Promise.all(updateRequests);

    invoiceDate.textContent = dateInput.value || new Date().toLocaleDateString();
    invoiceNumber.textContent = 'INV-' + Math.floor(Math.random() * 10000);

    let sgstAmount = (totalPrice * SGST) / 100;
    let cgstAmount = (totalPrice * CGST) / 100;
    sgst.innerText = sgstAmount.toFixed(2);
    cgst.innerText = cgstAmount.toFixed(2);
    total.innerText = (totalPrice + sgstAmount + cgstAmount).toFixed(2);

    customerDetailsInvoice.innerHTML = `<p>${nameInput.value}</p><p>${addressInput.value}</p><p>${mobileInput.value}</p>`;
}

// Function to generate the Estimate Bill
async function generateInvoice() {
    if (!nameInput.value || !addressInput.value || !mobileInput.value) {
        alert("Please fill in all customer details.");
        return;
    }

    let totalPrice = 0;
    let invoiceTableBody = invoiceTable.getElementsByTagName('tbody')[0];
    invoiceTableBody.innerHTML = '';

    const rows = productTable.rows;
    const updateRequests = [];

    for (let i = 1; i < rows.length; i++) {
        const cells = rows[i].cells;
        const product = cells[1].getElementsByTagName('select')[0].value;
        const brand = cells[2].getElementsByTagName('select')[0].value;
        const quantity = parseFloat(cells[3].getElementsByTagName('input')[0].value);
        const rate = parseFloat(cells[4].getElementsByTagName('input')[0].value);
        const amount = quantity * rate;
        totalPrice += amount;
        invoiceTableBody.innerHTML += `<tr><td>${i}</td><td>${product}</td><td>${quantity}</td><td>${rate.toFixed(2)}</td><td>${amount.toFixed(2)}</td></tr>`;

        updateRequests.push(fetch('/api/update-quantity', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                product,
                brand,
                quantity
            })
        }));
    }

    invoiceDate.textContent = dateInput.value || new Date().toLocaleDateString();
    invoiceNumber.textContent = 'INV-' + Math.floor(Math.random() * 10000);

    let sgstAmount = (totalPrice * SGST) / 100;
    let cgstAmount = (totalPrice * CGST) / 100;
    sgst.innerText = sgstAmount.toFixed(2);
    cgst.innerText = cgstAmount.toFixed(2);
    total.innerText = (totalPrice + sgstAmount + cgstAmount).toFixed(2);

    customerDetailsInvoice.innerHTML = `<p>${nameInput.value}</p><p>${addressInput.value}</p><p>${mobileInput.value}</p>`;

    await Promise.all(updateRequests);
}

// Function to setup listeners for product and brand dropdowns
async function setupProductBrandListener(row) {
    const productSelect = row.querySelector('.product-select');
    const brandSelect = row.querySelector('.brand-select');
    const rateInput = row.querySelector('.rate-input');

    productSelect.addEventListener('change', async () => {
        const selectedProduct = productSelect.value;
        const response = await fetch(`/api/brands?product=${selectedProduct}`);
        const data = await response.json();
        const brandOptions = data.brands.map(brand => `<option value="${brand}">${brand}</option>`).join('');
        brandSelect.innerHTML = brandOptions;
        brandSelect.dispatchEvent(new Event('change'));
    });

    brandSelect.addEventListener('change', async () => {
        const selectedProduct = productSelect.value;
        const selectedBrand = brandSelect.value;
        const response = await fetch(`/api/rate?product=${selectedProduct}&brand=${selectedBrand}`);
        const data = await response.json();
        rateInput.value = data.rate;
    });

    productSelect.dispatchEvent(new Event('change'));
}

// Function to print only the invoice
function printInvoice() {
    const invoiceElement = document.querySelector('.invoice').innerHTML;
    const originalContents = document.body.innerHTML;

    document.body.innerHTML = `<div class="invoice">${invoiceElement}</div>`;
    window.print();
    document.body.innerHTML = originalContents;

    // Reattach event listeners after restoring the original content
    addProductButton.addEventListener('click', addProductRow);
    deleteProductButton.addEventListener('click', deleteProductRow);
    generateButton.addEventListener('click', generateInvoice);
    generateButtonBill.addEventListener('click', generateInvoiceBill);
    newButton.addEventListener('click', () => location.reload());
    printButton.addEventListener('click', printInvoice);
}
