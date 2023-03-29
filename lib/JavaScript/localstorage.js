  window.addEventListener('load', function(ev) {
      // Download main.dart.js
      _flutter.loader.loadEntrypoint({
        serviceWorker: {
          serviceWorkerVersion: serviceWorkerVersion,
        },
        onEntrypointLoaded: function(engineInitializer) {
          engineInitializer.initializeEngine().then(function(appRunner) {
            appRunner.runApp();
          });
        }
      });
    });

    user = {
      nom:"soro",
      prenom:"noura",
      email:"soro.noura@gmail.com"
    }

    localStorage.setItem('admin', JSON.stringify(user))

    let recup = JSON.parse(localStorage.getItem('admin'))
    console.log("Les data ",recup)