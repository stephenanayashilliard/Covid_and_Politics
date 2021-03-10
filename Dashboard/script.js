

// Use the list of sample names to populate the select options
function init() {
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

