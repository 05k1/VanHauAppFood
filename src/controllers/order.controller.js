import sequelize from "../models/connect.js";
import initModels from "../models/init-models.js";

const model = initModels(sequelize);

const createOrder = async (req, res) => {
  try {
    const { user_id, food_id, amount } = req.body;
    if (!user_id || !food_id || !amount) {
      return res
        .status(400)
        .json({ message: "Thong tin dat hang khong day du" });
    }
    let data = await model.orders.create({ user_id, food_id, amount });
    return res.status(201).json({ message: "Order thanh cong", data });
  } catch (error) {
    return res.status(500).json({ message: "error" });
  }
};

export { createOrder };
