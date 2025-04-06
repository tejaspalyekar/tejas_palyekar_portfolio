'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "9141c07465a8cf9cd77d2834408a7c52",
"assets/AssetManifest.bin.json": "5a3cc3ebe0bc80cf5b94f244fa6f22a0",
"assets/AssetManifest.json": "a5103d95c98b1fccddc0f34a510b9a23",
"assets/assets/icons/github_icon.png": "f5a8d80a3790ee918d6fc736b6087121",
"assets/assets/icons/gmail_icon.png": "d99a2f2f871e00fe074f0772e2224de7",
"assets/assets/icons/instagram_icon.png": "2502d99d8ce6600f977dafcb58fde06c",
"assets/assets/icons/linkdine_icon.png": "5110108ca4aac6e097f3946c7c1050bf",
"assets/assets/icons/whatsAppIcon.png": "ad660e7d4f6d672d32e9b057c3f44a2f",
"assets/assets/images/profile_image.jpeg": "699421e0c4fc1f5e62189bf7582a2271",
"assets/assets/lottie/light_scroll_down_lottie.json": "966c85cafd804a8968005db3fc7f3898",
"assets/assets/lottie/scroll_down_lottie.json": "cc17f5dfa3d1574c5dd8a95f5bc75592",
"assets/assets%255Cicons%255Cgithub_icon.png": "f5a8d80a3790ee918d6fc736b6087121",
"assets/assets%255Cicons%255Cgmail_icon.png": "d99a2f2f871e00fe074f0772e2224de7",
"assets/assets%255Cicons%255Cinstagram_icon.png": "2502d99d8ce6600f977dafcb58fde06c",
"assets/assets%255Cicons%255Clinkdine_icon.png": "5110108ca4aac6e097f3946c7c1050bf",
"assets/assets%255Cicons%255CwhatsAppIcon.png": "ad660e7d4f6d672d32e9b057c3f44a2f",
"assets/assets%255Cimages%255Cprofile_image.jpeg": "699421e0c4fc1f5e62189bf7582a2271",
"assets/assets%255Clottie%255Clight_scroll_down_lottie.json": "966c85cafd804a8968005db3fc7f3898",
"assets/assets%255Clottie%255Cscroll_down_lottie.json": "cc17f5dfa3d1574c5dd8a95f5bc75592",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "bb6a5e0958f4cdfe272394254154829e",
"assets/NOTICES": "6eee616cde30d6923478f5cb0cf55b34",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "9bb2aaa0f9a9213b623947fa682efa76",
"canvaskit/canvaskit.js": "4d65242fccdb38953e45f906580087a5",
"canvaskit/canvaskit.js.symbols": "68b4c27088ca664bd398c84602f6de11",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "9fc614fc55d9c852d4cb69570e9eb2fa",
"canvaskit/chromium/canvaskit.js.symbols": "6d72c539b91c938625180cd26d5af7c7",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "01111146932af09cee166932d1a83d3c",
"canvaskit/skwasm.js.symbols": "ae71f1f1dabb12c89961a6be7d646b79",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "e35e7fbec8f04f340add4f6ace89a29c",
"favicon.png": "1aab2b4539c298bfee767b6b5424a45f",
"flutter.js": "5bc83814f3f68c3e5f8f6b6bdeab1f50",
"flutter_bootstrap.js": "d41e23eb99c1011092e07daa2270c320",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "81cfbd588f48d2468e1117ab211fbdb1",
"/": "81cfbd588f48d2468e1117ab211fbdb1",
"main.dart.js": "71478f10b345c93424edd4c7b691e431",
"manifest.json": "e3025b54bea5f62ff1c591f2e0404ff6",
"version.json": "6f1e88c1f4b42ac2250cf3f3ec25cb71"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
