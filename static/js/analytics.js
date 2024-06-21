document.addEventListener('DOMContentLoaded', function() {
  const filterDropdown = document.getElementById('filter-dropdown');

  // Fetch categories and brands for the dropdown
  fetch('/get_filters')
      .then(response => response.json())
      .then(data => {
          // Add "ALL" option
          const allOption = document.createElement('option');
          allOption.value = 'ALL';
          allOption.textContent = 'ALL';
          filterDropdown.appendChild(allOption);

          // Add "Category" option
          const categoryOption = document.createElement('option');
          categoryOption.value = 'Category';
          categoryOption.textContent = 'Category';
          filterDropdown.appendChild(categoryOption);

          data.categories.forEach(category => {
              const option = document.createElement('option');
              option.value = category;
              option.textContent = category;
              filterDropdown.appendChild(option);
          });
          data.brands.forEach(brand => {
              const option = document.createElement('option');
              option.value = brand;
              option.textContent = brand;
              filterDropdown.appendChild(option);
          });
      })
      .catch(error => console.error('Error fetching filters:', error));

  filterDropdown.addEventListener('change', function() {
      fetchAnalyticsData(this.value);
  });

  fetchAnalyticsData('ALL');
});

let pieChartInstance;
let barChartInstance;
let categoriesList = [];

function fetchAnalyticsData(filter) {
  fetch(`/get_analytics_data?filter=${filter}`)
      .then(response => response.json())
      .then(data => {
          document.getElementById('total-profit').textContent = data.totalProfit;
          document.getElementById('total-sales').textContent = data.totalSales;
          document.getElementById('total-revenue').textContent = data.totalRevenue;
          document.getElementById('star-performer').textContent = data.starPerformer;

          categoriesList = data.categories;

          const pieChartCanvas = document.getElementById('pie-chart').getContext('2d');
          const barChartCanvas = document.getElementById('bar-chart').getContext('2d');

          if (pieChartInstance) {
              pieChartInstance.destroy();
          }

          const pieChartData = {
              labels: ['Total Profit', 'Total Revenue'],
              datasets: [{
                  data: [data.totalProfit, data.totalRevenue],
                  backgroundColor: ['#3498db', '#2ecc71'],
              }]
          };

          pieChartInstance = new Chart(pieChartCanvas, {
              type: 'pie',
              data: pieChartData,
              options: {
                  responsive: true,
                  plugins: {
                      legend: {
                          position: 'top',
                      },
                      tooltip: {
                          enabled: true
                      }
                  }
              }
          });

          if (barChartInstance) {
              barChartInstance.destroy();
          }

          let barChartData;
          if (filter === 'ALL') {
              barChartData = {
                  labels: Object.keys(data.brandProfitData),
                  datasets: [{
                      label: 'Brand Profit',
                      data: Object.values(data.brandProfitData),
                      backgroundColor: '#3498db',
                  }]
              };
          } else if (filter === 'Category') {
              barChartData = {
                  labels: Object.keys(data.brandProfitData),
                  datasets: [{
                      label: 'Category Profit',
                      data: Object.values(data.brandProfitData),
                      backgroundColor: '#3498db',
                  }]
              };
          } else if (categoriesList.includes(filter)) {
              barChartData = {
                  labels: Object.keys(data.brandProfitData),
                  datasets: [{
                      label: 'Brand Profit',
                      data: Object.values(data.brandProfitData),
                      backgroundColor: '#3498db',
                  }]
              };
          } else {
              barChartData = {
                  labels: Object.keys(data.brandProfitData),
                  datasets: [{
                      label: 'Product Profit',
                      data: Object.values(data.brandProfitData),
                      backgroundColor: '#3498db',
                  }]
              };
          }

          barChartInstance = new Chart(barChartCanvas, {
              type: 'bar',
              data: barChartData,
              options: {
                  responsive: true,
                  scales: {
                      y: {
                          beginAtZero: true
                      }
                  }
              }
          });
      })
      .catch(error => {
          console.error('Error fetching data:', error);
          document.getElementById('total-profit').textContent = 'Error';
          document.getElementById('total-sales').textContent = 'Error';
          document.getElementById('total-revenue').textContent = 'Error';
          document.getElementById('star-performer').textContent = 'Error';
      });
}
