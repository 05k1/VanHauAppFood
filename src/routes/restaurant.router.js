import express from "express";
import {
  likeRestaurant,
  unlikeRestaurant,
  getListUserLike,
  rate,
  getListUserRate,
} from "../controllers/restaurant.controller.js";

const restaurantRoutes = express.Router();

restaurantRoutes.post("/:res_id/like", likeRestaurant);
restaurantRoutes.delete("/:res_id/unlike", unlikeRestaurant);
restaurantRoutes.get("/:res_id/list-users-like", getListUserLike);
restaurantRoutes.post("/:res_id/rate", rate);
restaurantRoutes.get("/:res_id/list-user-rate", getListUserRate);

export default restaurantRoutes;
