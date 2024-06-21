// Product Management Functionality
const rightPart = document.querySelector('.right-part');
const tableContainer = document.querySelector('.table-container');
const welcomeMessage = document.querySelector('.welcome-message');

document.querySelectorAll('.left-part .flexbox').forEach(item => {
    item.addEventListener('click', () => {
        const action = item.getAttribute('data-action');
        fetchTableData(action);
    });
});

document.querySelectorAll('.electronics-dropdown .dropdown-content .flexbox').forEach(item => {
    item.addEventListener('click', () => {
        const action = item.getAttribute('data-action');
        fetchTableData(action);
    });
});

function fetchTableData(tableName) {
    fetch(`/fetch-data/${tableName}`, {
        method: 'POST',
    })
    .then(response => response.json())
    .then(data => {
        tableContainer.innerHTML = ''; 
        welcomeMessage.style.display = 'none'; 

        if (data.error) {
            tableContainer.innerHTML = `<p class="error-message">${data.error}</p>`;
        } else {
            if (data.all_tables) {
                data.all_tables.forEach(table => {
                    tableContainer.innerHTML += `<h2><i>${table.table_name}</i></h2>${createTableHTML(table)}`;
                });
            } else {
                tableContainer.innerHTML = `<h2><i>${data.table_name}</i></h2>${createTableHTML(data)}`;
            }
        }
    })
    .catch(error => {
        console.error('Error fetching data:', error);
        tableContainer.innerHTML = `<p class="error-message">An error occurred while fetching data.</p>`;
    });
}

function createTableHTML(data) {
    let html = '<table>';
    html += '<thead><tr>';
    data.columns.forEach(column => {
        html += `<th>${column}</th>`;
    });
    html += '</tr></thead><tbody>';

    data.rows.forEach(row => {
        html += '<tr>';
        row.forEach(cell => {
            html += `<td>${cell}</td>`;
        });
        html += '</tr>';
    });
    html += '</tbody></table>';
    return html;
}
