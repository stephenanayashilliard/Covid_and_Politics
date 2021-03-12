

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
console.log("This is value index: " + valueIndex);
    d3.json("covid.json").then((data) => {
        var sampleNames = data.county_state[valueIndex];
        var samplePop =  data.totalpop[valueIndex]; 
        var sampleIncome = data.income[valueIndex]; 
        var sampleCommute = data.meancommute[valueIndex];
        var sampleCases = data.cases_per_capita_100k[valueIndex]; 
        var sampleDeaths = data.deaths[valueIndex];
    
     
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
      PANEL.append("h6").text(`Covid Deaths: ${sampleDeaths}`);
      // Use `Object.entries` to add each key and value pair to the panel
      // Hint: Inside the loop, you will need to use d3 to append new
      // tags for each key-value in the metadata.
      // Object.entries(result).forEach(([key, value]) => {
      //  PANEL.append("h6").text(`${key.toUpperCase()}: ${value}`);
    // });
  
    });
  }

  // Creating the charts
  function buildCharts(valueIndex) {
    // Load and retrieve samples
    d3.json("covid.json").then((data) => {
      console.log(data)
      // Variables for voting
        var samplePop =  data.totalpop[valueIndex];
        var sampleVote = data.total_votes20[valueIndex];
        var Republican = data.votes20_donald_trump[valueIndex];
        var Democrat = data.votes20_joe_biden[valueIndex];
        var sampleRepublicanPer = data.percentage20_donald_trump[valueIndex];
        var sampleDemocraticPer = data.percentage20_joe_biden[valueIndex];
      // Variables for Race 
        var sampleNames = data.county_state[valueIndex];
        var hispanic =  data.hispanic [valueIndex]; 
        var caucasion  = data.white[valueIndex]; 
        var africanAmerican = data.black[valueIndex]; 
        var nativeAmerican = data.native[valueIndex];
        var asianAmerican = data.asian[valueIndex];
        var pacificIslander = data.pacific[valueIndex];
      // Variables for Economics
        var samplePoverty =  data.poverty[valueIndex]; 
       // var sampleEmployment = data.employed[valueIndex]; 
        var sampleUnemployed = data.unemployment[valueIndex]; 
        var sampleProfessional = data.professional[valueIndex];
        var sampleService = data.service[valueIndex];
        var sampleOffice = data.office[valueIndex];
        var sampleConstruction = data.construction[valueIndex];
        var sampleProduction = data.production[valueIndex];
        var samplePrivate = data.privatework[valueIndex];
        var samplePublic = data.publicwork[valueIndex];
        var sampleSelf = data.selfemployed[valueIndex];
        var sampleFamily = data.familywork[valueIndex];
      // Variables for Transportion
        var sampleDrive =  data.drive[valueIndex]; 
        var sampleCarpool = data.carpool[valueIndex]; 
        var sampleTransit = data.transit[valueIndex]; 
        var sampleWalk = data.walk[valueIndex];
        var sampleOthertransp = data.othertransp[valueIndex];
        var sampleWorkathome = data.workathome[valueIndex];
      // Variables for Age
        var sampleBaby = data.age_oto4[valueIndex];
        var sampleToddler = data.age_5to14[valueIndex];
        var sampleTeen = data.age_15to24[valueIndex]; 
        var sampleYoung = data.age_25to34[valueIndex]
        var sampleThirty = data.age_35to44[valueIndex];
        var sampleForty = data.age_45to54[valueIndex];
        var sampleFifty = data.age_55to64[valueIndex];
        var sampleSixty = data.age_65to74[valueIndex];
        var sampleSevenity = data.age_75to84[valueIndex];
        var sampleSenior = data.age_84plus[valueIndex];
   
      // Age Bubble Graph
        var bubbleData = [
          {
            x: ['Infant', 'Child', 'Teen', 'Young Adult', 'Mid Thirties to Forties', 'Mid Forties to Fifties', 'Mid Sixties to Seventies', 'Mid Seventies to Eighties', 'Eighties Plus'],
            y: [sampleBaby, sampleToddler, sampleTeen, sampleYoung, sampleThirty, sampleForty, sampleFifty, sampleSixty, sampleSevenity, sampleSenior],
            text: ['Infant </br>Age range: 0 - 4', 'Child </br>Age range: 5 - 14', 'Teen </br>Age range: 15 - 24','Young Adult </br>Age range: 25 - 34', 'Mid Thirties to Forties </br>Age range: 35 - 44',
                  'Mid Forties to Fifties </br>Age range: 45 - 54', 'Mid Fifties to Sixties </br>Age range: 55 - 64', 'Mid Sixties to Seventies </br>Age range: 65 - 74', 'Mid Seventies to Eighties </br>Age range: 75 - 84',
                  '84 Plus </br>Age range: 84 Plus'],
            mode: 'markers',
            marker: {
            size:[sampleBaby, sampleToddler, sampleTeen, sampleYoung, sampleThirty, sampleForty, sampleFifty, sampleSixty, sampleSevenity, sampleSenior].map(x=> x/100),
            colors: ['rgb(0, 255, 255)', 'rgb(138, 43, 226)',  'rgb(44, 160, 101)', 'rgb(255, 65, 54)']
          }
        }
      ];   
      
      //Create the layout for the bubble chart.
        var bubbleLayout = {
        title: "<b>Age Demographics for the County</b>",
        showlegend: false,
        xaxis: {title: "Age Groups,"}
      };
      
      // Use Plotly to plot the data with the layout.
        Plotly.newPlot("bubble", bubbleData, bubbleLayout,);

      // Voting Bar Graph
      var barData = [
        { 
          x: sampleVote,
          y: [Republican, Democrat],
          text: ['Republican', 'Democrat'],
          name: 'Votes by Population',
          type: "bar",
          marker: {
            color: ['rgb(158,202,225)', 'rgb(8,48,107)']
          },
         // orientation: "v"
        }
      ];
      
      //Create the layout for the bar chart. 
      var barLayout = {
        title: "<b>How the County Voted",
        xaxis: {title: ('Votes by Party')},
        yaxis: {title: 'Number of Total Votes'},
        // margin: {
        //   l:100,
        //   r:100,
        //   t:100,
        //   b:100,
        // }
      };

      // Plotly for bar graph
      Plotly.newPlot("bar", barData, barLayout)

      //Create layour for Race Pie Chart
      var pieData = [{
        values: [hispanic, caucasion, africanAmerican, nativeAmerican, asianAmerican, pacificIslander],
        labels: ['Hispanic', 'Caucasion', 'African American', 'Native American', 'Asian American', 'Pacific Islander'],
        type: 'pie',
      }];

      var pieLayout = {
      title: "<b>Racial Demographics for the County",
      // height: 400,
      // width: 500
      };

      // Plotly for pie Graph
      Plotly.newPlot("pie", pieData, pieLayout);
      
      
 
      
  });
    
}        

