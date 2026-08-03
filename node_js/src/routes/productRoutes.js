const { Router } = require("express");
const controller = require("../controllers/productController");
const auth = require("../middleware/authMiddleware");

const router = Router();

router.get("/", controller.getAll);
router.get("/:id", controller.getById);
router.post("/", auth, controller.create);
router.put("/:id", auth, controller.update);
router.delete("/:id", auth, controller.remove);

module.exports = router;
