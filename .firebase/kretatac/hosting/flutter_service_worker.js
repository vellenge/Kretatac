'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "748dc2cfc1ba0e47af153cddac589844",
"assets/AssetManifest.json": "d980010022c661ff7ef4c3e9c1383dc0",
"assets/assets/animations/arrow.riv": "339ed249196bfd272520f67e2968eb46",
"assets/assets/data/ideas.csv": "9b1123389b58991ff677955d3695f625",
"assets/assets/data/therapies.csv": "15c2e13f2434d32a0cac78f818b7f580",
"assets/assets/fonts/Roboto-Medium.ttf": "b2d307df606f23cb14e6483039e2b7fa",
"assets/assets/images/angry.svg": "2eafc4a8801cff2e51c8602c9bd20069",
"assets/assets/images/blouse.jpg": "7bd9429018371917dd98d84750acd96a",
"assets/assets/images/cabinet.jpg": "62b5335acf4b36ad77d6beda6532b2f4",
"assets/assets/images/clinic-doctor-image.png": "e4675e52d3c3bae7ccd69bf1a22fbace",
"assets/assets/images/cocktail.webp": "c8ad188481576d74cbbfc379ffa8b780",
"assets/assets/images/couteau.jpg": "04df24ac34f8520d65777a7e28710cf8",
"assets/assets/images/doubt.svg": "3c06f4883666837be5143db9fba757d9",
"assets/assets/images/entite.jpg": "4d9fc32d54bc1b173173ad28e7b5cc74",
"assets/assets/images/exotisme.jpg": "094ab33626edf38243a9cbc0d7545d14",
"assets/assets/images/happy.svg": "3bfeb53dfb9f86ee6e572cac1219dac4",
"assets/assets/images/icone_pointage_main.svg": "d0236b539917ae10e6ad2898d101ba34",
"assets/assets/images/influenceur.jpg": "586ce745436d60afea614015c1274629",
"assets/assets/images/jc.jpg": "2bd94e123674657764c21ee135ab2548",
"assets/assets/images/logo.svg": "e18b3c6f2d8f9cb3c0d6e2b4629bdfd4",
"assets/assets/images/mire.png": "a22585611a1342277d1ae1266bcbe566",
"assets/assets/images/mire.svg": "0fa198c59be5118ffeb5a16518c7f977",
"assets/assets/images/mire2.svg": "a7626994eb7624b033e19d48e97c13b9",
"assets/assets/images/nature.png": "6636a0e8e1c312cd3635de47b76ea901",
"assets/assets/images/nuit.jpg": "898e23bf50bc40dee5eca13da6915048",
"assets/assets/images/popularite.jpg": "7a0c867832c8fc944acff3358de6aadc",
"assets/assets/images/produit.jpg": "3da64a76604ca69c5fbbe553a5add7e9",
"assets/assets/images/sadness.svg": "feff3249967e47f0877c15ca1661d851",
"assets/assets/images/satisfied.svg": "bdaef98ec3e733695452f7ad52c22bd1",
"assets/assets/images/stages.webp": "0a3a261b38f6078efceea328a8f04ff2",
"assets/assets/images/star.svg": "54f3906ae095fec6416e5d02f40feeb9",
"assets/assets/images/surprise.svg": "cb64d1d651f497a4978687ca79d67f88",
"assets/assets/images/tech.jpg": "7b3c3e2fdd2a64faf9d0630249354a58",
"assets/assets/images/tradition.jpg": "1599ae7f31903942a4ffd9ed97f84526",
"assets/assets/images/wifi.jpg": "c38cbb7fc09008436b911ab67ba9b8a2",
"assets/FontManifest.json": "d384740bc2c947c3bf74017217853c74",
"assets/fonts/MaterialIcons-Regular.otf": "2888638d1947724011563a23e50da2ce",
"assets/NOTICES": "840b0aa82813dd08a5214b60c8b809c0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/favicon.ico": "0d36228f9bf3ba00b0131f73d0a7ae5e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "31aff2b83028560390f38f721bd99c35",
"/": "31aff2b83028560390f38f721bd99c35",
"main.dart.js": "23c4a7ec8fd867fe2c6a6de0bb3a2a56",
"manifest.json": "ea99071c259876944893c69090053e5c",
"version.json": "bc7932695cd2ae468fc1b48ca88c608c"};
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
