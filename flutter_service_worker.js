'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "f6e28073fe6950bc34f64513df0848f5",
"assets/AssetManifest.json": "f3852936b6a5c4885441d62fc170ddeb",
"assets/assets/icons/add-user.png": "be74bd2a9998ce7cd90c15f6668f80a6",
"assets/assets/icons/avatarEmplo.png": "aefe8d63a2dca08385a937339b90c693",
"assets/assets/icons/bilan.png": "f98cffe30dd9859d5ff9b1a21bfb81f7",
"assets/assets/icons/bouton-notifications.png": "2a5f3ecf48a963297990e8f666e760f7",
"assets/assets/icons/checkbox.png": "b4c9b25ef75292afe5a37da5d98e57ec",
"assets/assets/icons/checkOkay.png": "8e976004089ac6cae4d8678599196486",
"assets/assets/icons/close.png": "e00c11b6ae86a02a8823ee09aed11413",
"assets/assets/icons/dash.png": "d00b966165df7e1ad66d7e2d8afc0dab",
"assets/assets/icons/deleteUser.png": "d935205794ccf6ec73345c0a134730df",
"assets/assets/icons/editer.png": "745eb7e8ae2578f429be914be3470b8e",
"assets/assets/icons/eyesclose.png": "e2b38a8d1305c15c4be0bae9fa4c21f4",
"assets/assets/icons/eyesopen.png": "29694c9c3d42dab2b290cf08c7a316a9",
"assets/assets/icons/gestion.png": "053fea4c5e1d857894cc3dff891e7bf8",
"assets/assets/icons/head.png": "8e5e0d0f61b2652b2b9e88164624a687",
"assets/assets/icons/home.png": "5b0fcf9182e6935e156bb09beccda04c",
"assets/assets/icons/lock.png": "b515005cfc832b0f68207e4fbf7c6d7e",
"assets/assets/icons/logout.png": "47715f08d70299f672dfc30ec3638b0c",
"assets/assets/icons/payement.png": "9cf6ce6d200e4f6d664530107e762d06",
"assets/assets/icons/plus.png": "47a5d045c6efeb74f54da3fa09d0d7a0",
"assets/assets/icons/search.png": "b261d677503a2553bcf4a1290a08c8bd",
"assets/assets/icons/settings.png": "d0e4baf1285b18b1363836ca7f103524",
"assets/assets/icons/settingWritte.png": "c3ae8e0fb546e417e06a215c7f16fc2e",
"assets/assets/icons/supprimer.png": "8148238776a52a226a331536471d7d0f",
"assets/assets/images/cultureItem.jpg": "f61c3fb44902df93512eb24ce5eb7a12",
"assets/assets/images/logo.png": "11115812ffa3d908bdadc1f113d8fc93",
"assets/assets/images/riz.jpg": "30627cfbd7981cba14e162af2b904c0c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "5d27639d4c9bd7ee8959f4f92b416227",
"assets/NOTICES": "b583e6d6826118fc3be2887012802e72",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "57f2f020e63be0dd85efafc7b7b25d80",
"canvaskit/canvaskit.js": "3e7c7e90ff8e206f4023c12e31b0d058",
"canvaskit/canvaskit.wasm": "296ba26fdb37b50c239d4ead66144d01",
"canvaskit/chromium/canvaskit.js": "c5ff0f8767a7ea0962b15d1f1832002d",
"canvaskit/chromium/canvaskit.wasm": "c6b1144d5baffbdd9482ee820dbd7dc9",
"canvaskit/skwasm.js": "3dbd05be6db4a4154ce733ff194dcae7",
"canvaskit/skwasm.wasm": "f767200511478d7f7052f2b536d82875",
"canvaskit/skwasm.worker.js": "23be0fdafa5ddef67734292a576f8fe3",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ce2e376d71fbaf4b47ad720b84ae9068",
"/": "ce2e376d71fbaf4b47ad720b84ae9068",
"main.dart.js": "e5a384d7d4db8d9c5193b1da4f9c82b5",
"manifest.json": "a50feffda07ff8d24ad48ecef26afc32",
"version.json": "91f58d174b10aeecc5a5d5b4eec8c57f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
