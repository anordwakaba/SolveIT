const express = require("express");
const cors = require("cors");

const app = express();

// Allow the React frontend to communicate with our backend
app.use(cors());

// Allow the server to receive JSON data
app.use(express.json());

// Test route
app.get("/api/health", (req, res) => {
  res.json({
    message: "SolveIT backend is running!",
  });
});

// Start the server
const PORT = 5000;

app.listen(PORT, () => {
  console.log(`SolveIT server running on http://localhost:${PORT}`);
});