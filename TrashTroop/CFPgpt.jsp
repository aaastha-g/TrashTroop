<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Carbon Footprint Calculator</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    #background-video {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
      z-index: -1;
    }

    .container {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.7); /* Add some opacity to make the form readable */
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      position: relative; /* Add position relative to contain z-index */
      z-index: 1; /* Ensure form elements are above the video */
    }

    /* h1 {
      text-align: center;
      margin-bottom: 20px;
      color: #ffffff;
      font-size: 36px;
      text-shadow: 2px 2px 4px #000000;
    } */

    h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    .input-group {
      margin-bottom: 20px;
      /* opacity: ; */
    }

    label {
      display: block;
      margin-bottom: 5px;
      color: #333;
    }

    input, select {
      width: 100%;
      padding: 8px;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    button {
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      cursor: pointer;
      border-radius: 4px;
    }

    #result {
      margin-top: 20px;
      font-weight: bold;
      color: #333;
    }

    .video-container {
      max-width: 800px;
      padding-top: 2%;
      margin: 0 auto 20px;
      border-radius: 10px;
      overflow: hidden;
    }

    .video-container iframe {
      width: 100%;
      height: 400px;
      /* height: auto; */
      border: none;
      border-radius: 10px;
    }
    h1 {
    padding-top: 0%;
    text-align: center;
    margin-bottom: 20px;
    font-size: 70px;
    font-weight: 600;
    color: #ffffff;
    text-shadow: 0px 0px 5px #93d3a5, 0px 0px 10px #b393d3, 0px 0px 10px #b393d3,
      0px 0px 20px #93d3a5;
}
  </style>
</head>
<body>
  <!-- Background Video -->
  <video id="background-video" autoplay muted loop>
    <source src="smokeman.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>

  <h1>What is Carbon Footprint?</h1>

  <!-- IFrame Video -->
  <div class="video-container">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/8q7_aV8eLUE?si=Ny5cOtrXBni4QgS8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
  </div>

  <div class="container">
    <h2>Carbon Footprint Calculator</h2>
    <div class="input-group">
      <label for="electricBill">Monthly Electric Bill:</label>
      <input type="number" id="electricBill" placeholder="Enter amount">
    </div>
    <div class="input-group">
      <label for="gasBill">Monthly Gas Bill:</label>
      <input type="number" id="gasBill" placeholder="Enter amount">
    </div>
    <div class="input-group">
      <label for="oilBill">Monthly Oil Bill:</label>
      <input type="number" id="oilBill" placeholder="Enter amount">
    </div>
    <div class="input-group">
      <label for="carMileage">Total Yearly Mileage on Car:</label>
      <input type="number" id="carMileage" placeholder="Enter mileage">
    </div>
    <div class="input-group">
      <label for="flightsShort">Number of Flights (<4 hours):</label>
      <input type="number" id="flightsShort" placeholder="Enter number">
    </div>
    <div class="input-group">
      <label for="flightsLong">Number of Flights (≥4 hours):</label>
      <input type="number" id="flightsLong" placeholder="Enter number">
    </div>
    <div class="input-group">
      <label for="recycleNewspaper">Do you recycle newspaper?</label>
      <select id="recycleNewspaper">
        <option value="yes">Yes</option>
        <option value="no">No</option>
      </select>
    </div>
    <div class="input-group">
      <label for="recycleAluminum">Do you recycle aluminum and tin?</label>
      <select id="recycleAluminum">
        <option value="yes">Yes</option>
        <option value="no">No</option>
      </select>
    </div>
    <button onclick="calculateCarbonFootprint()">Calculate</button>
    <div id="result"></div>
  </div>

  <script>
    function calculateCarbonFootprint() {
      var electricBill = parseFloat(document.getElementById('electricBill').value);
      var gasBill = parseFloat(document.getElementById('gasBill').value);
      var oilBill = parseFloat(document.getElementById('oilBill').value);
      var carMileage = parseFloat(document.getElementById('carMileage').value);
      var flightsShort = parseInt(document.getElementById('flightsShort').value);
      var flightsLong = parseInt(document.getElementById('flightsLong').value);
      var recycleNewspaper = document.getElementById('recycleNewspaper').value;
      var recycleAluminum = document.getElementById('recycleAluminum').value;

      var carbonFootprint = (electricBill * 105) +
                            (gasBill * 105) +
                            (oilBill * 113) +
                            (carMileage * 0.79) +
                            (flightsShort * 1100) +
                            (flightsLong * 4400);

      if (recycleNewspaper === 'no') {
        carbonFootprint += 184;
      }

      if (recycleAluminum === 'no') {
        carbonFootprint += 166;
      }

      document.getElementById('result').innerHTML = "Your total carbon footprint is: " + carbonFootprint.toFixed(2) + " units";
    }
  </script>
</body>
</html>
