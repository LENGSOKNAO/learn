const Product = require("../models/productModel");

exports.getAll = async (req, res, next) => {
  try {
    const products = await Product.getAll();
    res.json(products);
  } catch (err) {
    next(err);
  }
};

exports.getById = async (req, res, next) => {
  try {
    const product = await Product.getById(req.params.id);
    if (!product) return res.status(404).json({ message: "Product not found" });
    res.json(product);
  } catch (err) {
    next(err);
  }
};

exports.create = async (req, res, next) => {
  try {
    const { name, price } = req.body;
    const product = await Product.create(name, price);
    res.status(201).json(product);
  } catch (err) {
    next(err);
  }
};

exports.update = async (req, res, next) => {
  try {
    const { name, price } = req.body;
    const product = await Product.update(req.params.id, name, price);
    res.json(product);
  } catch (err) {
    next(err);
  }
};

exports.remove = async (req, res, next) => {
  try {
    await Product.remove(req.params.id);
    res.json({ message: "Product deleted" });
  } catch (err) {
    next(err);
  }
};
