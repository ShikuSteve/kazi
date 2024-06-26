import express from "express";

const app = express();

const port = 3000;

app.listen(port, () => {
  console.log(`🚀Kazi service listening at http://127.0.0.1:${port} `);
});
