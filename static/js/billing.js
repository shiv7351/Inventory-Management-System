document.addEventListener("DOMContentLoaded", () => {
    let invoiceNumber = 1;
    let srNoCounter = 1;

    async function fetchProducts() {
        const response = await fetch('/products');
        const products = await response.json();
        return products;
    }

    async function fetchBrands(product) {
        const response = await fetch(`/brands?product=${product}`);
        const brands = await response.json();
        return brands;
    }

    async function fetchDetails(product, brand) {
        const response = await fetch(`/details?product=${product}&brand=${brand}`);
        const details = await response.json();
        return details;
    }

    async function fetchTaxRate(category) {
        const response = await fetch(`/tax-rate?category=${category}`);
        const taxRate = await response.json();
        return taxRate;
    }

    async function addProductRow() {
        const tableBody = document.getElementById("productTable").getElementsByTagName("tbody")[0];
        const newRow = tableBody.insertRow();

        const products = await fetchProducts();

        newRow.innerHTML = `
            <td>${srNoCounter++}</td>
            <td>
                <select class="product">
                    <option value="">Select</option>
                    ${products.map(product => `<option value="${product}">${product}</option>`).join('')}
                </select>
            </td>
            <td>
                <select class="brand">
                    <option value="">Select</option>
                </select>
            </td>
            <td><input type="number" class="quantity" min="1" value="1"></td>
            <td><input type="number" class="rate" min="0" value="0" readonly></td>
            <td><input type="text" class="model" readonly></td>
            <td><input type="text" class="category" readonly></td>
            <td>
                <select class="status">
                    <option value="Paid">Paid</option>
                    <option value="Unpaid">Unpaid</option>
                </select>
            </td>
        `;

        const productSelect = newRow.querySelector('.product');
        const brandSelect = newRow.querySelector('.brand');
        const rateInput = newRow.querySelector('.rate');
        const modelInput = newRow.querySelector('.model');
        const categoryInput = newRow.querySelector('.category');

        productSelect.addEventListener('change', async function () {
            const brands = await fetchBrands(this.value);
            brandSelect.innerHTML = `<option value="">Select</option>${brands.map(brand => `<option value="${brand}">${brand}</option>`).join('')}`;
        });

        brandSelect.addEventListener('change', async function () {
            const details = await fetchDetails(productSelect.value, this.value);
            rateInput.value = details.sp;
            modelInput.value = details.model;
            categoryInput.value = details.category;
        });
    }

    function deleteLastProductRow() {
        const tableBody = document.getElementById("productTable").getElementsByTagName("tbody")[0];
        if (tableBody.rows.length > 0) {
            tableBody.deleteRow(-1);
            srNoCounter--;
        }
    }

    function refreshPage() {
        srNoCounter = 1;
        location.reload();
    }

    async function generateInvoice() {
        const customerName = document.getElementById("name").value;
        const customerAddress = document.getElementById("address").value;
        const customerMobile = document.getElementById("mobile").value;
        let invoiceDate = document.getElementById("date").value;

        if (!invoiceDate) {
            const now = new Date();
            invoiceDate = now.toLocaleDateString();
        }

        const productRows = document.querySelectorAll("#productTable tbody tr");
        let invoiceTableHTML = `
            <thead>
                <tr>
                    <th>Sr. No.</th>
                    <th>Product</th>
                    <th>Qty.</th>
                    <th>Rate</th>
                    <th>Amount</th>
                    <th>GST Rate</th>
                    <th>GST Amount</th>
                    <th>Total Amount</th>
                </tr>
            </thead>
            <tbody>
        `;
        let totalAmount = 0;

        for (const row of productRows) {
            const product = row.querySelector(".product").value;
            const brand = row.querySelector(".brand").value;
            const quantity = parseInt(row.querySelector(".quantity").value);
            const rate = parseFloat(row.querySelector(".rate").value);
            const amount = quantity * rate;
            const category = row.querySelector(".category").value;
            const taxRate = await fetchTaxRate(category);
            const gstRate = taxRate.tax_rate;
            const gstAmount = amount * (gstRate / 100);
            const total = amount + gstAmount;

            invoiceTableHTML += `
                <tr>
                    <td>${row.cells[0].textContent}</td>
                    <td>${product}</td>
                    <td>${quantity}</td>
                    <td>${rate.toFixed(2)}</td>
                    <td>${amount.toFixed(2)}</td>
                    <td>${gstRate}%</td>
                    <td>${gstAmount.toFixed(2)}</td>
                    <td>${total.toFixed(2)}</td>
                </tr>
            `;

            totalAmount += total;

            // Update database with new quantities
            await fetch('/update-quantity', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ product, brand, quantity }),
            });
        }

        invoiceTableHTML += `
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="7" style="text-align: right;">Total</td>
                    <td>${totalAmount.toFixed(2)}</td>
                </tr>
            </tfoot>
        `;

        document.querySelector(".invoice-table").innerHTML = invoiceTableHTML;

        document.getElementById("invoiceName").textContent = customerName;
        document.getElementById("invoiceAddress").textContent = customerAddress;
        document.getElementById("invoiceMobile").textContent = customerMobile;
        document.getElementById("invoiceDate").textContent = invoiceDate;
        document.getElementById("invoiceNumber").textContent = invoiceNumber++;

        document.getElementById("rightPart").style.display = "block";
        document.getElementById("printButton").style.display = "block";
    }

    function printInvoice() {
        const printWindow = window.open('', '', 'height=600,width=800');
        const rightPartClone = document.getElementById("rightPart").cloneNode(true);
        const printButton = rightPartClone.querySelector("#printButton");
        if (printButton) {
            printButton.remove();
        }

        const printStylesheet = `
            <style>
                body { font-family: 'Dancing Script', cursive; }
                #rightPart { width: 100%; box-shadow: none; }
                @media print {
                    body * { visibility: hidden; }
                    #rightPart, #rightPart * { visibility: visible; }
                    body { margin: 0; }
                    #rightPart { width: 100%; box-shadow: none; }
                    #rightPart .invoice-header {
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 20px;
                        background-color: #404040;
                        padding: 10px;
                        border-radius: 4px;
                        box-shadow: 0 0 10px #007bff;
                    }
                    #rightPart .invoice-table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-bottom: 20px;
                    }
                    #rightPart .invoice-table th, #rightPart .invoice-table td {
                        border: 1px solid #007bff;
                        padding: 10px;
                        text-align: left;
                        background-color: #404040;
                        color: #e0e0e0;
                    }
                    #rightPart .invoice-table th {
                        background-color: #505050;
                    }
                }
            </style>
        `;

        printWindow.document.write(`
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <title>Invoice</title>
                ${printStylesheet}
            </head>
            <body>
                ${rightPartClone.outerHTML}
            </body>
            </html>
        `);

        printWindow.document.close();

        setTimeout(() => {
            printWindow.print();
            printWindow.close();
        }, 100);
    }

    document.getElementById("addProductBtn").addEventListener("click", addProductRow);
    document.getElementById("deleteProductBtn").addEventListener("click", deleteLastProductRow);
    document.getElementById("refreshBtn").addEventListener("click", refreshPage);
    document.getElementById("generateBillBtn").addEventListener("click", generateInvoice);
    document.getElementById("printButton").addEventListener("click", printInvoice);

    addProductRow();
});
