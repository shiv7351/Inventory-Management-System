document.getElementById('electricals').addEventListener('click', () => {
    fetchInventoryData('electricalsseries', ['Product_Name', 'Havells_Quantity', 'IndoAsian_Quantity'], 'Electricals');
});

document.getElementById('wires').addEventListener('click', () => {
    fetchInventoryData('wires', ['Size', 'Havells_Quantity', 'Polycab_Quantity'], 'Wires');
});

document.getElementById('electronics').addEventListener('click', () => {
    fetchInventoryData('total_quantity', ['Product', 'Category', 'Model', 'Brand', 'Quantity'], 'Electronics');
});

function createTableHTML(data, columns, tableName) {
    let html = '<table data-table="' + tableName + '">';
    html += '<thead><tr>';
    html += '<th>Sr No.</th>';
    columns.forEach(column => {
        html += `<th>${column}</th>`;
    });
    html += '</tr></thead><tbody>';

    data.rows.forEach((row, index) => {
        html += '<tr>';
        html += `<td>${index + 1}</td>`;
        row.forEach((cell, cellIndex) => {
            if (isEditableColumn(columns[cellIndex], tableName)) {
                html += `<td contenteditable="true" class="editable-cell">${cell}</td>`;
            } else {
                html += `<td>${cell}</td>`;
            }
        });
        html += '</tr>';
    });
    html += '</tbody></table>';
    return html;
}

function isEditableColumn(column, tableName) {
    const editableColumns = {
        'total_quantity': ['Quantity'],
        'electricalsseries': ['Havells_Quantity', 'IndoAsian_Quantity'],
        'wires': ['Havells_Quantity', 'Polycab_Quantity']
    };

    return editableColumns[tableName] && editableColumns[tableName].includes(column);
}

function fetchInventoryData(tableName, columns, displayName) {
    fetch(`/fetch-inventory-data`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ tableName, columns })
    })
    .then(response => response.json())
    .then(data => {
        const tableContainer = document.getElementById('table-container');
        const initialMessage = document.getElementById('initial-message');
        tableContainer.innerHTML = '';
        initialMessage.style.display = 'none';
        tableContainer.style.display = 'block';

        if (data.error) {
            tableContainer.innerHTML = `<p class="error-message">${data.error}</p>`;
        } else {
            tableContainer.innerHTML = `<h2>${displayName}</h2>${createTableHTML(data, columns)}`;
            document.getElementById('edit-button').style.display = 'block';
            document.getElementById('update-button').style.display = 'none';
        }
    })
    .catch(error => {
        console.error('Error fetching data:', error);
        document.getElementById('table-container').innerHTML = `<p class="error-message">An error occurred while fetching data.</p>`;
    });
}

function isEditableColumn(column) {
    const editableColumns = {
        'total_quantity': ['Quantity'],
        'electricalsseries': ['Havells_Quantity', 'IndoAsian_Quantity'],
        'wires': ['Havells_Quantity', 'Polycab_Quantity']
    };

    for (let key in editableColumns) {
        if (editableColumns[key].includes(column)) {
            return true;
        }
    }
    return false;
}

document.getElementById('edit-button').addEventListener('click', () => {
    document.querySelectorAll('.editable-cell').forEach(cell => {
        cell.setAttribute('contenteditable', 'true');
    });
    document.getElementById('edit-button').style.display = 'none';
    document.getElementById('update-button').style.display = 'block';
});

document.getElementById('update-button').addEventListener('click', () => {
    const tableContainer = document.getElementById('table-container');
    const table = tableContainer.querySelector('table');
    const rows = Array.from(table.querySelectorAll('tbody tr'));
    const columns = Array.from(table.querySelectorAll('th')).map(th => th.textContent);

    let tableName;
    if (columns.includes('Quantity')) {
        tableName = 'total_quantity';
    } else if (columns.includes('Havells_Quantity') && columns.includes('IndoAsian_Quantity')) {
        tableName = 'electricalsseries';
    } else if (columns.includes('Havells_Quantity') && columns.includes('Polycab_Quantity')) {
        tableName = 'wires';
    }

    const updatedData = rows.map(row => {
        const cells = Array.from(row.querySelectorAll('td')).map(td => td.textContent);
        return cells; // Return all cells for updating
    });

    fetch('/update-inventory-data', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ tableName, columns, rows: updatedData })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Data updated successfully.');
        } else {
            alert('Failed to update data.');
        }
    })
    .catch(error => {
        console.error('Error updating data:', error);
        alert('An error occurred while updating data.');
    });

    document.getElementById('update-button').style.display = 'none';
    document.getElementById('edit-button').style.display = 'block';
});
