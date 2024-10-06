import express from "express";
import dotenv from "dotenv";
import rootRoutes from "./src/routes/root.router.js";

dotenv.config();

const app = express();

app.use(express.json());
app.use(rootRoutes);

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
