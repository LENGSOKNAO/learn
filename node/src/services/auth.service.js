import * as userRepo from "../repositories/user.repository.js";
import { hashPassword, comparePassword } from "../utils/hash.js";
import { generateToken } from "../utils/jwt.js";
import { AppError } from "../middlewares/error.middleware.js";

export const register = async (data) => {
  const existing = await userRepo.findByEmail(data.email);
  if (existing) throw new AppError("Email already registered", 409);

  const hashed = await hashPassword(data.password);
  const user = await userRepo.create({ ...data, password: hashed });

  const { password, ...userData } = user;
  const token = generateToken({ id: user.id, email: user.email, role: "user" });
  return { user: userData, token };
};

export const login = async (email, password) => {
  const user = await userRepo.findByEmail(email);
  if (!user) throw new AppError("Invalid email or password", 401);

  const valid = await comparePassword(password, user.password);
  if (!valid) throw new AppError("Invalid email or password", 401);

  const token = generateToken({ id: user.id, email: user.email, role: user.role });
  return {
    token,
    user: { id: user.id, email: user.email, username: user.username, role: user.role },
  };
};