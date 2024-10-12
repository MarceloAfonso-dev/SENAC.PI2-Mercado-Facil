function mostrarAlertaErro() {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('error') === 'true') {
        alert('Login ou senha incorretos! Tente novamente.');
    }
}