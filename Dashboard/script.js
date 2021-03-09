

// Use the list of sample names to populate the select options
d3.json("covid.json").then((data) => {
    var sampleNames = data.county_state;

    sampleNames.forEach((sample) => {
      selector
        .append("option")
        .text(sample)
        .property("value", sample);
  });

})