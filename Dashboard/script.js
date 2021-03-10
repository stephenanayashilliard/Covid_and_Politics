function init() {
    //Grab a reference to teh dropdown select element
    var selector = d3.select("selDataset");

// Use the list of sample names to populate the select options
d3.json("covid.json").then((data) => {
    console.log(data);
    var sampleNames = data.county_state;

    sampleNames.forEach((sample) => {
      selector
        .append("option")
        .text(sample)
        .property("value", sample);
  });
})}

init();

