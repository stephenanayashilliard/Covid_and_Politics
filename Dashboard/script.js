

// Drop down Menu

function init() {
    //Grab a reference to the dropdown select element
    var selector = d3.select("#selDataset");

// Use the list of sample names to populate the select options
d3.json("covid.json").then((data) => {
    console.log(data);
    var sampleNames = data.county_state;
    


    Object.values(sampleNames).forEach((sample) => {
      selector
        .append("option")
        .text(sample)
        .property("value", sample);
        
  });
})}

init();

// Demographics Panel 
function buildMetadata(valueIndex) {

    d3.json("covid.json").then((data) => {
        var sampleNames = data.county_state[valueIndex];
        var samplePop =  data.totalpop[valueIndex]; 
        var sampleIncome = data.income[valueIndex]; 
        var sampleCases = data.cases_per_capita_100k[valueIndex]; 
        var sampleDeaths = data.deaths_per_capita_100k[valueIndex]
    
     
      // Filter the data for the object with the desired sample number
      // var resultArray = metadata.filter(sampleObj => sampleObj.id == sample);
      // var result = resultArray[0];
      // Use d3 to select the panel with id of `#sample-metadata`
      var PANEL = d3.select("#sample-metadata");
  
      // Use `.html("") to clear any existing metadata
      PANEL.html("");
      PANEL.append("h6").text(`County, State: ${sampleNames}`);
      PANEL.append("h6").text(`Population: ${samplePop}`);
      PANEL.append("h6").text(`Average Income: ${sampleIncome}`);
      PANEL.append("h6").text(`Covid Cases Per 100k: ${sampleCases}`);
      PANEL.append("h6").text(`Covid Deaths Per 100k: ${sampleDeaths}`);
      // Use `Object.entries` to add each key and value pair to the panel
      // Hint: Inside the loop, you will need to use d3 to append new
      // tags for each key-value in the metadata.
      // Object.entries(result).forEach(([key, value]) => {
      //  PANEL.append("h6").text(`${key.toUpperCase()}: ${value}`);
    // });
  
    });
  }