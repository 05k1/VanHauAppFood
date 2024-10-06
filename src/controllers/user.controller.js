import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const model = initModels(sequelize);

const getListResLike = async (req, res) => {
  try {
    let { user_id } = req.params;
    let user = await model.users.findByPk(user_id);
    if (!user) {
      return res.status(404).json({ message: "User khong ton tai" });
    }
    let { count, rows } = await model.like_res.findAndCountAll({
      where: {
        user_id,
      },
      attributes: [],
      include: [
        {
          model: model.restaurant,
          as: "re",
          attributes: ["res_name"],
        },
      ],
    });
    if (count == 0) {
      return res.status(404).json({ message: "User chua like nha hang nao" });
    }
    return res
      .status(200)
      .json({ message: "success", total: count, data: rows });
  } catch (error) {
    return res.status(500).json({ message: "error" });
  }
};

const getListResRate = async (req, res) => {
  try {
    let { user_id } = req.params;
    let user = await model.users.findByPk(user_id);
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }
    let { count, rows } = await model.rate_res.findAndCountAll({
      where: {
        user_id,
      },
      attributes: [],
      include: [
        {
          model: model.restaurant,
          as: "restaurant",
          attributes: ["res_name"],
        },
      ],
    });
    if (count == 0) {
      return res.status(404).json({ message: "User chua co danh gia" });
    }
    return res
      .status(200)
      .json({ message: "success", total: count, data: rows });
  } catch (error) {
    return res.status(500).json({ message: "error" });
  }
};

export { getListResLike, getListResRate };
