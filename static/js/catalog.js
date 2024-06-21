// script.js file
document.addEventListener('DOMContentLoaded', () => {
    const allProductsBtn = document.querySelector('.all-products');
    const productTree = document.getElementById('product-tree');
    const imageContainer = document.getElementById('image-container');
    const welcomeTitle = document.querySelector('.welcome-title');
    const modal = document.getElementById('image-modal');
    const modalImg = document.getElementById('modal-img');
    const modalClose = document.getElementById('modal-close');
    const modalLeft = document.getElementById('modal-left');
    const modalRight = document.getElementById('modal-right');

    document.querySelector('.all-products').addEventListener('dblclick', toggleDropdown);

    let currentImages = [];
    let currentIndex = 0;

    allProductsBtn.addEventListener('click', () => {
        imageContainer.innerHTML = '';
        welcomeTitle.style.display = 'none';
        displayAllProducts();
    });

    function toggleDropdown() {
        const tree = document.getElementById('product-tree');
        tree.style.display = tree.style.display === 'none' ? 'block' : 'none';
    }

    productTree.addEventListener('click', (event) => {
        if (event.target.tagName === 'LI') {
            const category = event.target.textContent;
            imageContainer.innerHTML = '';
            welcomeTitle.style.display = 'block';
            welcomeTitle.textContent = category;
            welcomeTitle.className = 'title';
            displayProducts(category);
        }
    });

    function displayAllProducts() {
        const categories = ['AC', 'Cooler', 'Fan', 'Induction', 'LED_TV', 'Microwave', 'Mixer_Juicer', 'Refrigerator', 'Stabilizer', 'Washing_Machine'];
        categories.forEach(category => {
            fetchImages(category, true);
        });
    }

    function displayProducts(category) {
        fetchImages(category, false);
    }

    function fetchImages(category, append) {
        fetch(`/static/images/Pictures_All_Products/${category}/images.json`)
            .then(response => response.json())
            .then(imageList => {
                if (!append) imageContainer.innerHTML = '';
                imageList.forEach(image => {
                    const imageUrl = `/static/images/Pictures_All_Products/${category}/${image}`;
                    const imageElement = new Image();
                    imageElement.src = imageUrl;
                    imageElement.classList.add('image-box');
                    const flexbox = document.createElement('div');
                    flexbox.classList.add('flexbox');
                    flexbox.appendChild(imageElement);
                    imageContainer.appendChild(flexbox);
                    imageElement.addEventListener('click', () => openModal(imageUrl));
                    if (append) currentImages.push(imageUrl);
                });
            })
            .catch(error => console.error('Error fetching images:', error));
    }

    function openModal(imageUrl) {
        modal.style.display = 'block';
        modalImg.src = imageUrl;
        currentIndex = currentImages.indexOf(imageUrl);
    }

    modalClose.addEventListener('click', () => {
        modal.style.display = 'none';
    });

    modalLeft.addEventListener('click', () => {
        currentIndex = (currentIndex - 1 + currentImages.length) % currentImages.length;
        modalImg.src = currentImages[currentIndex];
    });

    modalRight.addEventListener('click', () => {
        currentIndex = (currentIndex + 1) % currentImages.length;
        modalImg.src = currentImages[currentIndex];
    });

    window.addEventListener('click', (event) => {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });
});
