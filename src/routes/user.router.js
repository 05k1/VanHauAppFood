import express from "express";
import {
  getListResLike,
  getListResRate,
} from "../controllers/user.controller.js";

const userRoutes = express.Router();

userRoutes.get("/:user_id/get-list-like", getListResLike);
userRoutes.get("/:user_id/get-list-rate", getListResRate);

export default userRoutes;
