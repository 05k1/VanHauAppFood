import sequelize from "../models/connect.js";
import initModels from "../models/init-models.js";

const model = initModels(sequelize);

const likeRestaurant = async (req, res) => {
  try {
    let { res_id } = req.params;
    let { user_id } = req.body;
    let restaurant = await model.restaurant.findByPk(res_id);
    if (!restaurant) {
      return res.status(404).json({ message: "Nha hang khong ton tai" });
    }
    let data = await model.like_res.create({
      res_id,
      user_id,
    });
    return res.status(201).json({ message: "Da like thanh cong", data });
  } catch (error) {
    return res.status(500).json({ message: "error" });
  }
};

const unlikeRestaurant = async (req, res) => {
  try {
    let { res_id } = req.params;
    let { user_id } = req.body;
    let restaurant = await model.restaurant.findByPk(res_id);
    if (!restaurant) {
      return res.status(404).json({ message: "Nha hang khong ton tai" });
    }
    let data = await model.like_res.findOne({
      where: {
        res_id,
        user_id,
      },
    });
    if (!data) {
      return res.status(404).json({ message: "Khong tim thay ban ghi" });
    }
    await data.destroy();
    return res.status(200).json({ message: "Unlike thanh cong", data });
  } catch (error) {
    return res.status(500).json({ message: "error" });
  }
};

const getListUserLike = async (req, res) => {
  try {
    let { res_id } = req.params;
    let restaurant = await model.restaurant.findByPk(res_id);
    if (!restaurant) {
      return res.status(404).json({ message: "Nha hang khong ton tai" });
    }
    let { count, rows } = await model.like_res.findAndCountAll({
      where: {
        res_id,
      },
      attributes: [],
      include: [
        {
          model: model.users,
          as: "user",
          attributes: ["full_name"],
        },
      ],
    });
    if (count == 0) {
      return res
        .status(404)
        .json({ message: "Khong co user like nha hang nay" });
    }
    return res
      .status(200)
      .json({ message: "success", totalLike: count, data: rows });
  } catch (error) {
    return res.status(500).json({ message: "error" });
  }
};

const rate = async (req, res) => {
  try {
    let { res_id } = req.params;
    let { user_id, amount } = req.body;
    let restaurant = await model.restaurant.findByPk(res_id);
    if (!restaurant) {
      return res.status(404).json({ message: "Nha hang khong ton tai" });
    }
    let data = await model.rate_res.create({
      res_id,
      user_id,
      amount,
    });
    return res.status(201).json({ message: "success", data });
  } catch (error) {
    return res.status(500).json({ message: "error" });
  }
};

const getListUserRate = async (req, res) => {
  try {
    let { res_id } = req.params;
    let restaurant = await model.restaurant.findByPk(res_id);
    if (!restaurant) {
      return res.status(404).json({ message: "Nha hang khong ton tai" });
    }
    let { count, rows } = await model.rate_res.findAndCountAll({
      where: {
        res_id,
      },
      include: [
        {
          model: model.users,
          as: "user",
          attributes: ["full_name"],
        },
      ],
    });
    if (count == 0) {
      return res
        .status(404)
        .json({ message: "Nha hang chua co user danh gia" });
    }
    const total = rows.reduce((acc, cur) => {
      return acc + cur.amount;
    }, 0);
    const rating = (total / count).toFixed(1);
    return res.status(200).json({ message: "success", rating, data: rows });
  } catch (error) {
    return res.status(500).json({ message: "error" });
  }
};

export {
  likeRestaurant,
  unlikeRestaurant,
  getListUserLike,
  rate,
  getListUserRate,
};
