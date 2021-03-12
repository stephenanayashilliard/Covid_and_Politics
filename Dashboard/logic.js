
// Add console.log to check to see if our code is working.
console.log("working");

// Create the map object with a center and zoom level.
let map = L.map('mapid') //setView([40.7, -94.5], 4);

// // initialize the map on the "map" div with a given center and zoom
// var map = L.map('mapid', {
//     center: [51.505, -0.09],
//     zoom: 13
// });

// Add Tile Layer for the Map
let streets = L.tileLayer('https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token={accessToken}', {
attribution: 'Map data © <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery (c) <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    accessToken: API_key
});

// Then we add our 'graymap' tile layer to the map.
streets.addTo(map);

