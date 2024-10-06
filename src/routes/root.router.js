import express from "express";
import restaurantRoutes from "./restaurant.router.js";
import userRoutes from "./user.router.js";
import orderRoutes from "./order.router.js";

const rootRoutes = express.Router();

rootRoutes.use("/users", userRoutes);
rootRoutes.use("/restaurants", restaurantRoutes);
rootRoutes.use("/orders", orderRoutes);

export default rootRoutes;
