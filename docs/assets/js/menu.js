const API_URL = 'https://api.larspizza.dk';
const locationSelect = document.querySelector('#location-select');
const menuList = document.querySelector('#menu-list');
const menuStatus = document.querySelector('#menu-status');

function setStatus(message) {
    menuStatus.textContent = message;
}

function renderLocations(locations) {
    locationSelect.replaceChildren(
        new Option('Vælg lokation', ''),
        ...locations.map((location) => new Option(location.name, location.slug))
    );
}

function renderMenu(items) {
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
            return article;
        })
    );
}

async function fetchJson(path) {
    const response = await fetch(`${API_URL}${path}`);
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
loadLocations();
