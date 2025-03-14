document.addEventListener("DOMContentLoaded", function () {
  var socket = io.connect("http://" + document.domain + ":" + location.port);
  socket.on("entry_notification", function (data) {
    var notification = document.getElementById("notification");
    notification.innerHTML = data.message;
    notification.style.display = "block";
    setTimeout(function () {
      notification.style.display = "none";
    }, 5000);
  });
});

function enterAsVisitor() {
  alert("Visitor entry option selected. Implement visitor logging here.");
}

function registerUser() {
  alert("Registration option selected. Redirect to registration form here.");
}

socket.on("employee_recognized", function (data) {
  console.log("Employee Recognized:", data.name);

  // Hide the video feed using visibility (prevents displacement)
  var videoFeed = document.getElementById("video_feed");
  videoFeed.style.visibility = "hidden";

  // Show "Entry Recorded" message in the right section
  var entryMessage = document.getElementById("entryMessage");
  entryMessage.style.display = "block";

  // Hide message after 5 seconds and show video feed again
  setTimeout(function () {
    entryMessage.style.display = "none";
    videoFeed.style.visibility = "visible"; // Show video feed again
  }, 5000);
});

// Function to update employee details on recognition
function updateEmployeeDetails(name, imageUrl) {
  let detailsDiv = document.getElementById("employee-details");
  let photo = document.getElementById("employee-photo");
  let nameText = document.getElementById("employee-name");

  photo.src = imageUrl;
  nameText.innerText = name;
  detailsDiv.classList.remove("hidden");
}

// Function to fetch recognized employee details
function checkRecognition() {
  fetch("/recognized_employee")
    .then((response) => response.json())
    .then((data) => {
      if (data.recognized) {
        updateEmployeeDetails(data.name, data.image_url);
        document.getElementById("Matched").style.display = "none";
        document.getElementById("NotMatched").style.display = "block";
      } else {
        document.getElementById("Matched").style.display = "block";
        document.getElementById("NotMatched").style.display = "none";
      }
    })
    .catch((error) => console.error("Error fetching recognition data:", error));
}

// Poll for recognized employee updates every 5 seconds
setInterval(checkRecognition, 5000);
