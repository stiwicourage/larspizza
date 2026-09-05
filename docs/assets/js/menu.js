const API_URL = 'https://api.larspizza.dk';
const locationSelect = document.querySelector('#location-select');
const menuList = document.querySelector('#menu-list');
const menuStatus = document.querySelector('#menu-status');
const orderForm = document.querySelector('#order-form');
const orderList = document.querySelector('#order-list');
const orderStatus = document.querySelector('#order-status');
const orderDate = document.querySelector('#order-date');
const selectedItems = new Map();
let currentLocation = '';
let currentMenu = [];

orderDate.min = new Date().toISOString().slice(0, 10);

function setStatus(message) {
    menuStatus.textContent = message;
}

async function submitOrder(event) {
    event.preventDefault();
    if (!currentLocation || selectedItems.size === 0) {
        orderStatus.textContent = 'Vælg lokation og mindst én pizza.';
        return;
    }
    const payload = {
        location: currentLocation,
        customer_name: new FormData(orderForm).get('customer_name'),
        order_date: new FormData(orderForm).get('order_date'),
        items: Array.from(selectedItems, ([menu_slug, item]) => ({
            menu_slug,
            recipients: item.recipients.map((name) => name.trim()),
        })),
    };
    orderStatus.textContent = 'Sender bestilling...';
    try {
        const data = await fetchJson('/orders.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload),
        });
        orderStatus.textContent = `Bestilling modtaget. Ordrenummer: ${data.order_id}`;
        selectedItems.clear();
        renderOrder();
    } catch (error) {
        orderStatus.textContent = 'Bestillingen kunne ikke gemmes lige nu.';
    }
}

function renderLocations(locations) {
    locationSelect.replaceChildren(
        new Option('Vælg lokation', ''),
        ...locations.map((location) => new Option(location.name, location.slug))
    );
}

function renderMenu(items) {
    currentMenu = items;
    menuList.replaceChildren(
        ...items.map((item) => {
            const article = document.createElement('article');
            article.className = 'menu-item';
            const heading = document.createElement('h3');
            heading.textContent = `${item.menu_number}. ${item.name}`;
            article.append(heading);
            if (item.description) {
                const description = document.createElement('p');
                description.textContent = item.description;
                article.append(description);
            }
            const addButton = document.createElement('button');
            addButton.type = 'button';
            addButton.textContent = 'Tilføj pizza';
            addButton.addEventListener('click', () => addPizza(item.slug));
            article.append(addButton);
            return article;
        })
    );
}

function addPizza(slug) {
    const item = selectedItems.get(slug) ?? { recipients: [] };
    item.recipients.push('');
    selectedItems.set(slug, item);
    renderOrder();
}

function removePizza(slug) {
    selectedItems.delete(slug);
    renderOrder();
}

function renderOrder() {
    orderList.replaceChildren(
        ...Array.from(selectedItems.entries()).map(([slug, item]) => {
            const menuItem = currentMenu.find((entry) => entry.slug === slug);
            const wrapper = document.createElement('fieldset');
            wrapper.className = 'order-item';
            const legend = document.createElement('legend');
            legend.textContent = menuItem.name;
            wrapper.append(legend);
            item.recipients.forEach((recipient, index) => {
                const input = document.createElement('input');
                input.required = true;
                input.placeholder = 'Modtagernavn';
                input.value = recipient;
                input.addEventListener('input', (event) => {
                    item.recipients[index] = event.target.value;
                });
                wrapper.append(input);
            });
            const removeButton = document.createElement('button');
            removeButton.type = 'button';
            removeButton.textContent = 'Fjern pizza';
            removeButton.addEventListener('click', () => removePizza(slug));
            wrapper.append(removeButton);
            return wrapper;
        })
    );
}

async function fetchJson(path, options = {}) {
    const response = await fetch(`${API_URL}${path}`, options);
    if (!response.ok) {
        throw new Error(`API request failed with status ${response.status}`);
    }
    return response.json();
}

async function loadLocations() {
    try {
        const data = await fetchJson('/locations.php');
        renderLocations(data.locations);
        setStatus('Vælg en lokation for at se menuen.');
    } catch (error) {
        locationSelect.replaceChildren(new Option('Lokationer kunne ikke hentes', ''));
        setStatus('Menuen kunne ikke hentes lige nu.');
    }
}

async function loadMenu(location) {
    if (!location) {
        menuList.replaceChildren();
        setStatus('Vælg en lokation for at se menuen.');
        return;
    }

    currentLocation = location;
    selectedItems.clear();
    renderOrder();
    setStatus('Henter menu...');
    try {
        const data = await fetchJson(`/menu.php?location=${encodeURIComponent(location)}`);
        renderMenu(data.menu);
        setStatus(`${data.menu.length} pizzaer tilgængelige.`);
    } catch (error) {
        menuList.replaceChildren();
        setStatus('Menuen kunne ikke hentes lige nu.');
    }
}

locationSelect.addEventListener('change', (event) => loadMenu(event.target.value));
orderForm.addEventListener('submit', submitOrder);
loadLocations();
