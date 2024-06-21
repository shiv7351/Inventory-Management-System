const agencyButtons = document.querySelectorAll('.agency-button');
const rightSection = document.getElementById('right');

// Initial content on page load
rightSection.innerHTML = `<h1>Welcome To Finance Management Page</h1>`;

agencyButtons.forEach(button => {
  button.addEventListener('click', async () => {
    const agencyName = button.id.replace('-', '_');
    await fetchDataAndDisplayTable(agencyName);
  });
});

async function fetchDataAndDisplayTable(agencyName) {
  try {
    const response = await fetch(`/get_data?agency=${agencyName}`);

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Clear previous content
    rightSection.innerHTML = '';

    // Display table name
    const tableName = `<i><b>${agencyName.replace('_', ' ')}</b></i>`;
    rightSection.innerHTML += `<h2>${tableName}</h2>`;

    // Create and populate the table
    const table = createTable(data);
    rightSection.appendChild(table);
  } catch (error) {
    console.error('Error fetching data:', error);
    rightSection.innerHTML = `<p>Error fetching data. Please try again later.</p>`;
  }
}

function createTable(data) {
  const table = document.createElement('table');
  
  // Create table headers based on data keys
  const headerRow = table.insertRow();
  const srNoHeader = document.createElement('th');
  srNoHeader.textContent = 'Sr No.';
  headerRow.appendChild(srNoHeader);

  for (const key in data[0]) {
    const headerCell = document.createElement('th');
    headerCell.textContent = key.replace(/_/g, ' '); // Replace underscores with spaces
    headerRow.appendChild(headerCell);
  }

  // Create table rows and cells
  data.forEach((row, index) => {
    const dataRow = table.insertRow();
    const srNoCell = dataRow.insertCell();
    srNoCell.textContent = index + 1;

    for (const key in row) {
      const cell = dataRow.insertCell();
      cell.textContent = row[key];
    }
  });

  return table;
}
